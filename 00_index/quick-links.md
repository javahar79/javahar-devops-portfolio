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

### Build and run a container
- [Multi-Service Compose](../docker/configs/multi-service-compose.yaml) — Web app with PostgreSQL setup
- [Minimal Multi-Stage Dockerfile](../docker/dockerfiles/minimal-multi-stage.Dockerfile) — Optimised image builds
- [Tagged Build Dockerfile (2026-07-01)](../docker/dockerfiles/2026-07-01-trying-tagged-build.Dockerfile) — Self-contained Python multi-stage build with non-root user
- [Port Map Script (2026-07-01)](../docker/scripts/2026-07-01-run-container-port-map.sh) — Build and run Python server with port mapping
- [Docker Quickstart — What Tripped Me Up (2026-07-04)](../docker/notes/2026-07-04-docker-quickstart-trials.md) — Step-by-step quickstart with volume, compose, and layer caching gotchas
- [Tagged Build Non-Root Dockerfile (2026-07-04)](../docker/dockerfiles/2026-07-04-tagged-nonroot.Dockerfile) — Multi-stage Python build with non-root runtime
- [Port Map Script (2026-07-04)](../docker/scripts/2026-07-04-first-container-port-map.sh) — Build and run Python container with port 8080 mapping

### Automate with CI/CD
- [CI Workflow Config](../github-actions/configs/ci-workflow.yaml) — Minimal GitHub Actions CI workflow
- [Repo Lint Workflow](../.github/workflows/lint.yml) — GitHub Actions linting workflow for the repo
- [GitHub Actions UI Walkthrough](../github-actions/notes/2026-06-16-explore-gha-ui.md) — Exploring the GitHub Actions interface

### Provision infrastructure
- [Local Provider Config](../terraform/configs/local-provider.hcl) — Minimal Terraform config with local provider
- [Install Terraform](../terraform/scripts/2026-06-17-install-terraform.sh) — Install Terraform and init first project

### Troubleshoot
- [Docker Quickstart Trip-Ups](../docker/notes/2026-06-26-docker-quickstart-trip-ups.md) — Common pitfalls and gotchas
- [Git Undo/Stage/Commit/Push](../git/notes/2026-06-24-git-undo-stage-commit-push.md) — Fixing mistakes in Git workflow
- [Docker CLI Exploration](../docker/notes/2026-06-16-explore-docker-cli.md) — Command reference and examples
