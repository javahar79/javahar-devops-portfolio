# Quick Links

## I need to...

### Set up a tool
- [Install Docker](../docker/scripts/2026-06-16-install-docker.sh) — Install Docker Engine and run your first container
- [Configure Git](../git/scripts/configure-and-commit-first.sh) — Set up Git identity and make your first commit
- [.gitattributes Config](../git/configs/gitattributes-merge-eol-diff.gitattributes) — EOL normalization, merge strategies, and diff configuration
- [Minimal Git Config Init (2026-07-20)](../git/scripts/2026-07-20-minimal-git-config-init.sh) — Git user.name, user.email, and init script
- [Install Terraform](../terraform/scripts/2026-06-17-install-terraform.sh) — Install Terraform CLI and init your first project
- [Install Terraform and Run Version (2026-07-16)](../terraform/notes/2026-07-16-install-terraform-and-run-version.md) — Terraform CLI install, init, and version verification
- [Install Local Kubernetes Cluster](../kubernetes/scripts/install-local-cluster.sh) — Set up kind for local development
- [Install Jenkins and Open Web UI](../jenkins/notes/2026-08-06-install-jenkins-and-open-web-ui.md) — Install Jenkins locally and access the web UI
- [Install Ansible and Run First Command](../ansible/notes/2026-08-05-install-ansible-and-run-first-command.md) — Install Ansible and run your first ad-hoc command
- [Install OpenTofu](../of/scripts/2026-08-06-install-opentofu.sh) — Install OpenTofu CLI and initialise your first resource

### Understand a tool
- [Docker Primer](../docker/notes/0000-primer-docker.md) — Containers and images explained
- [Git Primer](../git/notes/0000-primer-git.md) — Version control fundamentals
- [Git Merge vs Rebase](../git/docs/git-merge-vs-rebase.md) — Comparing merge and rebase for integrating changes
- [GitHub Actions Primer](../github-actions/notes/0000-primer-github-actions.md) — Automation with GitHub workflows
- [Kubernetes Primer](../kubernetes/notes/0000-primer-kubernetes.md) — Container orchestration basics
- [Terraform Primer](../terraform/notes/0000-primer-terraform.md) — Infrastructure as Code introduction
- [Jenkins Primer](../jenkins/notes/0000-primer-jenkins.md) — Jenkins primer with first-contact notes and pipeline basics
- [OpenTofu Primer](../of/notes/0000-primer-opentofu.md) — OpenTofu primer, a Terraform-compatible IaC tool
- [Terraform State, Backends, and Modules](../tf/notebooks/terraform-state-backends-and-modules.ipynb) — Interactive notebook on Terraform state management, remote backends, and module patterns
- [Cloud Computing Fundamentals Primer](../docs/concepts/cloud-computing-fundamentals/0000-primer-cloud-computing-fundamentals.md) — IaaS, PaaS, SaaS, and service models explained
- [Container Fundamentals Primer](../docs/concepts/container-fundamentals/0000-primer-container-fundamentals.md) — Images, registries, and volumes explained
- [Infrastructure as Code Primer](../docs/concepts/infrastructure-as-code/0000-primer-infrastructure-as-code.md) — Declarative config, state, and drift explained
- [Scripting & Automation Primer](../docs/concepts/scripting-automation/0000-primer-scripting-automation.md) — Shell, Cron, idempotency, and automation patterns
- [CI/CD Concepts Primer](../docs/concepts/ci-cd-concepts/0000-primer-ci-cd-concepts.md) — Pipelines, triggers, and runners explained
- [Linux OS Fundamentals Primer](../docs/concepts/linux-os-fundamentals/0000-primer-linux-os-fundamentals.md) — Filesystem, processes, and permissions basics
- [Networking Basics Primer](../docs/concepts/networking-basics/0000-primer-networking-basics.md) — IP, ports, DNS, and how traffic flows
- [Git & Version Control Primer](../docs/concepts/git-version-control/0000-primer-git-version-control.md) — Why version control underpins DevOps
- [Common Git Mistakes (2026-07-20)](../git/notes/2026-07-20-common-git-mistakes.md) — Everyday Git pitfalls and how to fix them
- [CI/CD Workflow Overview (2026-07-19)](../docs/concepts/ci-cd-concepts/2026-07-19-ci-cd-workflow-overview.md) — How CI/CD pipelines connect GitHub Actions, testing, and deployment

