# Quick Links

## I need to...

### Set up a tool
- [Install Docker](../docker/scripts/2026-06-16-install-docker.sh) — Install Docker Engine and run your first container
- [Configure Git](../git/scripts/configure-and-commit-first.sh) — Set up Git identity and make your first commit
- [Install Terraform](../terraform/scripts/2026-06-17-install-terraform.sh) — Install Terraform CLI and init your first project
- [Install Terraform and Run Version (2026-07-16)](../terraform/notes/2026-07-16-install-terraform-and-run-version.md) — Terraform CLI install, init, and version verification
- [Install Local Kubernetes Cluster](../kubernetes/scripts/install-local-cluster.sh) — Set up kind for local development

### Understand a tool
- [Docker Primer](../docker/notes/0000-primer-docker.md) — Containers and images explained
- [Git Primer](../git/notes/0000-primer-git.md) — Version control fundamentals
- [GitHub Actions Primer](../github-actions/notes/0000-primer-github-actions.md) — Automation with GitHub workflows
- [Kubernetes Primer](../kubernetes/notes/0000-primer-kubernetes.md) — Container orchestration basics
- [Terraform Primer](../terraform/notes/0000-primer-terraform.md) — Infrastructure as Code introduction
- [CI/CD Concepts Primer](../docs/concepts/ci-cd-concepts/0000-primer-ci-cd-concepts.md) — Pipelines, triggers, and runners explained
- [Scripting & Automation Primer](../docs/concepts/scripting-automation/0000-primer-scripting-automation.md) — Scripts, cron, idempotency, and automation patterns
- [Linux OS Fundamentals Primer](../docs/concepts/linux-os-fundamentals/0000-primer-linux-os-fundamentals.md) — Filesystem, processes, and permissions basics
- [Networking Basics Primer](../docs/concepts/networking-basics/0000-primer-networking-basics.md) — IP, ports, DNS, and how traffic flows
- [Git Version Control Primer](../docs/concepts/git-version-control/0000-primer-git-version-control.md) — Repository, commit, branch, and remote fundamentals

### Build and run a container
- [Multi-Service Compose](../docker/configs/multi-service-compose.yaml) — Web app with PostgreSQL setup
- [Minimal Multi-Stage Dockerfile](../docker/dockerfiles/minimal-multi-stage.Dockerfile) — Optimised image builds
- [Tagged Non-Root Dockerfile (2026-07-18)](../docker/dockerfiles/2026-07-18-tagged-nonroot.Dockerfile) — Multi-stage Dockerfile with pinned tag and non-root runtime user
- [Tagged Non-Root Dockerfile (2026-07-16)](../docker/dockerfiles/2026-07-16-tagged-nonroot.Dockerfile) — Multi-stage Dockerfile with pinned tag and non-root runtime user
- [Run Container Port Map Script (2026-07-18)](../docker/scripts/2026-07-18-run-container-port-map.sh) — Build and run Go container with port mapping
- [Docker Quickstart — What Tripped Me Up (2026-07-18)](../docker/notes/2026-07-18-docker-quickstart-tripped-me.md) — Port mapping, volume mount, and debugging gotchas

### Automate with CI/CD
- [CI/CD Workflow Overview (2026-07-19)](../docs/concepts/ci-cd-concepts/2026-07-19-ci-cd-workflow-overview.md) — How CI/CD pipelines connect GitHub Actions, testing, and deployment
- [Minimal CI Workflow (2026-07-12)](../github-actions/configs/2026-07-12-minimal-ci-workflow.yaml) — GitHub Actions CI workflow with trigger and job setup
- [Minimal CI Workflow (2026-07-09)](../github-actions/configs/2026-07-09-minimal-ci-workflow.yaml) — Minimal GitHub Actions CI workflow config
- [CI Workflow Config](../github-actions/configs/ci-workflow.yaml) — Automated testing and deployment with GitHub Actions
- [Reading Workflow Logs and Debugging Failures (2026-07-10)](../github-actions/docs/2026-07-10-reading-workflow-logs-and-debugging.md) — How I learned to read logs and debug GHA failures
- [Validate Workflow Runs (2026-07-21)](../github-actions/scripts/2026-07-21-validate-workflow-runs.sh) — Validate GHA workflows from the command line
- [GitHub Actions Quickstart — What Tripped Me Up (2026-07-09)](../github-actions/notes/2026-07-09-gha-quickstart-trials.md) — Workflow syntax, checkout action, and trigger gotchas
- [GitHub Actions UI Walkthrough](../github-actions/notes/2026-06-16-explore-gha-ui.md) — Exploring the GitHub Actions interface

