# Quick Links

## I need to...

### Set up a tool
- [Install Docker](../docker/scripts/2026-06-16-install-docker.sh) — Install Docker Engine and run your first container
- [Configure Git](../git/scripts/configure-and-commit-first.sh) — Set up Git identity and make your first commit
- [.gitattributes Config](../git/configs/gitattributes-merge-eol-diff.gitattributes) — EOL normalization, merge strategies, and diff configuration
- [Minimal Git Config Init (2026-07-20)](../git/scripts/2026-07-20-minimal-git-config-init.sh) — Git user.name, user.email, and init script
- [Install Terraform](../terraform/scripts/2026-06-17-install-terraform.sh) — Install Terraform CLI and init your first project
- [Install Terraform and Run Version (2026-07-19)](../terraform/notes/2026-07-19-install-terraform-and-run-version.md) — Terraform CLI install, init, and version verification
- [Install Local Kubernetes Cluster](../kubernetes/scripts/install-local-cluster.sh) — Set up kind for local development

### Understand a tool
- [Docker Primer](../docker/notes/0000-primer-docker.md) — Containers and images explained
- [Git Primer](../git/notes/0000-primer-git.md) — Version control fundamentals
- [Git Merge vs Rebase](../git/docs/git-merge-vs-rebase.md) — Comparing merge and rebase for integrating changes
- [GitHub Actions Primer](../github-actions/notes/0000-primer-github-actions.md) — Automation with GitHub workflows
- [Kubernetes Primer](../kubernetes/notes/0000-primer-kubernetes.md) — Container orchestration basics
- [Terraform Primer](../terraform/notes/0000-primer-terraform.md) — Infrastructure as Code introduction
- [CI/CD Concepts Primer](../docs/concepts/ci-cd-concepts/0000-primer-ci-cd-concepts.md) — Pipelines, triggers, and runners explained
- [Cloud Computing Fundamentals Primer](../docs/concepts/cloud-computing-fundamentals/0000-primer-cloud-computing-fundamentals.md) — IaaS, PaaS, SaaS, and service models explained
- [Container Fundamentals Primer](../docs/concepts/container-fundamentals/0000-primer-container-fundamentals.md) — Images, registries, and volumes explained
- [Infrastructure as Code Primer](../docs/concepts/infrastructure-as-code/0000-primer-infrastructure-as-code.md) — Declarative config, state, and drift explained
- [Scripting & Automation Primer](../docs/concepts/scripting-automation/0000-primer-scripting-automation.md) — Shell, Cron, idempotency, and automation patterns
- [Linux OS Fundamentals Primer](../docs/concepts/linux-os-fundamentals/0000-primer-linux-os-fundamentals.md) — Filesystem, processes, and permissions basics
- [Networking Basics Primer](../docs/concepts/networking-basics/0000-primer-networking-basics.md) — IP, ports, DNS, and how traffic flows
- [Git & Version Control Primer](../docs/concepts/git-version-control/0000-primer-git-version-control.md) — Why version control underpins DevOps
- [State-Aware IaC Pipelines (2026-07-31)](../docs/concepts/ci-cd-concepts/state-aware-iac-pipelines.md) — Combining CI/CD and IaC for stateful and stateless change lifecycles
- [Common Git Mistakes (2026-07-20)](../git/notes/2026-07-20-common-git-mistakes.md) — Everyday Git pitfalls and how to fix them
- [Docker Workflow: Limits, Healthcheck, Cleanup](../docker/scripts/docker-workflow-limits-healthcheck-cleanup.sh) — Resource limits, HEALTHCHECK-driven startup order, and volume cleanup

### Build and run a container
- [Multi-Service Compose](../docker/configs/multi-service-compose.yaml) — Web app with PostgreSQL setup
- [Multi-Service Compose Notebook](../docker/notebooks/multi-service-compose.ipynb) — Interactive walkthrough: Flask web app, PostgreSQL, healthcheck, network inspection, service discovery
- [Multi-Stage Python Webapp Dockerfile](../docker/dockerfiles/multi-stage-python-webapp.Dockerfile) — Python multi-stage build with pip dependencies
- [Multi-Stage BuildKit Distroless Dockerfile (2026-07-31)](../docker/dockerfiles/multi-stage-buildkit-distroless.Dockerfile) — Go multi-stage build with BuildKit cache mounts, distroless runtime, non-root user, and HEALTHCHECK
- [Build Multi-Stage with Secrets Script (2026-07-31)](../docker/scripts/build-multi-stage-with-secrets.sh) — BuildKit secrets mount pattern keeping API keys out of image layers
- [Automate Container Lifecycle](../docker/scripts/automating-container-lifecycle.sh) — Build, smoke-test, and tear down a Compose stack in one script
- [Tagged Non-Root Dockerfile (2026-07-18)](../docker/dockerfiles/2026-07-18-tagged-nonroot.Dockerfile) — Multi-stage Dockerfile with pinned tag and non-root runtime user
- [Dockerfile Antipatterns](../docker/docs/dockerfile-antipatterns.md) — Common Dockerfile mistakes and how to avoid them
- [Multi-Stage vs Distroless vs Alpine](../docker/docs/multi-stage-vs-distroless-vs-alpine.md) — When to choose each Docker image base