### Build and run a container
- [Multi-Service Compose](../docker/configs/multi-service-compose.yaml) — Web app with PostgreSQL setup
- [Multi-Stage Python Webapp Dockerfile](../docker/dockerfiles/multi-stage-python-webapp.Dockerfile) — Python multi-stage build with pip dependencies
- [Multi-Stage BuildKit Distroless Dockerfile](../docker/dockerfiles/multi-stage-buildkit-distroless.Dockerfile) — Multi-stage Dockerfile with BuildKit cache mounts, distroless runtime, non-root user, and HEALTHCHECK
- [Build Multi-Stage with Secrets](../docker/scripts/build-multi-stage-with-secrets.sh) — Build multi-stage Dockerfile with BuildKit secrets mount for sensitive data
- [Tagged Non-Root Dockerfile (2026-07-18)](../docker/dockerfiles/2026-07-18-tagged-nonroot.Dockerfile) — Multi-stage Dockerfile with pinned tag and non-root runtime user
- [Run Container Port Map Script (2026-07-18)](../docker/scripts/2026-07-18-run-container-port-map.sh) — Build and run Go container with port mapping
- [Dockerfile Layers and Registry Script (2026-08-04)](../docs/concepts/container-fundamentals/scripts/2026-08-04-dockerfile-layers-registry.sh) — Hands-on Dockerfile layer inspection and registry push exercises
- [Dockerfile Antipatterns](../docker/docs/dockerfile-antipatterns.md) — Common Dockerfile mistakes and how to avoid them
- [Multi-Stage vs Distroless vs Alpine](../docker/docs/multi-stage-vs-distroless-vs-alpine.md) — When to choose each Docker image base

### Automate with CI/CD
- [GHA Quickstart — What Tripped Me Up (2026-07-21)](../github-actions/notes/2026-07-21-gha-quickstart-tripped-me.md) — GHA workflow syntax, triggers, and debugging gotchas
- [Minimal CI Workflow (2026-07-19)](../github-actions/configs/2026-07-19-minimal-ci-workflow.yaml) — GHA CI workflow with setup-python caching
- [Debug Run-Name & Conditions (2026-07-19)](../github-actions/configs/2026-07-19-debug-run-name-conditions.yaml) — Run-name and conditional step examples
- [Reusable Workflow with Inputs](../github-actions/configs/reusable-workflow-with-inputs.yaml) — Reusable GHA workflow with input parameters and matrix strategy
- [Complex Reusable Workflow](../github-actions/snippets/complex-reusable-workflow-matrix-approvals.yaml) — Reusable workflow with matrix builds, approval gates, and rollback
- [Reading Workflow Logs and Debugging (2026-07-19)](../github-actions/docs/2026-07-19-reading-workflow-logs-and-debugging.md) — How I learned to read logs and debug GHA failures
- [Validate Workflow Runs (2026-07-21)](../github-actions/scripts/2026-07-21-validate-workflow-runs.sh) — Validate GHA workflows from the command line with gh CLI
- [Audit Failed Workflow Runs](../github-actions/scripts/audit-failed-workflow-runs.sh) — Audit failed GHA runs and identify root causes
- [Matrix Builds & Conditional Deploys](../github-actions/docs/matrix-builds-conditional-deploys.md) — Matrix strategies and conditional deployment patterns
- [Run First Jenkins Pipeline](../jenkins/snippets/2026-08-06-run-first-pipeline.groovy) — Groovy snippet for a minimal Jenkins pipeline