### Provision infrastructure
- [Terraform State Files & Remote Backends (2026-07-22)](../terraform/docs/2026-07-22-terraform-state-files-remote-backends.md) — S3 backends, DynamoDB locking, and workspace isolation
- [Variables, Outputs, and Dependencies (2026-07-22)](../terraform/configs/2026-07-22-variables-outputs-dependencies.hcl) — Terraform variables, outputs, and resource dependencies
- [Terraform Lifecycle Script (2026-07-22)](../terraform/scripts/2026-07-22-terraform-lifecycle.sh) — Terraform init, plan, apply, and destroy workflow
- [What I Learned from Validate and Plan (2026-07-21)](../terraform/notes/2026-07-21-what-i-learned-from-validate-and-plan.md) — `terraform validate` and `plan` before applying
- [What Tripped Me Up — Terraform Quickstart (2026-07-21)](../terraform/notes/2026-07-21-what-tripped-me-up-quickstart.md) — Init-order and directory mistakes
- [Terraform Directory Structure (2026-07-19)](../terraform/notes/2026-07-19-terraform-directory-structure.md) — Terraform project layout, directory purposes, and WIP modules
- [Terraform Version & Init (2026-07-16)](../terraform/notes/2026-07-16-terraform-version-init.md) — Terraform version check, init, and first-run walkthrough
- [Local File Resource (2026-07-16)](../terraform/configs/2026-07-16-local-file-resource.hcl) — Terraform local_file resource with content and filename attributes
- [Local Provider Config](../terraform/configs/local-provider.hcl) — Minimal Terraform config with local provider
- [Install Terraform](../terraform/scripts/2026-06-17-install-terraform.sh) — Install Terraform and init first project

### Deploy on Kubernetes
- [Minimal Deployment + Service (2026-07-21)](../kubernetes/manifests/2026-07-21-minimal-deployment-service.yaml) — Deploy nginx with a ClusterIP Service
- [Inspecting Pods, Services, and Events (2026-07-19)](../kubernetes/docs/2026-07-19-inspecting-pods-services-events.md) — `kubectl get`, `describe`, and `logs` patterns for real-world debugging
- [Troubleshoot Failing Deployments (2026-07-21)](../kubernetes/scripts/2026-07-21-troubleshoot-failing-deployment.sh) — Diagnose CrashLoopBackOff and ImagePullBackOff

### Troubleshoot
- [Git Common Mistakes (2026-07-20)](../git/notes/2026-07-20-common-git-mistakes.md) — Mistakes to avoid in Git workflow
- [Git Undo/Stage/Commit/Push](../git/notes/2026-06-24-git-undo-stage-commit-push.md) — Fixing mistakes in Git workflow
- [Git Branching, Merging, and Conflicts (2026-07-22)](../docs/concepts/git-version-control/scripts/2026-07-22-git-branching-merging-conflicts.sh) — Hands-on merge-conflict resolution and recovery
- [Docker Quickstart Trip-Ups](../docker/notes/2026-06-26-docker-quickstart-trip-ups.md) — Common pitfalls and gotchas
- [Docker Quickstart — What Tripped Me Up (2026-07-08)](../docker/notes/2026-07-08-docker-quickstart-trials.md) — localhost vs service name, port conflicts, `.dockerignore`, and `latest`-tag gotchas
- [Docker CLI Exploration](../docker/notes/2026-06-16-explore-docker-cli.md) — Command reference and examples
- [Reading Workflow Logs and Debugging Failures (2026-07-10)](../github-actions/docs/2026-07-10-reading-workflow-logs-and-debugging.md) — How I learned to read logs and debug GHA failures
- [Inspecting Pods, Services, and Events (2026-07-12)](../kubernetes/docs/2026-07-12-inspecting-pods-services-events.md) — `kubectl get`, `describe`, and `logs` patterns for real-world debugging
