# Learning Path — DevOps

> A suggested progression from beginner to confident practitioner. Each stage builds on the previous one. If a topic is listed but has no content yet, it's marked as ⏳ (coming soon).

## Stage 1: Foundations

Start where everything else begins — the tools and concepts that underpin every other skill in this portfolio.

- [Git Primer](../git/notes/0000-primer-git.md) — Version control is the bedrock of modern DevOps. Understand commits, branches, and remotes before you touch any other tool.
- [Docker Primer](../docker/notes/0000-primer-docker.md) — Containers package software with its environment. This primer explains images, containers, and why Docker exists in the first place.
- [CI/CD Concepts Primer](../docs/concepts/ci-cd-concepts/0000-primer-ci-cd-concepts.md) — Pipelines, triggers, and runners. The mental model that makes GitHub Actions (and any CI tool) make sense.
- [Linux OS Fundamentals Primer](../docs/concepts/linux-os-fundamentals/0000-primer-linux-os-fundamentals.md) — Filesystems, processes, and permissions — the ground every container and server stands on.
- [Networking Basics Primer](../docs/concepts/networking-basics/0000-primer-networking-basics.md) — IPs, ports, DNS, and how traffic actually flows between services.

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

## Stage 4: Integration

Combine tools to build real infrastructure and pipelines. This is where the separate pieces start to feel like a system.

- [Docker Quickstart Walkthroughs](../docker/notes/2026-06-25-docker-quickstart-walkthrough.md) — Multi-stage builds and practical Dockerfile walkthroughs.
- [Docker Quickstart — What Tripped Me Up (2026-07-16)](../docker/notes/2026-07-16-docker-quickstart-tripped-me.md) — Latest quickstart notes with port mapping, volume mount, and debugging gotchas.
- [Docker Quickstart — What Tripped Me Up (2026-07-18)](../docker/notes/2026-07-18-docker-quickstart-tripped-me.md) — Newest quickstart notes with port mapping, volume mount, and debugging gotchas.
- [Tagged Non-Root Dockerfile (2026-07-18)](../docker/dockerfiles/2026-07-18-tagged-nonroot.Dockerfile) — Newest multi-stage Dockerfile with pinned tag and non-root runtime user.
- [Run Container Port Map Script (2026-07-18)](../docker/scripts/2026-07-18-run-container-port-map.sh) — Newest build-and-run script for Go container with port mapping.
- [Docker Quickstart — What Tripped Me Up (2026-07-08)](../docker/notes/2026-07-08-docker-quickstart-trials.md) — Step-by-step quickstart with volume, compose, and layer caching gotchas.
- [Docker Quickstart — What Tripped Me Up (2026-07-07)](../docker/notes/2026-07-07-docker-quickstart-tripped-me.md) — First-contact quickstart follow-up notes.
- [Tagged Non-Root Dockerfile (2026-07-16)](../docker/dockerfiles/2026-07-16-tagged-nonroot.Dockerfile) — Latest multi-stage Dockerfile with pinned tag and non-root runtime user.
- [Run Container Port Map Script (2026-07-16)](../docker/scripts/2026-07-16-run-container-port-map.sh) — Latest build-and-run script for Go container with port mapping.
- [Multi-Service Compose Config](../docker/configs/multi-service-compose.yaml) — Multi-container applications with Compose.
- [GitHub Actions Quickstart — What Tripped Me Up (2026-07-09)](../github-actions/notes/2026-07-09-gha-quickstart-trials.md) — Workflow syntax, checkout action, and trigger gotchas.
- [Minimal CI Workflow (2026-07-12)](../github-actions/configs/2026-07-12-minimal-ci-workflow.yaml) — GitHub Actions CI workflow with trigger and job setup.
- [Minimal CI Workflow (2026-07-09)](../github-actions/configs/2026-07-09-minimal-ci-workflow.yaml) — Minimal GitHub Actions CI workflow config.
- [CI Workflow Config](../github-actions/configs/ci-workflow.yaml) — Automated testing and deployment with GitHub Actions.
- [Reading Workflow Logs and Debugging Failures (2026-07-10)](../github-actions/docs/2026-07-10-reading-workflow-logs-and-debugging.md) — How I learned to read logs and debug GHA failures.
- [CI/CD Workflow Overview (2026-07-19)](../docs/concepts/ci-cd-concepts/2026-07-19-ci-cd-workflow-overview.md) — Mapping the CI/CD pieces in this portfolio: GitHub Actions workflows and what's still to come.
- [Terraform Directory Structure (2026-07-19)](../terraform/notes/2026-07-19-terraform-directory-structure.md) — How the terraform/ folder is organised and what each directory holds.
- [Terraform Version & Init (2026-07-16)](../terraform/notes/2026-07-16-terraform-version-init.md) — Terraform version check, init, and first-run walkthrough.
- [Install Terraform and Run Version (2026-07-16)](../terraform/notes/2026-07-16-install-terraform-and-run-version.md) — Terraform CLI install, init, and version verification.
- [Terraform Init First-Run Notes (2026-07-14)](../terraform/notes/2026-07-14-terraform-init-first-run.md) — First-run `terraform init` behaviour, provider download, and `.terraform.lock.hcl`.
- [Local File Resource (2026-07-16)](../terraform/configs/2026-07-16-local-file-resource.hcl) — Terraform local_file resource with content and filename attributes.
- [First Local File Resource (2026-07-12)](../terraform/configs/2026-07-12-first-local-file-resource.hcl) — Minimal Terraform config with `local_file` resource.
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
   Concepts  →  Core     → Quickstart → Compose  → Advanced
  (CI/CD,    →  Tools    → CLI Notes  → K8s     → Terraform
   Linux,    → (K8s,     → Port Map   → Install
   Network)    Terraform,                ↓
        ↓      GitHub     → K8s Debug
   Git/Docker  Actions)    (describe,
        ↓                   logs,
   Primes               events)
```
