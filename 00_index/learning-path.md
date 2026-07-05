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
- [GitHub Actions Primer](../github-actions/notes/0000-primer-github-actions.md) — Automation with GitHub workflows.

## Stage 3: Building Skills

Apply what you've learned with hands-on setup and early troubleshooting. This is where the lessons stick.

- [Git Quickstart Notes](../git/notes/2026-06-22-git-quickstart.md) — First repository setup and the remote workflow.
- [Git Undo, Stage, Commit, Push](../git/notes/2026-06-24-git-undo-stage-commit-push.md) — Working through the basic Git workflow, including undoing mistakes.
- [Docker Quickstart Notes](../docker/notes/2026-06-20-docker-quickstart.md) — Building your first image and running a container.
- [Docker Quickstart — What Tripped Me Up](../docker/notes/2026-06-21-docker-quickstart-trials.md) — First-run pitfalls and how to resolve them.
- [Docker Quickstart Trials (2026-07-04)](../docker/notes/2026-07-04-docker-quickstart-trials.md) — Step-by-step quickstart with volume, compose, and layer caching gotchas.
- [Docker CLI Exploration](../docker/notes/2026-06-16-explore-docker-cli.md) — Build, run, and manage containers from the command line.
- [Install Docker Script](../docker/scripts/2026-06-16-install-docker.sh) — Docker installation smoke test.
- [First Container Port Map Script](../docker/scripts/2026-06-21-first-container-port-map.sh) — Run nginx and verify port mapping.
- [Configure Git Script](../git/scripts/configure-and-commit-first.sh) — Set up Git identity and push your first commit.

## Stage 4: Integration

Combine tools to build real infrastructure and pipelines. This is where the separate pieces start to feel like a system.

- [Docker Quickstart — Day Three (Multi-Service)](../docker/notes/2026-06-23-docker-quickstart.md) — Compose networking, volume mounts, Docker Hub push.
- [Docker Quickstart Walkthrough](../docker/notes/2026-06-25-docker-quickstart-walkthrough.md) — Guided walkthrough covering build, run, tag, and push.
- [Following Docker Quickstart (2026-07-01)](../docker/notes/2026-07-01-following-docker-quickstart.md) — What tripped me up on the official getting-started guide.
- [Port Map Script (2026-07-04)](../docker/scripts/2026-07-04-first-container-port-map.sh) — Build and run Python container with port mapping.
- [Port Map Script (2026-07-01)](../docker/scripts/2026-07-01-run-container-port-map.sh) — Build and run Python server with port mapping.
- [Multi-Service Compose Config](../docker/configs/multi-service-compose.yaml) — Multi-container applications with Compose.
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
Stage 1 -> Stage 2 -> Stage 3 -> Stage 4 -> Stage 5
      |         |         |         |         |
    Git    ->  Docker   -> Quickstart -> Compose  -> Advanced
      |         |         |         |         |
  GitHub   ->  Images   -> CLI Notes  -> K8s     -> Terraform
  Actions      Builds               Install
```
