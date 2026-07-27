# Learning Path — DevOps

> A suggested progression from beginner to confident practitioner. Each stage builds on the previous one. If a topic is listed but has no content yet, it's marked as ⏳ (coming soon).

## Stage 1: Foundations

Start where everything else begins — the tools and concepts that underpin every other skill in this portfolio.

- [Git Primer](../git/notes/0000-primer-git.md) — Version control is the bedrock of modern DevOps. Understand commits, branches, and remotes before you touch any other tool.
- [Docker Primer](../docker/notes/0000-primer-docker.md) — Containers package software with its environment. This primer explains images, containers, and why Docker exists in the first place.
- [CI/CD Concepts Primer](../docs/concepts/ci-cd-concepts/0000-primer-ci-cd-concepts.md) — Pipelines, triggers, and runners. The mental model that makes GitHub Actions (and any CI tool) make sense.
- [Cloud Computing Fundamentals Primer](../docs/concepts/cloud-computing-fundamentals/0000-primer-cloud-computing-fundamentals.md) — IaaS, PaaS, SaaS, regions, and why the cloud changed how we build infrastructure.
- [Container Fundamentals Primer](../docs/concepts/container-fundamentals/0000-primer-container-fundamentals.md) — Images, registries, volumes, and the kernel features that make containers portable.
- [Infrastructure as Code Primer](../docs/concepts/infrastructure-as-code/0000-primer-infrastructure-as-code.md) — Declarative config, state, drift, and modules. The foundation for Terraform and every other IaC tool.
- [Linux OS Fundamentals Primer](../docs/concepts/linux-os-fundamentals/0000-primer-linux-os-fundamentals.md) — Filesystems, processes, and permissions — the ground every container and server stands on.
- [Networking Basics Primer](../docs/concepts/networking-basics/0000-primer-networking-basics.md) — IPs, ports, DNS, and how traffic actually flows between services.
- [Scripting & Automation Primer](../docs/concepts/scripting-automation/0000-primer-scripting-automation.md) — Shell, Cron, idempotency, and the patterns that turn one-off commands into reliable automation.

## Stage 2: Core Tools

Once Git and Docker make sense, pick up the three tools that sit at the centre of most DevOps workflows.

- [Kubernetes Primer](../kubernetes/notes/0000-primer-kubernetes.md) — Container orchestration at scale. Learn what pods, deployments, and services actually mean.
- [Terraform Primer](../terraform/notes/0000-primer-terraform.md) — Declarative infrastructure as code. Understand providers, resources, and why this approach replaces manual provisioning.
- [GitHub Actions Primer](../github-actions/notes/0000-primer-github-actions.md) — Automation built into GitHub. Learn workflows, jobs, runners, and triggers.

## Stage 3: Building Skills

Apply the mental models with hands-on practice. Work through these in order — they build on the previous stage.

- [Git CLI Exploration](../git/notes/2026-06-16-explore-git-cli.md) — Branching, merging, remotes, and the commands you will use daily.
- [Git Quickstart Notes](../git/notes/2026-06-22-git-quickstart.md) — Set up your first remote repository and push a commit.
- [Git Branching, Merging, and Conflicts (2026-07-22)](../docs/concepts/git-version-control/scripts/2026-07-22-git-branching-merging-conflicts.sh) — Hands-on sandbox for practicing merge conflict resolution.
- [Common Git Mistakes (2026-07-20)](../git/notes/2026-07-20-common-git-mistakes.md) — Everyday Git pitfalls and how to fix them.
- [Common Rebase and Reset Patterns (2026-07-27)](../docs/concepts/git-version-control/snippets/2026-07-27-common-rebase-reset-patterns.sh) — Soft, mixed, and hard reset patterns plus rebase walkthroughs.
- [Branch, Merge, and Revert Workflow (2026-07-20)](../git/scripts/2026-07-20-branch-merge-revert-workflow.sh) — Hands-on practice with feature branches, merge commits, and reverts.
- [Clean Git History (2026-07-20)](../git/scripts/2026-07-20-clean-git-history.sh) — .gitignore audit and merge conflict recovery.
- [Git Reflog & Rebase (2026-07-20)](../git/scripts/2026-07-20-git-reflog-rebase.sh) — Interactive rebase and reflog recovery.
- [Docker CLI Notes](../docker/notes/2026-06-16-explore-docker-cli.md) — Build, run, and manage containers from the command line.
- [Docker Quickstart Notes](../docker/notes/2026-06-20-docker-quickstart.md) — Building your first image and running a container.
- [Install Docker Script](../docker/scripts/2026-06-16-install-docker.sh) — Docker installation smoke test.
- [First Container Port Map Script](../docker/scripts/2026-06-21-first-container-port-map.sh) — Run nginx and verify port mapping.
- [Configure Git Script](../git/scripts/configure-and-commit-first.sh) — Set up Git identity and push your first commit.
- [Common Loops, Conditions, and File Patterns (2026-07-27)](../docs/concepts/scripting-automation/snippets/2026-07-27-common-loops-conditions-file-patterns.sh) — Bash patterns for iterating arrays, branching on conditions, and processing files idempotently.

