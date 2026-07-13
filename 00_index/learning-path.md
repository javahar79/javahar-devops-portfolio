# Learning Path — DevOps

> A suggested progression from beginner to confident practitioner. Each stage builds on the previous one. If a topic is listed but has no content yet, it's marked as ⏳ (coming soon).

## Stage 1: Foundations

Start where everything else begins — the tools that underpin every other skill in this portfolio.

- [Git Primer](../git/notes/0000-primer-git.md) — Version control is the bedrock of modern DevOps. Understand commits, branches, and remotes before you touch any other tool.
- [Docker Primer](../docker/notes/0000-primer-docker.md) — Containers package software with its environment. This primer explains images, containers, and why Docker exists in the first place.

## Stage 2: Core Tools

Once Git and Docker make sense, pick up the three tools that sit at the centre of most DevOps workflows.

- [Kubernetes Primer](../kubernetes/notes/0000-primer-kubernetes.md) — Container orchestration at scale. Learn what pods, deployments, and services actually mean.
- [Terraform Primer](../terraform/notes/0000-primer-terraform.md) — Declarative infrastructure as code. Understand providers, resources, and why this approach replaces manual provisioning.
- [GitHub Actions Primer](../github-actions/notes/0000-primer-github-actions.md) — Automation built into GitHub. Learn workflows, jobs, runners, and triggers.

## Stage 3: Building Skills

Apply the mental models with hands-on practice. Work through these in order — they build on the previous stage.

- [Git CLI Exploration](../git/notes/2026-06-16-explore-git-cli.md) — Branching, merging, remotes, and the commands you will use daily.
- [Git Quickstart Notes](../git/notes/2026-06-22-git-quickstart.md) — Set up your first remote repository and push a commit.
- [Git Undo, Stage, Commit, Push](../git/notes/2026-06-24-git-undo-stage-commit-push.md) — Fixing the mistakes everyone makes while learning Git.
- [Branch, Merge, and Revert Workflow (2026-07-09)](../git/scripts/2026-07-09-branch-merge-revert-workflow.sh) — Hands-on practice with feature branches, merge commits, and reverts.
- [Docker CLI Notes](../docker/notes/2026-06-16-explore-docker-cli.md) — Build, run, and manage containers from the command line.
- [Docker Quickstart Notes](../docker/notes/2026-06-20-docker-quickstart.md) — Building your first image and running a container.
- [Install Docker Script](../docker/scripts/2026-06-16-install-docker.sh) — Docker installation smoke test.
- [First Container Port Map Script](../docker/scripts/2026-06-21-first-container-port-map.sh) — Run nginx and verify port mapping.
- [Configure Git Script](../git/scripts/configure-and-commit-first.sh) — Set up Git identity and push your first commit.
- [Install Terraform and Run Version (2026-07-12)](../terraform/notes/2026-07-12-install-terraform-and-run-version.md) — Terraform CLI install and version verification.
- [Kubernetes Quickstart Trials (2026-07-10)](../kubernetes/notes/2026-07-10-k8s-quickstart-trials.md) — First-contact gotchas: `run` vs `create deployment`, `ContainerCreating` delays, and `port-forward`.

## Stage 4: Integration

Combine tools to build real infrastructure and pipelines. This is where the separate pieces start to feel like a system.

- [Docker Quickstart Walkthroughs](../docker/notes/2026-06-25-docker-quickstart-walkthrough.md) — Multi-stage builds and practical Dockerfile walkthroughs.
- [Docker Quickstart — What Tripped Me Up (2026-07-08)](../docker/notes/2026-07-08-docker-quickstart-trials.md) — Step-by-step quickstart with volume, compose, and layer caching gotchas.
- [Docker Quickstart — What Tripped Me Up (2026-07-07)](../docker/notes/2026-07-07-docker-quickstart-tripped-me.md) — First-contact quickstart follow-up notes.
- [Tagged Non-Root Dockerfile (2026-07-08)](../docker/dockerfiles/2026-07-08-tagged-nonroot.Dockerfile) — Multi-stage Python build with pinned tag and non-root runtime.
- [Port Map Script (2026-07-08)](../docker/scripts/2026-07-08-first-container-port-map.sh) — Build and run Python container with port 8081 mapping.
- [Multi-Service Compose Config](../docker/configs/multi-service-compose.yaml) — Multi-container applications with Compose.
- [Tagged Go Dockerfile with Source (2026-07-12)](../docker/dockerfiles/2026-07-12-tagged-nonroot.Dockerfile) — Multi-stage Go build with pinned tag, non-root runtime, and Go source files.
- [Port Map Script (2026-07-12)](../docker/scripts/2026-07-12-run-container-port-map.sh) — Build and run Go server container with port 8083 mapping.
- [GitHub Actions Quickstart — What Tripped Me Up (2026-07-09)](../github-actions/notes/2026-07-09-gha-quickstart-trials.md) — Workflow syntax, checkout action, and trigger gotchas.
- [Minimal CI Workflow (2026-07-12)](../github-actions/configs/2026-07-12-minimal-ci-workflow.yaml) — CI workflow with matrix build, lint, and test stages.
- [Reading Workflow Logs and Debugging (2026-07-10)](../github-actions/docs/2026-07-10-reading-workflow-logs-and-debugging.md) — How I learned to read logs and debug GHA failures.
- [First Local File Resource (2026-07-12)](../terraform/configs/2026-07-12-first-local-file-resource.hcl) — My first Terraform resource: create a local file.
- [Local Provider Config](../terraform/configs/local-provider.hcl) — Infrastructure configuration with Terraform.
- [Install Local Cluster Script](../kubernetes/scripts/install-local-cluster.sh) — Local K8s development environment with kind.
- [Minimal Deployment + Service (2026-07-10)](../kubernetes/manifests/2026-07-10-minimal-deployment-service.yaml) — Basic nginx Deployment with ClusterIP Service.
- [Inspecting Pods, Services, and Events (2026-07-12)](../kubernetes/docs/2026-07-12-inspecting-pods-services-events.md) — `kubectl get`, `describe`, and `logs` patterns for real-world debugging.

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
                                       ↓
                                   K8s Debug
                                   (describe,
                                    logs,
                                    events)
```