### Provision infrastructure
- [Terraform Directory Structure (2026-07-19)](../terraform/notes/2026-07-19-terraform-directory-structure.md) — How the terraform/ folder is organised and what each directory holds
- [Terraform Version & Init (2026-07-19)](../terraform/notes/2026-07-19-terraform-version-init.md) — Terraform version check, init, and first-run walkthrough
- [Terraform Init First-Run Notes (2026-07-14)](../terraform/notes/2026-07-14-terraform-init-first-run.md) — First-run `terraform init` behaviour, provider download, and `.terraform.lock.hcl`
- [Install Terraform and Run Version (2026-07-19)](../terraform/notes/2026-07-19-install-terraform-and-run-version.md) — Terraform CLI install, init, and version verification
- [What Tripped Me Up Quickstart (2026-07-21)](../terraform/notes/2026-07-21-what-tripped-me-up-quickstart.md) — Quickstart gotchas and recovery patterns
- [What I Learned from Validate and Plan (2026-07-21)](../terraform/notes/2026-07-21-what-i-learned-from-validate-and-plan.md) — Validation, planning, and apply walkthrough notes
- [Terraform State Files & Remote Backends (2026-07-22)](../terraform/docs/2026-07-22-terraform-state-files-remote-backends.md) — Remote state management, S3 backends, DynamoDB locking, and workspace isolation
- [Workspaces vs Directory-per-Env](../terraform/docs/terraform-workspaces-vs-directory-per-env.md) — Comparing Terraform workspace isolation with directory-per-environment patterns
- [Variables, Outputs, and Dependencies (2026-07-22)](../terraform/configs/2026-07-22-variables-outputs-dependencies.hcl) — Terraform variables, output blocks, and explicit dependencies
- [VPC Multi-Resource Infrastructure](../terraform/configs/vpc-multi-resource-infrastructure.hcl) — Multi-resource VPC setup with subnets, routes, and security groups
- [Terraform Lifecycle (2026-07-22)](../terraform/scripts/2026-07-22-terraform-lifecycle.sh) — init, validate, plan, and apply end-to-end
- [Remote State Management (S3 + DynamoDB)](../terraform/scripts/remote-state-management-s3.sh) — Initialize S3 backend, migrate local state, and enable DynamoDB locking
- [Declarative Config CLI Exercises (2026-08-04)](../docs/concepts/infrastructure-as-code/scripts/2026-08-04-declarative-config-cli-exercises.sh) — CLI exercises for declarative infrastructure config patterns
- [First OpenTofu Resource](../of/configs/2026-08-05-first-resource.hcl) — First Terraform-compatible OpenTofu resource configuration

### Deploy on Kubernetes
- [Minimal Deployment + Service (2026-07-21)](../kubernetes/manifests/2026-07-21-minimal-deployment-service.yaml) — Basic nginx Deployment with ClusterIP Service
- [StatefulSet PostgreSQL with PVC](../kubernetes/manifests/statefulset-postgresql-pvc.yaml) — PostgreSQL StatefulSet with persistent volume claim
- [PostgreSQL StatefulSet with PVC](../kubernetes/manifests/statefulset-postgresql.yaml) — PostgreSQL StatefulSet manifest with persistent volume claim
- [Inspecting Pods, Services, and Events (2026-07-19)](../kubernetes/docs/2026-07-19-inspecting-pods-services-events.md) — `kubectl get`, `describe`, and `logs` patterns for real-world debugging
- [ConfigMaps, Secrets, and env vars](../kubernetes/docs/configmaps-secrets-env-vars.md) — Wiring configuration and secrets into a K8s Deployment
- [kubectl Rollout vs Edit](../kubernetes/scripts/kubectl-rollout-vs-edit.sh) — Zero-downtime update strategy comparison

### Troubleshoot
- [Troubleshoot Failing Deployments (2026-07-21)](../kubernetes/scripts/2026-07-21-troubleshoot-failing-deployment.sh) — Diagnose CrashLoopBackOff and ImagePullBackOff
- [Debugging Port-Forward, Exec, and Logs (2026-07-21)](../kubernetes/snippets/2026-07-21-debugging-port-forward-exec-logs.sh) — Port-forward, exec into pods, tail logs
- [Troubleshoot Pods (2026-07-19)](../kubernetes/scripts/2026-07-19-troubleshoot-pods.sh) — Debug K8s pods with kubectl logs and describe
- [Automate Git Bisect](../git/scripts/git-bisect-automation.sh) — Find the first breaking commit with automated bisect
- [Reading Workflow Logs and Debugging (2026-07-19)](../github-actions/docs/2026-07-19-reading-workflow-logs-and-debugging.md) — Reading logs and debugging GHA failures
- [Git Undo/Stage/Commit/Push (2026-07-19)](../git/notes/2026-07-19-git-undo-stage-commit-push.md) — Fixing mistakes in Git workflow
- [Clean Git History (2026-07-20)](../git/scripts/2026-07-20-clean-git-history.sh) — .gitignore audit and merge conflict recovery
- [Git Reflog & Rebase (2026-07-20)](../git/scripts/2026-07-20-git-reflog-rebase.sh) — Interactive rebase and reflog recovery
- [Scheduling, Error Handling, and Parsing (2026-08-04)](../docs/concepts/scripting-automation/scripts/2026-08-04-scheduling-error-handling-parsing.sh) — Cron scheduling, error trapping, and output parsing patterns
- [Networking Exercises (2026-08-05)](../docs/concepts/networking-basics/scripts/2026-08-05-networking-exercises.sh) — Hands-on exercises for IP, port, and DNS fundamentals