### Automate with CI/CD
- [GHA Quickstart — What Tripped Me Up (2026-07-21)](../github-actions/notes/2026-07-21-gha-quickstart-tripped-me.md) — GHA workflow syntax, triggers, and debugging gotchas
- [Minimal CI Workflow (2026-07-19)](../github-actions/configs/2026-07-19-minimal-ci-workflow.yaml) — GHA CI workflow with setup-python caching
- [Debug Run-Name & Conditions (2026-07-19)](../github-actions/configs/2026-07-19-debug-run-name-conditions.yaml) — Run-name and conditional step examples
- [CI/CD Pipeline Stage Patterns (2026-07-31)](../docs/concepts/ci-cd-concepts/snippets/2026-07-31-cicd-pipeline-stage-patterns.yaml) — Build, test, deploy, approval gate, and rollback stage patterns
- [State-Aware IaC Pipelines (2026-07-31)](../docs/concepts/ci-cd-concepts/state-aware-iac-pipelines.md) — Wiring CI/CD and IaC for stateful infrastructure + stateless app rollouts
- [Matrix Builds & Conditional Deploys](../github-actions/docs/matrix-builds-conditional-deploys.md) — Matrix strategies and conditional deployment patterns
- [Reading Workflow Logs and Debugging (2026-07-19)](../github-actions/docs/2026-07-19-reading-workflow-logs-and-debugging.md) — How I learned to read logs and debug GHA failures
- [Audit Failed Workflow Runs](../github-actions/scripts/audit-failed-workflow-runs.sh) — Audit failed GHA runs and identify root causes

### Provision infrastructure
- [Terraform Directory Structure (2026-07-19)](../terraform/notes/2026-07-19-terraform-directory-structure.md) — How the terraform/ folder is organised and what each directory holds
- [Terraform Version & Init (2026-07-19)](../terraform/notes/2026-07-19-terraform-version-init.md) — Terraform version check, init, and first-run walkthrough
- [Terraform Init First-Run Notes (2026-07-14)](../terraform/notes/2026-07-14-terraform-init-first-run.md) — First-run `terraform init` behaviour, provider download, and `.terraform.lock.hcl`
- [What Tripped Me Up Quickstart (2026-07-21)](../terraform/notes/2026-07-21-what-tripped-me-up-quickstart.md) — Quickstart gotchas and recovery patterns
- [What I Learned from Validate and Plan (2026-07-21)](../terraform/notes/2026-07-21-what-i-learned-from-validate-and-plan.md) — Validation, planning, and apply walkthrough notes
- [Terraform State Files & Remote Backends (2026-07-22)](../terraform/docs/2026-07-22-terraform-state-files-remote-backends.md) — Remote state management, S3 backends, DynamoDB locking, and workspace isolation
- [Variables, Outputs, and Dependencies (2026-07-22)](../terraform/configs/2026-07-22-variables-outputs-dependencies.hcl) — Terraform variables, output blocks, and explicit dependencies
- [VPC Multi-Resource Infrastructure](../terraform/configs/vpc-multi-resource-infrastructure.hcl) — Multi-resource VPC setup with subnets, routes, and security groups
- [Terraform Lifecycle (2026-07-22)](../terraform/scripts/2026-07-22-terraform-lifecycle.sh) — init, validate, plan, and apply end-to-end
- [Remote State Management (S3 + DynamoDB)](../terraform/scripts/remote-state-management-s3.sh) — Initialize S3 backend, migrate local state, and enable DynamoDB locking

### Deploy on Kubernetes
- [Minimal Deployment + Service (2026-07-21)](../kubernetes/manifests/2026-07-21-minimal-deployment-service.yaml) — Basic nginx Deployment with ClusterIP Service
- [StatefulSet PostgreSQL with PVC](../kubernetes/manifests/statefulset-postgresql-pvc.yaml) — PostgreSQL StatefulSet with persistent volume claim
- [StatefulSet PostgreSQL](../kubernetes/manifests/statefulset-postgresql.yaml) — PostgreSQL StatefulSet without PVC — quick local dev
- [Inspecting Pods, Services, and Events (2026-07-19)](../kubernetes/docs/2026-07-19-inspecting-pods-services-events.md) — `kubectl get`, `describe`, and `logs` patterns for real-world debugging
- [ConfigMaps, Secrets, and env vars](../kubernetes/docs/configmaps-secrets-env-vars.md) — Wiring configuration and secrets into a K8s Deployment
- [kubectl Rollout vs Edit](../kubernetes/scripts/kubectl-rollout-vs-edit.sh) — Zero-downtime update strategy comparison

### Troubleshoot
- [Troubleshoot Failing Deployments (2026-07-21)](../kubernetes/scripts/2026-07-21-troubleshoot-failing-deployment.sh) — Diagnose CrashLoopBackOff and ImagePullBackOff
- [Debugging Port-Forward, Exec, and Logs (2026-07-21)](../kubernetes/snippets/2026-07-21-debugging-port-forward-exec-logs.sh) — Port-forward, exec into pods, tail logs
- [Troubleshoot Pods (2026-07-19)](../kubernetes/scripts/2026-07-19-troubleshoot-pods.sh) — Debug K8s pods with kubectl logs and describe
- [Automate Git Bisect](../git/scripts/git-bisect-automation.sh) — Find the first breaking commit with automated bisect
- [Git Bisect Automation Notebook](../git/notebooks/git-bisect-automation-and-history-rewrite.ipynb) — Interactive walkthrough of bisect automation and history rewrite
- [Git Undo/Stage/Commit/Push (2026-07-19)](../git/notes/2026-07-19-git-undo-stage-commit-push.md) — Fixing mistakes in Git workflow
- [Clean Git History (2026-07-20)](../git/scripts/2026-07-20-clean-git-history.sh) — .gitignore audit and merge conflict recovery
- [Git Reflog & Rebase (2026-07-20)](../git/scripts/2026-07-20-git-reflog-rebase.sh) — Interactive rebase and reflog recovery
- [Reading Workflow Logs and Debugging (2026-07-19)](../github-actions/docs/2026-07-19-reading-workflow-logs-and-debugging.md) — Reading logs and debugging GHA failures
