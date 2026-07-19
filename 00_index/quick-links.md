# Quick Links

## I need to...

### Set up a tool
- [Install Docker](../docker/scripts/2026-06-16-install-docker.sh) — Install Docker Engine and run your first container
- [Configure Git](../git/scripts/configure-and-commit-first.sh) — Set up Git identity and make your first commit
- [Install Terraform](../terraform/scripts/2026-06-17-install-terraform.sh) — Install Terraform CLI and init your first project
- [Install Terraform and Run Version (2026-07-16)](../terraform/notes/2026-07-16-install-terraform-and-run-version.md) — Terraform CLI install, init, and version verification
- [Terraform Version & Init (2026-07-16)](../terraform/notes/2026-07-16-terraform-version-init.md) — Terraform version check, init, and first-run walkthrough
- [Install Local Kubernetes Cluster](../kubernetes/scripts/install-local-cluster.sh) — Set up kind for local development

### Understand a tool
- [Docker Primer](../docker/notes/0000-primer-docker.md) — Containers and images explained
- [Git Primer](../git/notes/0000-primer-git.md) — Version control fundamentals
- [GitHub Actions Primer](../github-actions/notes/0000-primer-github-actions.md) — Automation with GitHub workflows
- [Kubernetes Primer](../kubernetes/notes/0000-primer-kubernetes.md) — Container orchestration basics
- [Terraform Primer](../terraform/notes/0000-primer-terraform.md) — Infrastructure as Code introduction
- [CI/CD Concepts Primer](../docs/concepts/ci-cd-concepts/0000-primer-ci-cd-concepts.md) — Pipelines, triggers, and runners explained
- [Linux OS Fundamentals Primer](../docs/concepts/linux-os-fundamentals/0000-primer-linux-os-fundamentals.md) — Filesystem, processes, and permissions basics
- [Networking Basics Primer](../docs/concepts/networking-basics/0000-primer-networking-basics.md) — IP, ports, DNS, and how traffic flows
- [Kubernetes Quickstart — What Tripped Me Up (2026-07-10)](../kubernetes/notes/2026-07-10-k8s-quickstart-trials.md) — kind vs minikube gotchas, pod creation, and probes
- [Branch, Merge, and Revert Workflow (2026-07-09)](../git/scripts/2026-07-09-branch-merge-revert-workflow.sh) — Git branch, merge, and revert practice script

### Build and run a container
- [Multi-Service Compose](../docker/configs/multi-service-compose.yaml) — Web app with PostgreSQL setup
- [Minimal Multi-Stage Dockerfile](../docker/dockerfiles/minimal-multi-stage.Dockerfile) — Optimised image builds
- [Tagged Non-Root Dockerfile (2026-07-18)](../docker/dockerfiles/2026-07-18-tagged-nonroot.Dockerfile) — Multi-stage Dockerfile with pinned tag and non-root runtime user
- [Tagged Non-Root Dockerfile (2026-07-16)](../docker/dockerfiles/2026-07-16-tagged-nonroot.Dockerfile) — Multi-stage Dockerfile with pinned tag and non-root runtime user
- [Tagged Non-Root Dockerfile (2026-07-12)](../docker/dockerfiles/2026-07-12-tagged-nonroot.Dockerfile) — Multi-stage Dockerfile with pinned tag and non-root runtime user
- [Tagged Alpine Dockerfile (2026-07-09)](../docker/dockerfiles/2026-07-09-tagged-nonroot.Dockerfile) — Minimal Alpine multi-stage build with pinned tag and non-root runtime
- [Run Container Port Map Script (2026-07-18)](../docker/scripts/2026-07-18-run-container-port-map.sh) — Build and run Go container with port mapping
- [Run Container Port Map Script (2026-07-16)](../docker/scripts/2026-07-16-run-container-port-map.sh) — Build and run Go container with port 8084 mapping
- [Run Container Port Map Script (2026-07-12)](../docker/scripts/2026-07-12-run-container-port-map.sh) — Build and run Go container with port mapping
- [Port Map Script (2026-07-09)](../docker/scripts/2026-07-09-first-container-port-map.sh) — Build and run Alpine container with port 8082 mapping
- [Docker Quickstart — What Tripped Me Up (2026-07-16)](../docker/notes/2026-07-16-docker-quickstart-tripped-me.md) — Port mapping, volume mount, and debugging gotchas
- [Docker Quickstart — What Tripped Me Up (2026-07-08)](../docker/notes/2026-07-08-docker-quickstart-trials.md) — localhost vs service name, port conflicts, `.dockerignore`, and `latest`-tag gotchas
- [Docker Quickstart — What Tripped Me Up (2026-07-07)](../docker/notes/2026-07-07-docker-quickstart-tripped-me.md) — First-contact quickstart follow-up notes

