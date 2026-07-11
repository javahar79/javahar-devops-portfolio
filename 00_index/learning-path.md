# Learning Path — DevOps

> A suggested progression from beginner to confident practitioner. Each stage builds on the previous one. If a topic is listed but has no content yet, it's marked as ⏳ (coming soon).

## Stage 1: Foundations

Start with the concepts that every DevOps engineer should understand before touching the tools. Version control is the bedrock — everything else builds on it.

- [Git Primer](../git/notes/0000-primer-git.md) — Version control basics, why it matters, and how Git fits into a DevOps workflow.
- [Docker Primer](../docker/notes/0000-primer-docker.md) — Containers and images explained in plain language.

## Stage 2: Core Tools

These are the day-to-day tools you'll reach for first. Each primer gives you the mental model before you type any commands.

- [Kubernetes Primer](../kubernetes/notes/0000-primer-kubernetes.md) — Container orchestration fundamentals and when you actually need it.
- [Terraform Primer](../terraform/notes/0000-primer-terraform.md) — Infrastructure as Code basics and why declarative config beats manual provisioning.
- [GitHub Actions Primer](../github-actions/notes/0000-primer-github-actions.md) — Automation with GitHub workflows.

## Stage 3: Building Skills

Apply what you've learned with hands-on setup and early troubleshooting. This is where the lessons stick.

- [Git CLI Exploration](../git/notes/2026-06-16-explore-git-cli.md) — Branching, merging, remotes, and the commands you'll use every day.
- [Git Quickstart Notes](../git/notes/2026-06-22-git-quickstart.md) — First repository setup and the remote workflow.
- [Git Undo, Stage, Commit, Push](../git/notes/2026-06-24-git-undo-stage-commit-push.md) — Working through the basic Git workflow, including undoing mistakes.
- [Branch, Merge, and Revert Workflow (2026-07-09)](../git/scripts/2026-07-09-branch-merge-revert-workflow.sh) — Hands-on practice with feature branches, merge commits, and reverts.
- [Docker Quickstart Notes](../docker/notes/2026-06-20-docker-quickstart.md) — Building your first image and running a container.
- [Docker CLI Notes](../docker/notes/2026-06-16-explore-docker-cli.md) — Build, run, and manage containers from the command line.
- [Install Docker Script](../docker/scripts/2026-06-16-install-docker.sh) — Docker installation smoke test.
- [First Container Port Map Script](../docker/scripts/2026-06-21-first-container-port-map.sh) — Run nginx and verify port mapping.
- [Configure Git Script](../git/scripts/configure-and-commit-first.sh) — Set up Git identity and push your first commit.
- [Kubernetes Quickstart Trials (2026-07-10)](../kubernetes/notes/2026-07-10-k8s-quickstart-trials.md) — First-contact gotchas: `run` vs `create deployment`, `ContainerCreating` delays, and `port-forward`.

## Stage 4: Integration

Combine tools to build real infrastructure and pipelines. This is where the separate pieces start to feel like a system.

- [Docker Quickstart — What Tripped Me Up (2026-07-08)](../docker/notes/2026-07-08-docker-quickstart-trials.md) — Step-by-step quickstart with volume, compose, and layer caching gotchas.
- [Docker Quickstart — What Tripped Me Up (2026-07-07)](../docker/notes/2026-07-07-docker-quickstart-tripped-me.md) — First-contact quickstart follow-up notes.
- [Docker Quickstart Trials (2026-07-07)](../docker/notes/2026-07-07-docker-quickstart-trials.md) — More quickstart follow-up trials.
- [Tagged Non-Root Dockerfile (2026-07-09)](../docker/dockerfiles/2026-07-09-tagged-nonroot.Dockerfile) — Minimal Alpine multi-stage build with pinned tag and non-root runtime.
- [Port Map Script (2026-07-09)](../docker/scripts/2026-07-09-first-container-port-map.sh) — Build and run Alpine container with port 8082 mapping.
- [Multi-Service Compose Config](../docker/configs/multi-service-compose.yaml) — Multi-container applications with Compose.
- [GitHub Actions Quickstart — What Tripped Me Up (2026-07-09)](../github-actions/notes/2026-07-09-gha-quickstart-trials.md) — Workflow syntax, checkout action, and trigger gotchas.
- [Reading Workflow Logs and Debugging (2026-07-10)](../github-actions/docs/2026-07-10-reading-workflow-logs-and-debugging.md) — Log reading, exit codes, and debugging failed workflow runs.
- [Minimal CI Workflow (2026-07-09)](../github-actions/configs/2026-07-09-minimal-ci-workflow.yaml) — Minimal GitHub Actions CI workflow config.
- [CI Workflow Config](../github-actions/configs/ci-workflow.yaml) — Automated testing and deployment with GitHub Actions.
- [Local Provider Config](../terraform/configs/local-provider.hcl) — Infrastructure configuration with Terraform.
- [Install Local Cluster Script](../kubernetes/scripts/install-local-cluster.sh) — Local K8s development environment with kind.
- [Minimal Deployment + Service Manifest (2026-07-10)](../kubernetes/manifests/2026-07-10-minimal-deployment-service.yaml) — Basic K8s Deployment and Service manifest applied with `kubectl apply`.

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
