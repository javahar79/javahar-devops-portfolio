# Quick Links

## I need to...

### Set up a tool
- [Install Docker](../docker/scripts/2026-06-16-install-docker.sh) — Install Docker Engine and run your first container
- [Configure Git](../git/scripts/configure-and-commit-first.sh) — Set up Git identity and make your first commit
- [Install Terraform](../terraform/scripts/2026-06-17-install-terraform.sh) — Install Terraform CLI and init your first project
- [Install Local Kubernetes Cluster](../kubernetes/scripts/install-local-cluster.sh) — Set up kind for local development

### Understand a tool
- [Docker Primer](../docker/notes/0000-primer-docker.md) — Containers and images explained
- [Git Primer](../git/notes/0000-primer-git.md) — Version control fundamentals
- [GitHub Actions Primer](../github-actions/notes/0000-primer-github-actions.md) — Automation with GitHub workflows
- [Kubernetes Primer](../kubernetes/notes/0000-primer-kubernetes.md) — Container orchestration basics
- [Terraform Primer](../terraform/notes/0000-primer-terraform.md) — Infrastructure as Code introduction
- [Kubernetes Quickstart — What Tripped Me Up (2026-07-10)](../kubernetes/notes/2026-07-10-k8s-quickstart-trials.md) — kind vs minikube gotchas, pod creation, and probes
- [Branch, Merge, and Revert Workflow (2026-07-09)](../git/scripts/2026-07-09-branch-merge-revert-workflow.sh) — Git branch, merge, and revert practice script

### Build and run a container
- [Multi-Service Compose](../docker/configs/multi-service-compose.yaml) — Web app with PostgreSQL setup
- [Minimal Multi-Stage Dockerfile](../docker/dockerfiles/minimal-multi-stage.Dockerfile) — Optimised image builds
- [Tagged Build Dockerfile (2026-07-08)](../docker/dockerfiles/2026-07-08-tagged-nonroot.Dockerfile) — Multi-stage Python build with pinned tag and non-root runtime
- [Port Map Script (2026-07-08)](../docker/scripts/2026-07-08-first-container-port-map.sh) — Build and run Python container with port 8081 mapping
- [Tagged Build Non-Root Dockerfile (2026-07-09)](../docker/dockerfiles/2026-07-09-tagged-nonroot.Dockerfile) — Minimal Alpine multi-stage build with pinned tag and non-root runtime
- [Port Map Script (2026-07-09)](../docker/scripts/2026-07-09-first-container-port-map.sh) — Build and run Alpine container with port 8082 mapping
- [Docker Quickstart — What Tripped Me Up (2026-07-08)](../docker/notes/2026-07-08-docker-quickstart-trials.md) — localhost vs service name, port conflicts, `.dockerignore`, and `latest`-tag gotchas
- [Docker Quickstart — What Tripped Me Up (2026-07-07)](../docker/notes/2026-07-07-docker-quickstart-tripped-me.md) — First-contact quickstart follow-up notes
- [Port Map Script (2026-07-07)](../docker/scripts/2026-07-07-port-map-container.sh) — Build and run Python container with port mapping

### Automate with CI/CD
- [Reading Workflow Logs and Debugging Failures (2026-07-10)](../github-actions/docs/2026-07-10-reading-workflow-logs-and-debugging.md) — How I learned to read logs and debug GHA failures
- [Minimal CI Workflow (2026-07-09)](../github-actions/configs/2026-07-09-minimal-ci-workflow.yaml) — Minimal GitHub Actions CI workflow config
- [CI Workflow Config](../github-actions/configs/ci-workflow.yaml) — Minimal GitHub Actions CI workflow
- [GitHub Actions Quickstart — What Tripped Me Up (2026-07-09)](../github-actions/notes/2026-07-09-gha-quickstart-trials.md) — Workflow syntax, checkout action, and trigger gotchas
- [GitHub Actions UI Walkthrough](../github-actions/notes/2026-06-16-explore-gha-ui.md) — Exploring the GitHub Actions interface

### Provision infrastructure
- [Local Provider Config](../terraform/configs/local-provider.hcl) — Minimal Terraform config with local provider
- [Install Terraform](../terraform/scripts/2026-06-17-install-terraform.sh) — Install Terraform and init first project

### Deploy on Kubernetes
- [Minimal Deployment + Service (2026-07-10)](../kubernetes/manifests/2026-07-10-minimal-deployment-service.yaml) — Basic nginx Deployment with ClusterIP Service

### Troubleshoot
- [Reading Workflow Logs and Debugging Failures (2026-07-10)](../github-actions/docs/2026-07-10-reading-workflow-logs-and-debugging.md) — How I learned to read logs and debug GHA failures
- [Docker Quickstart Trip-Ups](../docker/notes/2026-06-26-docker-quickstart-trip-ups.md) — Common pitfalls and gotchas
- [Git Undo/Stage/Commit/Push](../git/notes/2026-06-24-git-undo-stage-commit-push.md) — Fixing mistakes in Git workflow
- [Docker CLI Exploration](../docker/notes/2026-06-16-explore-docker-cli.md) — Command reference and examples
