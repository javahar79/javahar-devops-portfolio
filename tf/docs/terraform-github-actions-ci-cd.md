---
last_verified: 2026-08-10
tool_version: n/a
sources:
  - https://rmsmeta.com/blog/git-and-devops-ci-cd-integration
  - https://semaphore.io/blog/how-to-integrate-ci-cd-with-gitops-tools-like-argo-cd-or-flux
  - https://akuity.io/blog/gitops-best-practices-whitepaper
  - https://clankercloud.ai/blog/iac-kubernetes-practical-patterns-2026
---

# Integrating Terraform with GitHub Actions for CI/CD pipeline

> How Terraform infrastructure changes flow through GitHub Actions, with notes on separating plan, apply, and environment promotion.

## Purpose

Terraform manages infrastructure as code, but running it manually means infrastructure changes bypass the same review, testing, and audit trail that application code enjoys. Integrating Terraform with GitHub Actions moves infrastructure changes into the same pull-request workflow that teams already use for application code, so every plan is reviewed and every apply is traceable.

## How the integration works

The core pattern is straightforward: GitHub Actions runs Terraform in a job triggered by Git events. On pull requests, the workflow runs a plan and posts the output as a comment or check. On merge to a protected branch, the workflow runs an apply. This keeps infrastructure changes inside the Git history that the team already uses for collaboration.

Three separation points matter. First, keep the plan and apply in separate jobs or separate workflows so that a plan can be reviewed before any apply runs. Second, scope secrets and cloud credentials to the minimum permissions the workflow needs — this is consistent with the broader Git + CI/CD practice of keeping secrets out of source control and injecting them at runtime. Third, treat infrastructure state with the same care as application code: lock state files, require pull-request reviews for state changes, and tag releases so that a specific commit always maps to a specific infrastructure version. The key principle is that CI updates Git and a separate controller reconciles from there, rather than CI deploying directly [source: https://semaphore.io/blog/how-to-integrate-ci-cd-with-gitops-tools-like-argo-cd-or-flux].

Git is the backbone of most DevOps workflows, and when integrated tightly with CI/CD, every change is tracked, tested, and deployed in a repeatable way [source: https://rmsmeta.com/blog/git-and-devops-ci-cd-integration]. Terraform fits naturally into this model because its state file and configuration both live in Git.

## Steps

### 1. Store Terraform state remotely

Before automating Terraform in CI, the state file must live somewhere the runner can reach it but the team can still audit. A remote backend such as an S3-compatible object store with a locking mechanism (for example, DynamoDB) is the common choice. The recommended pattern uses separate Terraform and Helm directories: Terraform manages cloud resources while Helm manages application deployments inside the cluster [source: https://clankercloud.ai/blog/iac-kubernetes-practical-patterns-2026]. The backend configuration goes in a `backend` block inside the Terraform configuration, and the CI runner must have credentials that let it read and write that state.

### 2. Scope cloud credentials for the runner

GitHub Actions authenticates to the cloud provider with a credential that has just enough permission to run Terraform. For AWS, this is typically an IAM role the runner assumes via OIDC rather than long-lived access keys stored in the repository. The role should allow the specific actions Terraform needs — reading and writing state, creating or updating the resources in the plan — and nothing broader.

### 3. Write the plan workflow

A plan workflow runs on pull requests. It checks out the repository, installs Terraform, initializes the backend, runs `terraform plan`, and exports the plan output. Many teams post the plan as a comment on the pull request or fail the check if the plan includes destroys. The key is that the plan runs on every change, so reviewers see exactly what will happen before they approve.

### 4. Write the apply workflow

An apply workflow runs on merge to the target branch. It reuses the same initialization and backend configuration, runs `terraform apply` against the saved plan, and reports success or failure. The apply should not run on arbitrary branches; protected branches and required reviews keep the team from applying unreviewed changes.

### 5. Add a promote step for environment changes

In a multi-environment setup, the pattern is to plan and apply against each environment separately. The same Terraform configuration can target dev, staging, and other environments by using workspaces or separate state prefixes. The CI pipeline promotes a validated plan through each environment in sequence, rather than running independent plans that might drift.

## Verify

After the workflows are in place, confirm the end-to-end flow by opening a pull request that changes a resource count or tag. The plan check should appear on the pull request and show the exact diff. Merge the pull request, and the apply workflow should run and update the infrastructure. Finally, run `terraform plan` locally against the same workspace and confirm the output matches what the CI run reported, which proves the remote state and local state are in sync.

## What I'd try next

- Add a policy-as-code check that blocks plans introducing unacceptable changes
- Explore the Rendered Manifests pattern, where CI renders final manifests and stores them in Git so that GitOps controllers can reconcile from a known desired state [source: https://akuity.io/blog/gitops-best-practices-whitepaper]
- Study the separation between Infrastructure (Terraform), Application, and GitOps concerns so that each pipeline has a single responsibility