### Automate with CI/CD
- [CI/CD Workflow Overview (2026-07-19)](../docs/concepts/2026-07-19-ci-cd-workflow-overview.md) — How CI/CD pipelines connect GitHub Actions, testing, and deployment
- [Minimal CI Workflow (2026-07-12)](../github-actions/configs/2026-07-12-minimal-ci-workflow.yaml) — GitHub Actions CI workflow with trigger and job setup
- [Minimal CI Workflow (2026-07-09)](../github-actions/configs/2026-07-09-minimal-ci-workflow.yaml) — Minimal GitHub Actions CI workflow config
- [CI Workflow Config](../github-actions/configs/ci-workflow.yaml) — Minimal GitHub Actions CI workflow
- [Reading Workflow Logs and Debugging Failures (2026-07-10)](../github-actions/docs/2026-07-10-reading-workflow-logs-and-debugging.md) — How I learned to read logs and debug GHA failures
- [GitHub Actions Quickstart — What Tripped Me Up (2026-07-09)](../github-actions/notes/2026-07-09-gha-quickstart-trials.md) — Workflow syntax, checkout action, and trigger gotchas
- [GitHub Actions UI Walkthrough](../github-actions/notes/2026-06-16-explore-gha-ui.md) — Exploring the GitHub Actions interface

### Provision infrastructure
- [Terraform Directory Structure (2026-07-19)](../terraform/notes/2026-07-19-terraform-directory-structure.md) — Terraform project layout, directory purposes, and WIP modules
- [Terraform Init First-Run Notes (2026-07-14)](../terraform/notes/2026-07-14-terraform-init-first-run.md) — First-run `terraform init` behaviour, provider download, and `.terraform.lock.hcl`
- [Terraform Version & Init (2026-07-16)](../terraform/notes/2026-07-16-terraform-version-init.md) — Terraform version check, init, and first-run walkthrough
- [Local File Resource (2026-07-16)](../terraform/configs/2026-07-16-local-file-resource.hcl) — Terraform local_file resource with content and filename attributes
- [First Local File Resource (2026-07-12)](../terraform/configs/2026-07-12-first-local-file-resource.hcl) — Minimal Terraform config with `local_file` resource
- [Local Provider Config](../terraform/configs/local-provider.hcl) — Minimal Terraform config with local provider
- [Install Terraform](../terraform/scripts/2026-06-17-install-terraform.sh) — Install Terraform and init first project

### Deploy on Kubernetes
- [Minimal Deployment + Service (2026-07-10)](../kubernetes/manifests/2026-07-10-minimal-deployment-service.yaml) — Basic nginx Deployment with ClusterIP Service
- [Inspecting Pods, Services, and Events (2026-07-12)](../kubernetes/docs/2026-07-12-inspecting-pods-services-events.md) — `kubectl get`, `describe`, and `logs` patterns for real-world debugging

### Troubleshoot
- [Reading Workflow Logs and Debugging Failures (2026-07-10)](../github-actions/docs/2026-07-10-reading-workflow-logs-and-debugging.md) — How I learned to read logs and debug GHA failures
- [Docker Quickstart Trip-Ups](../docker/notes/2026-06-26-docker-quickstart-trip-ups.md) — Common pitfalls and gotchas
- [Docker Quickstart — What Tripped Me Up (2026-07-08)](../docker/notes/2026-07-08-docker-quickstart-trials.md) — localhost vs service name, port conflicts, `.dockerignore`, and `latest`-tag gotchas
- [Git Undo/Stage/Commit/Push](../git/notes/2026-06-24-git-undo-stage-commit-push.md) — Fixing mistakes in Git workflow
- [Docker CLI Exploration](../docker/notes/2026-06-16-explore-docker-cli.md) — Command reference and examples
- [Inspecting Pods, Services, and Events (2026-07-12)](../kubernetes/docs/2026-07-12-inspecting-pods-services-events.md) — `kubectl get`, `describe`, and `logs` patterns for real-world debugging