## Stage 4: Integration

Combine tools to build real infrastructure and pipelines. This is where the separate pieces start to feel like a system.

- [Docker Quickstart Walkthroughs](../docker/notes/2026-06-25-docker-quickstart-walkthrough.md) — Multi-stage builds and practical Dockerfile walkthroughs.
- [Docker Quickstart — What Tripped Me Up (2026-07-18)](../docker/notes/2026-07-18-docker-quickstart-tripped-me.md) — Latest quickstart notes with port mapping, volume mount, and debugging gotchas.
- [Dockerfile Antipatterns](../docker/docs/dockerfile-antipatterns.md) — Common Dockerfile mistakes and how to avoid them.
- [Multi-Stage vs Distroless vs Alpine](../docker/docs/multi-stage-vs-distroless-vs-alpine.md) — Comparing three strategies for reducing image size and attack surface.
- [Docker Workflow: Limits, Healthcheck, Cleanup](../docker/scripts/docker-workflow-limits-healthcheck-cleanup.sh) — Resource limits, HEALTHCHECK-driven startup order, and volume cleanup.
- [Automate Container Lifecycle](../docker/scripts/automating-container-lifecycle.sh) — Build, smoke-test, and tear down a Compose stack in one script.
- [Multi-Stage Python Webapp Dockerfile](../docker/dockerfiles/multi-stage-python-webapp.Dockerfile) — Python multi-stage build with pip dependencies.
- [Multi-Service Compose Config](../docker/configs/multi-service-compose.yaml) — Multi-container applications with Compose.
- [GHA Quickstart — What Tripped Me Up (2026-07-21)](../github-actions/notes/2026-07-21-gha-quickstart-tripped-me.md) — Workflow syntax, triggers, and debugging gotchas.
- [Minimal CI Workflow (2026-07-19)](../github-actions/configs/2026-07-19-minimal-ci-workflow.yaml) — GHA CI workflow with setup-python caching.
- [Debug Run-Name & Conditions (2026-07-19)](../github-actions/configs/2026-07-19-debug-run-name-conditions.yaml) — Run-name and conditional step examples.
- [Matrix Builds & Conditional Deploys](../github-actions/docs/matrix-builds-conditional-deploys.md) — Matrix strategies and conditional deployment patterns.
- [Reading Workflow Logs and Debugging (2026-07-19)](../github-actions/docs/2026-07-19-reading-workflow-logs-and-debugging.md) — How I learned to read logs and debug GHA failures.
- [Audit Failed Workflow Runs](../github-actions/scripts/audit-failed-workflow-runs.sh) — Audit failed GHA runs and identify root causes via gh CLI.
- [Validate Workflow Runs (2026-07-21)](../github-actions/scripts/2026-07-21-validate-workflow-runs.sh) — Validate GHA workflows from the command line with gh CLI.
- [Minimal CI Pipeline Script (2026-07-23)](../docs/concepts/ci-cd-concepts/scripts/2026-07-23-minimal-ci-pipeline.sh) — Hands-on sandbox for practicing CI pipeline mechanics.
- [CI/CD Workflow Overview (2026-07-19)](../docs/concepts/ci-cd-concepts/2026-07-19-ci-cd-workflow-overview.md) — Mapping the CI/CD pieces in this portfolio.
- [Terraform Directory Structure (2026-07-19)](../terraform/notes/2026-07-19-terraform-directory-structure.md) — How the terraform/ folder is organised and what each directory holds.
- [Terraform Version & Init (2026-07-19)](../terraform/notes/2026-07-19-terraform-version-init.md) — Terraform version check, init, and first-run walkthrough.
- [Terraform Init First-Run Notes (2026-07-14)](../terraform/notes/2026-07-14-terraform-init-first-run.md) — First-run `terraform init` behaviour, provider download, and `.terraform.lock.hcl`.
- [Install Terraform and Run Version (2026-07-19)](../terraform/notes/2026-07-19-install-terraform-and-run-version.md) — Terraform CLI install, init, and version verification.
- [Terraform State Files & Remote Backends (2026-07-22)](../terraform/docs/2026-07-22-terraform-state-files-remote-backends.md) — Remote state management, S3 backends, DynamoDB locking, and workspace isolation.
- [Variables, Outputs, and Dependencies (2026-07-22)](../terraform/configs/2026-07-22-variables-outputs-dependencies.hcl) — Terraform variables, output blocks, and explicit dependencies.
- [Common Modular and Versioned Configs (2026-07-27)](../docs/concepts/infrastructure-as-code/snippets/2026-07-27-common-modular-versioned-configs.hcl) — Reusable Terraform patterns with modules and version constraints.
- [Terraform Lifecycle (2026-07-22)](../terraform/scripts/2026-07-22-terraform-lifecycle.sh) — init, validate, plan, and apply end-to-end.
- [First Local File Resource (2026-07-19)](../terraform/configs/2026-07-19-first-local-file-resource.hcl) — Terraform local_file resource with content and filename.
- [Local Provider Config](../terraform/configs/local-provider.hcl) — Infrastructure configuration with Terraform.
- [Install Local Cluster Script](../kubernetes/scripts/install-local-cluster.sh) — Local K8s development environment with kind.
- [Minimal Deployment + Service (2026-07-21)](../kubernetes/manifests/2026-07-21-minimal-deployment-service.yaml) — Basic nginx Deployment with ClusterIP Service.
- [Inspecting Pods, Services, and Events (2026-07-19)](../kubernetes/docs/2026-07-19-inspecting-pods-services-events.md) — `kubectl get`, `describe`, and `logs` patterns for real-world debugging.
- [Troubleshoot Failing Deployments (2026-07-21)](../kubernetes/scripts/2026-07-21-troubleshoot-failing-deployment.sh) — Diagnose CrashLoopBackOff and ImagePullBackOff.
- [Debugging Port-Forward, Exec, and Logs (2026-07-21)](../kubernetes/snippets/2026-07-21-debugging-port-forward-exec-logs.sh) — Port-forward, exec into pods, tail logs.

## Stage 5: Mastery

Advanced patterns and production-ready configurations across the full stack.

- ⏳ GitOps workflows with full Kubernetes deployments
- ⏳ Advanced networking and service meshes
- ⏳ Secret management and CI/CD security hardening
- ⏳ Multi-environment Terraform with remote backends and workspace isolation
- ⏳ Container image security scanning and SBOM generation

## Progression Map

```
Stage 1 → Stage 2 → Stage 3 → Stage 4 → Stage 5
          ↓         ↓         ↓         ↓         ↓
   Concepts   →  Core     → Quickstart → Compose  → Advanced
(Cloud,      →  Tools    → CLI Notes  → K8s     → GitOps
 Container,   → (K8s,     → Branch/    → Install
  IaC,         Terraform,  → Conflict   → State
  Scripting)    GitHub     → Docker     → Multi-env
          ↓      Actions)    Port Map    GHA
   Git/Docker          ↓         ↓
   Primers       K8s Debug  K8s Debug
          ↓       (describe, (describe,
   Linux/Net     logs,        logs,
          ↓       events)     events)
   Networking
```
