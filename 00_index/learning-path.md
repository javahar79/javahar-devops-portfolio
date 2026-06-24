# Learning Path — DevOps

> A suggested progression from beginner to confident practitioner. Each stage builds on the previous one. If a topic is listed but has no content yet, it's marked as ⏳ (coming soon).

## Stage 1: Foundations

Start with the concepts that every DevOps engineer should understand before touching the tools. These are the building blocks for everything else.

- [Git Primer](../git/notes/0000-primer-git.md) — Version control basics, why it matters, and how Git fits into a DevOps workflow.

## Stage 2: Core Tools

These tools are the day-to-day workhorses. They're accessible right away and form the backbone of modern DevOps practice.

- [Docker Primer](../docker/notes/0000-primer-docker.md) — Containers and images explained in plain language.
- [Git CLI Exploration](../git/notes/2026-06-16-explore-git-cli.md) — Branching, merging, remotes, and the commands you'll use every day.
- [Kubernetes Primer](../kubernetes/notes/0000-primer-kubernetes.md) — Container orchestration fundamentals and when you actually need it.
- [Terraform Primer](../terraform/notes/0000-primer-terraform.md) — Infrastructure as Code basics and why declarative config beats manual provisioning.

## Stage 3: Building Skills

Apply what you've learned with hands-on setup and early troubleshooting. This is where the lessons stick.

- [Git Quickstart Notes](../git/notes/2026-06-22-git-quickstart.md) — First repository setup and the remote workflow.
- [Docker Quickstart Notes](../docker/notes/2026-06-20-docker-quickstart.md) — Building your first image and running a container.
- [Docker Quickstart — What Tripped Me Up](../docker/notes/2026-06-21-docker-quickstart-trials.md) — First-run pitfalls and how to resolve them.
- [Docker Quickstart — Day Two](../docker/notes/2026-06-22-docker-quickstart.md) — Common pitfalls and how to resolve them.
- [Docker CLI Exploration](../docker/notes/2026-06-16-explore-docker-cli.md) — Build, run, and manage containers from the command line.
- [Install Docker Script](../docker/scripts/2026-06-16-install-docker.sh) — Docker installation smoke test.
- [Git Configure & First Commit Script](../git/scripts/configure-and-commit-first.sh) — Set up Git identity and push your first commit.

## Stage 4: Integration

Combine tools to build real infrastructure and pipelines. This is where the separate pieces start to feel like a system.

- [Docker Quickstart — Day Three (Multi-Service)](../docker/notes/2026-06-23-docker-quickstart.md) — Compose networking, volume mounts, Docker Hub push.
- [Minimal Multi-Stage Dockerfile](../docker/dockerfiles/minimal-multi-stage.Dockerfile) — Optimised image builds for production.
- [Non-Root Multi-Stage Dockerfile](../docker/dockerfiles/minimal-tagged-nonroot.Dockerfile) — Security-focused builds that avoid running as root.
- [Tagged Non-Root Dockerfile (2026-06-23)](../docker/dockerfiles/2026-06-23-tagged-nonroot.Dockerfile) — Tagged multi-stage build with non-root runtime.
- [Multi-Service Compose Config](../docker/configs/multi-service-compose.yaml) — Multi-container applications with Compose.
- [First Container Port Map (2026-06-21)](../docker/scripts/2026-06-21-first-container-port-map.sh) — Port mapping walkthrough.
- [Port Map Script (2026-06-23)](../docker/scripts/2026-06-23-run-container-port-map.sh) — Nginx port mapping end to end.
- [CI Workflow Config](../github-actions/configs/ci-workflow.yaml) — Automated testing and deployment with GitHub Actions.
- [Local Provider Config](../terraform/configs/local-provider.hcl) — Infrastructure configuration with Terraform.
- [Install Local Cluster Script](../kubernetes/scripts/install-local-cluster.sh) — Local K8s development environment with kind.
- [GitHub Actions UI Walkthrough](../github-actions/notes/2026-06-16-explore-gha-ui.md) — Exploring the GitHub Actions interface.
- [kubectl CLI Exploration](../kubernetes/notes/2026-06-16-explore-kubectl.md) — Managing Kubernetes clusters from the command line.
- [Install Terraform Script](../terraform/scripts/2026-06-17-install-terraform.sh) — Install Terraform and init your first project.

## Stage 5: Mastery

Advanced patterns and production-ready configurations across the full stack.

⏳ Advanced networking and service meshes
⏳ Secret management and CI/CD security hardening
⏳ GitOps workflows with full Kubernetes deployments

## Progression Map

```
Stage 1 → Stage 2 → Stage 3 → Stage 4 → Stage 5
     ↓         ↓         ↓         ↓         ↓
   Git    →  Docker   → Quickstart → Compose  → Advanced
     ↓         ↓         ↓         ↓         ↓
 GitHub   →  Images   → CLI Notes  → K8s     → Terraform
 Actions      Builds               Install
```
