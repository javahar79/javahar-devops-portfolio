---
last_verified: 2026-07-31
tool_version: n/a
sources:
  - https://ledwith.tech/blog/2025/07/25/integrating-cicd-iac-automation
  - https://totalcloudai.com/blog/devops-cicd-best-practices-2026
  - https://codelucky.com/ci-cd-pipeline-beginners-guide-with-examples/
  - https://www.portainer.io/blog/ci-cd-vs-gitops
---

# Combining CI/CD with Infrastructure as Code for state-aware pipelines

## Purpose

A state-aware pipeline treats two fundamentally different kinds of change with
two different lifecycles: infrastructure changes are stateful and slow to recover,
while application changes are stateless and fast to roll. This doc sketches how
CI/CD and Infrastructure as Code (IaC) can be combined so a single change flows
through both lifecycles without one blocking or clobbering the other. This is one
way to wire it together; readers should adjust the boundaries to their own blast
radius and review gates.

## Why state awareness matters

Most CI/CD tutorials treat every push as an application deploy. That assumption
breaks down the moment infrastructure lives in the same repository: `terraform
apply` and `kubectl set image` keep very different state, and a rollback for one
is not a rollback for the other. If the pipeline can tell *this change touches
IaC* from *this change touches app code*, it can apply the matching strategy — plan
and approve for infrastructure, rolling update for applications.

## A four-layer integration stack

A workable design separates concerns across four layers:

1. **CI/CD** builds, tests, and pushes application artifacts (for example a Docker
   image) and can also run `terraform plan` so infrastructure changes surface for
   review.
2. **IaC** provisions the underlying platform: clusters, networks, databases
   (for example Terraform or OpenTofu).
3. **GitOps** reconciles the cluster toward the desired state declared in Git
   (for example ArgoCD or Flux).
4. **Observability** closes the loop with metrics, logs, and alerts
   (for example Prometheus/Grafana).

The canonical chain is GitHub Actions + Terraform + ArgoCD + Prometheus/Grafana.

## One pipeline, two lifecycles

The central idea is that IaC transitions are stateful (plan, then apply), whereas
application deployments are stateless rollouts [ledwith](https://ledwith.tech/blog/2025/07/25/integrating-cicd-iac-automation).
Bundling every change into a single job forces application developers to wait on the
slower, higher-risk IaC step. Separating the lifecycles — while still coordinating
them — keeps each fast and independent. A representative combined flow looks like
this:

```
validate IaC → plan → approve → apply → build app → test → deploy → smoke checks
```

The ordering above reflects the "one pipeline, two lifecycles" split: IaC goes
through plan/approve/apply (stateful), while the app goes through build/test/deploy
(stateless), with the two joined at smoke checks. Placing the quickest checks (lint,
unit tests) first means a broken commit fails in seconds rather than after a long
IaC apply [codelucky](https://codelucky.com/ci-cd-pipeline-beginners-guide-with-examples/).

## Progressive delivery is a state question too

What "undo" looks like depends on how much of the new version is live. Canary
routes 5–10% of traffic to the new version first, blue-green keeps two full
environments and switches instantly, and automated rollback triggers when an
error-rate threshold is breached [totalcloudai](https://totalcloudai.com/blog/devops-cicd-best-practices-2026).
Tying these to the pipeline — rather than ad-hoc `kubectl rollout undo` — is what
keeps the "current known-good state" explicit and reproducible.

## GitOps is a delivery model, not just a stage

GitOps is easy to confuse with CI/CD because both move code forward. The difference
is where the control plane lives: CI/CD pushes from outside the cluster trust
boundary, whereas GitOps (ArgoCD/Flux) reconciles from inside it. For state-aware
pipelines this matters, because both the IaC state backend (Terraform or OpenTofu
state) and the GitOps declarative state must be reconciled — not just the workload
[portainer](https://www.portainer.io/blog/ci-cd-vs-gitops).

## Verify

After wiring the stack, confirm each layer independently:

1. `terraform plan` shows an empty diff on an idempotent apply, meaning
   infrastructure is already in the desired state.
2. `argocd app wait <app> --sync` reaches `Synced` and `Healthy`.
3. A smoke check (`curl` against the service) returns the expected status code.
4. The observability stack shows no new alert firing for the rolled-out revision.

## When this approach fits

This pays off most when infrastructure and application changes share a repository
or release cadence. If IaC changes rarely and application changes often, splitting
into a platform pipeline and an app pipeline may be simpler — the four-layer stack
above still applies, just with looser coupling between layers.
