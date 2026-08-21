# Quick Links

## I need to...

### Set up a tool
- [Install Docker](../docker/scripts/2026-06-16-install-docker.sh) — Install Docker Engine and run your first container
- [Install Docker from the Official APT Repo (2026-08-14)](../docker/notes/2026-08-14-install-docker-from-official-apt-repo.md) — Installing Docker Engine from Docker's own apt repository
- [Configure Git](../git/scripts/configure-and-commit-first.sh) — Set up Git identity and make your first commit
- [.gitattributes Config](../git/configs/gitattributes-merge-eol-diff.gitattributes) — EOL normalization, merge strategies, and diff configuration
- [Minimal Git Config Init (2026-07-20)](../git/scripts/2026-07-20-minimal-git-config-init.sh) — Git user.name, user.email, and init script
- [Install Terraform](../terraform/scripts/2026-06-17-install-terraform.sh) — Install Terraform CLI and init your first project
- [Install Terraform and Run Version (2026-07-16)](../terraform/notes/2026-07-16-install-terraform-and-run-version.md) — Terraform CLI install, init, and version verification
- [Install Local Kubernetes Cluster](../kubernetes/scripts/install-local-cluster.sh) — Set up kind for local development
- [Install minikube and log first cluster interaction](../kubernetes/notes/2026-08-10-install-minikube-and-log-my-first-kubernetes-cluster-interaction.md) — Local single-node cluster with the Docker driver, plus addon gotchas
- [Install Jenkins and Open Web UI](../jenkins/notes/2026-08-06-install-jenkins-and-open-web-ui.md) — Install Jenkins locally and access the web UI
- [Install Ansible and Run First Command](../ansible/notes/2026-08-05-install-ansible-and-run-first-command.md) — Install Ansible and run your first ad-hoc command
- [Install OpenTofu](../of/scripts/2026-08-06-install-opentofu.sh) — Install OpenTofu CLI and initialise your first resource

### Understand a tool
- [Docker Primer](../docker/notes/0000-primer-docker.md) — Containers and images explained
- [Git Primer](../git/notes/0000-primer-git.md) — Version control fundamentals
- [Git Merge vs Rebase](../git/docs/git-merge-vs-rebase.md) — Comparing merge and rebase for integrating changes
- [Git Worktrees & Cherry-Pick for Release Management](../git/docs/git-worktrees-cherry-pick-release-management.md) — Keep several branches checked out at once and lift a single fix across branches
- [GitHub Actions Primer](../github-actions/notes/0000-primer-github-actions.md) — Automation with GitHub workflows
- [Kubernetes Primer](../kubernetes/notes/0000-primer-kubernetes.md) — Container orchestration basics
- [Terraform Primer](../terraform/notes/0000-primer-terraform.md) — Infrastructure as Code introduction
- [Pulumi Primer](../pulumi/notes/0000-primer-pulumi.md) — Infrastructure as Code in a real programming language
- [Jenkins Primer](../jenkins/notes/0000-primer-jenkins.md) — Jenkins primer with first-contact notes and pipeline basics
- [OpenTofu Primer](../of/notes/0000-primer-opentofu.md) — OpenTofu primer, a Terraform-compatible IaC tool
- [Trivy Primer](../trivy/notes/0000-primer-trivy.md) — Vulnerability scanning, terminology, and first-scan example
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

### Follow a branching convention
- [Project Scaffold: Git Branching Convention](../git/templates/project-scaffold-git-branching/README.md) — Codify a branch model and enforce it with a pre-commit hook
- [Branching Convention](../git/templates/project-scaffold-git-branching/branching-convention.md) — The `feature/`, `release/`, `hotfix/`, `bugfix/` naming scheme the hook validates
- [Scaffold Pre-Commit Hook](../git/templates/project-scaffold-git-branching/pre-commit) — Rejects commits on protected branches and enforces branch-name patterns
- [Branch Strategies for Automated Pipelines (2026-08-16)](../docs/concepts/ci-cd-concepts/branch-strategies-for-automated-pipelines.md) — How branch models map to pipeline stages, triggers, and release cadence
- [Branch Strategies for CI (2026-08-14)](../docs/concepts/git-version-control/branch-strategies-for-ci.md) — Trunk-based, GitFlow, and feature-branch flows plus CI policy wiring

### Build and run a container
- [Multi-Service Compose](../docker/configs/multi-service-compose.yaml) — Web app with PostgreSQL setup
- [daemon.json: Log Rotation & Limits (2026-08-14)](../docker/configs/2026-08-14-daemon-json.json) — Docker daemon config for log rotation and resource limits
- [Multi-Stage Python Webapp Dockerfile](../docker/dockerfiles/multi-stage-python-webapp.Dockerfile) — Python multi-stage build with pip dependencies
- [Multi-Stage BuildKit Distroless Dockerfile](../docker/dockerfiles/multi-stage-buildkit-distroless.Dockerfile) — Multi-stage Dockerfile with BuildKit cache mounts, distroless runtime, non-root user, and HEALTHCHECK
- [Build Multi-Stage with Secrets](../docker/scripts/build-multi-stage-with-secrets.sh) — Build multi-stage Dockerfile with BuildKit secrets mount for sensitive data
- [Tagged Non-Root Dockerfile (2026-07-18)](../docker/dockerfiles/2026-07-18-tagged-nonroot.Dockerfile) — Multi-stage Dockerfile with pinned tag and non-root runtime user
- [Run Container Port Map Script (2026-07-18)](../docker/scripts/2026-07-18-run-container-port-map.sh) — Build and run Go container with port mapping
- [First Docker CLI Snippet (2026-08-14)](../docker/snippets/2026-08-14-first-docker-cli.sh) — pull, run, list, and inspect a container
- [Container Lifecycle Management (2026-08-15)](../docs/concepts/scripting-automation/scripts/container-lifecycle-management.sh) — create → start → verify → stop → clean, failing loudly on a broken step
- [Project Scaffold: Docker + Compose](../docker/templates/project-scaffold-docker-compose/README.md) — Production-grade Docker Compose scaffold for multi-service applications
- [Project Scaffold: Compose + K8s](../docker/templates/project-scaffold-docker-k8s/README.md) — Compose for local dev and K8s manifests for cluster deploy
- [Multi-Container Application Patterns](../docs/concepts/container-fundamentals/multi-container-application-patterns.md) — One process per container, service discovery by name, and stateful backing stores
- [Dockerfile Layers and Registry Script (2026-08-04)](../docs/concepts/container-fundamentals/scripts/2026-08-04-dockerfile-layers-registry.sh) — Hands-on Dockerfile layer inspection and registry push exercises
- [Container Networking Patterns (2026-08-04)](../docs/concepts/container-fundamentals/scripts/container-networking-patterns.sh) — Container networking patterns and exercises
- [Dockerfile Antipatterns](../docker/docs/dockerfile-antipatterns.md) — Common Dockerfile mistakes and how to avoid them
- [Multi-Stage vs Distroless vs Alpine](../docker/docs/multi-stage-vs-distroless-vs-alpine.md) — When to choose each Docker image base

### Automate with CI/CD
- [GHA Quickstart — What Tripped Me Up (2026-07-21)](../github-actions/notes/2026-07-21-gha-quickstart-tripped-me.md) — GHA workflow syntax, triggers, and debugging gotchas
- [First Workflow and Actions Tab (2026-08-12)](../github-actions/notes/2026-08-12-first-workflow-and-actions-tab.md) — First-day notes for the GitHub Actions UI and workflow tab
- [First Build on Push (2026-08-12)](../github-actions/configs/2026-08-12-first-build-on-push.yaml) — Minimal CI workflow that builds and pushes on every push
- [Minimal CI Workflow (2026-07-19)](../github-actions/configs/2026-07-19-minimal-ci-workflow.yaml) — GHA CI workflow with setup-python caching
- [Debug Run-Name & Conditions (2026-07-19)](../github-actions/configs/2026-07-19-debug-run-name-conditions.yaml) — Run-name and conditional step examples
- [Reusable Workflow with Inputs](../github-actions/configs/reusable-workflow-with-inputs.yaml) — Reusable GHA workflow with input parameters and matrix strategy
- [Complex Reusable Workflow](../github-actions/snippets/complex-reusable-workflow-matrix-approvals.yaml) — Reusable workflow with matrix builds, approval gates, and rollback
- [Reading Workflow Logs and Debugging (2026-07-19)](../github-actions/docs/2026-07-19-reading-workflow-logs-and-debugging.md) — How I learned to read logs and debug GHA failures
- [Validate Workflow Runs (2026-07-21)](../github-actions/scripts/2026-07-21-validate-workflow-runs.sh) — Validate GHA workflows from the command line with gh CLI
- [Audit Failed Workflow Runs](../github-actions/scripts/audit-failed-workflow-runs.sh) — Audit failed GHA runs and identify root causes
- [Matrix Builds & Conditional Deploys](../github-actions/docs/matrix-builds-conditional-deploys.md) — Matrix strategies and conditional deployment patterns
- [Run First Jenkins Pipeline](../jenkins/snippets/2026-08-06-run-first-pipeline.groovy) — Groovy snippet for a minimal Jenkins pipeline
- [Automated Release Process (2026-08-14)](../docs/concepts/git-version-control/snippets/automated-release-process.sh) — Tag-based release flow that triggers the deploy pipeline

### Provision infrastructure
- [Cloud Deployment Patterns](../docs/concepts/cloud-computing-fundamentals/cloud-deployment-patterns.md) — Environment-as-code consistency, GitOps, image-as-delivery-unit, and designed-in rollback
- [Infrastructure Patterns — Structural Parity Check](../docs/concepts/cloud-computing-fundamentals/scripts/infrastructure-patterns.py) — Drift check that every environment declares the same component layout
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
- [Automated Provisioning Pipeline (2026-08-12)](../docs/concepts/infrastructure-as-code/automated-provisioning-pipeline.md) — Plan-on-PR / apply-on-merge pipeline with remote state and approval gates
- [Declarative Config CLI Exercises (2026-08-04)](../docs/concepts/infrastructure-as-code/scripts/2026-08-04-declarative-config-cli-exercises.sh) — CLI exercises for declarative infrastructure config patterns
- [First OpenTofu Resource](../of/configs/2026-08-05-first-resource.hcl) — First Terraform-compatible OpenTofu resource configuration
- [OpenTofu S3 Backend & State Locking (2026-08-15)](../of/configs/2026-08-15-s3-backend-state-locking.hcl) — Remote state in S3 with DynamoDB table locking so applies never race
- [OpenTofu — Provision a Local Resource (2026-08-15)](../of/snippets/2026-08-15-provision-local-resource.hcl) — Minimal single-file OpenTofu program that creates a local resource
- [OpenTofu — log my first command](../of/notes/2026-08-11-first-opentofu-command.md) — First `tofu` session and backend prompt gotcha
- [OpenTofu Quickstart — What Tripped Me Up (2026-08-14)](../of/notes/2026-08-14-opentofu-quickstart-trip-ups.md) — plan/apply loop, state file, and destroy lifecycle
- [First Pulumi Program (2026-08-10)](../pulumi/snippets/2026-08-10-first-pulumi-program.py) — Minimal Pulumi program in Python defining an S3 bucket
- [My First Pulumi Stack Config (2026-08-11)](../pulumi/configs/2026-08-11-my-first-pulumi-stack.yaml) — First Pulumi stack config with AWS region and project settings
- [Multi-Service Deployment Scaffold](../tf/templates/multi-service-deployment/README.md) — Terraform + Docker Compose scaffold for provisioning infrastructure and running a local three-service stack
- [Multi-Service Docker Compose](../tf/templates/multi-service-deployment/docker-compose.yml) — Web, API, and database services with health checks for local development
- [Terraform Multi-Service Deployment](../tf/templates/multi-service-deployment/main.tf) — Terraform config provisioning a container registry and IAM user for CI/CD image pushes
- [Terraform + GitHub Actions CI/CD Integration (2026-08-10)](../tf/docs/terraform-github-actions-ci-cd.md) — How Terraform plan/apply workflows integrate with GitHub Actions and cloud credentials
- [Production Terraform Workspace Manifest (2026-08-10)](../tf/manifests/production-terraform-workspace-remote-state-locking.yaml) — Production workspace config with remote S3 state and DynamoDB locking
- [Terraform Remote State Reference: S3 + DynamoDB (2026-08-21)](../tf/docs/remote-state-reference-s3-dynamodb-state-isolation.md) — S3 backend with DynamoDB state locking and isolation patterns

### Deploy on Kubernetes
- [Minimal Deployment + Service (2026-07-21)](../kubernetes/manifests/2026-07-21-minimal-deployment-service.yaml) — Basic nginx Deployment with ClusterIP Service
- [StatefulSet PostgreSQL with PVC](../kubernetes/manifests/statefulset-postgresql-pvc.yaml) — PostgreSQL StatefulSet with persistent volume claim
- [PostgreSQL StatefulSet with PVC](../kubernetes/manifests/statefulset-postgresql.yaml) — PostgreSQL StatefulSet manifest with persistent volume claim
- [Production Deployment: Rolling Updates, Probes, PDB](../kubernetes/manifests/production-deployment-rolling-updates-probes-pdb.yaml) — Deployment with rolling-update strategy, liveness/readiness probes, and PodDisruptionBudget
- [Sample-App Scaffold README](../k8s/templates/project-scaffold-sample-app/README.md) — Ready-to-apply Kubernetes sample app with Deployment, Service, Ingress, ConfigMap, Secret, and Namespace
- [Sample-App Deployment + Service](../k8s/templates/project-scaffold-sample-app/deployment.yaml) — Deployment and Service manifest for the sample app
- [Sample-App ConfigMap](../k8s/templates/project-scaffold-sample-app/configmap.yaml) — Non-sensitive configuration wired into the sample app
- [Sample-App Ingress](../k8s/templates/project-scaffold-sample-app/ingress.yaml) — Ingress routing for the sample app
- [Sample-App Namespace](../k8s/templates/project-scaffold-sample-app/namespace.yaml) — Dedicated namespace that scopes the sample app
- [Inspecting Pods, Services, and Events (2026-07-19)](../kubernetes/docs/2026-07-19-inspecting-pods-services-events.md) — `kubectl get`, `describe`, and `logs` patterns for real-world debugging
- [ConfigMaps, Secrets, and env vars](../kubernetes/docs/configmaps-secrets-env-vars.md) — Wiring configuration and secrets into a K8s Deployment
- [Service Networking: ClusterIP, NodePort, LoadBalancer, Ingress (2026-08-21)](../kubernetes/docs/service-networking-clusterip-nodeport-loadbalancer-ingress.md) — How Kubernetes services work: ClusterIP, NodePort, LoadBalancer, and Ingress
- [kubectl Rollout vs Edit](../kubernetes/scripts/kubectl-rollout-vs-edit.sh) — Zero-downtime update strategy comparison
- [Deploy, Rollout, and Rollback (2026-08-20)](../kubernetes/scripts/deploy-rollout-rollback.sh) — Apply a manifest, wait for rollout, and auto-rollback on failure
- [Deploy Rollout Status (2026-08-21)](../kubernetes/scripts/deploy-rollout-status-rollback.sh) — Rollout status monitoring and rollback automation
- [First kubectl Deploy, Inspect, Delete (2026-08-12)](../kubernetes/snippets/2026-08-12-first-kubectl-deploy-inspect-delete.sh) — kubectl create, get, describe, logs, and delete workflow

### Scan for vulnerabilities
- [First Trivy Scan (2026-08-10)](../trivy/notes/2026-08-10-first-trivy-scan.md) — First-day notes for running a Trivy vulnerability scan against a container image
- [First Trivy Scan Snippet (2026-08-10)](../trivy/snippets/2026-08-10-first-trivy-scan.sh) — Scan an image, filter by severity, and export JSON output

### Troubleshoot
- [Troubleshoot Failing Deployments (2026-07-21)](../kubernetes/scripts/2026-07-21-troubleshoot-failing-deployment.sh) — Diagnose CrashLoopBackOff and ImagePullBackOff
- [Debugging Port-Forward, Exec, and Logs (2026-07-21)](../kubernetes/snippets/2026-07-21-debugging-port-forward-exec-logs.sh) — Port-forward, exec into pods, tail logs
- [Troubleshoot Pods (2026-07-19)](../kubernetes/scripts/2026-07-19-troubleshoot-pods.sh) — Debug K8s pods with kubectl logs and describe
- [Network Diagnostics & Traffic Analysis (2026-08-15)](../docs/concepts/networking-basics/scripts/2026-08-15-network-diagnostics-traffic-analysis.sh) — Work connectivity, resolution, listening ports, and on-the-wire traffic in order
- [DNS and Connectivity Checks (2026-08-14)](../docs/concepts/networking-basics/scripts/2026-08-14-dns-and-connectivity-checks.sh) — Resolution, reverse lookup, and port/HTTP connectivity checks
- [Automate Git Bisect](../git/scripts/git-bisect-automation.sh) — Find the first breaking commit with automated bisect
- [Sync Fork & Clean Merged Branches (2026-08-16)](../git/scripts/sync-fork-and-clean-merged.sh) — Prune locally-merged branches and fast-forward a fork against upstream
- [Reading Workflow Logs and Debugging (2026-07-19)](../github-actions/docs/2026-07-19-reading-workflow-logs-and-debugging.md) — Reading logs and debugging GHA failures
- [Git Undo/Stage/Commit/Push (2026-07-19)](../git/notes/2026-07-19-git-undo-stage-commit-push.md) — Fixing mistakes in Git workflow
- [Clean Git History (2026-07-20)](../git/scripts/2026-07-20-clean-git-history.sh) — .gitignore audit and merge conflict recovery
- [Git Reflog & Rebase (2026-07-20)](../git/scripts/2026-07-20-git-reflog-rebase.sh) — Interactive rebase and reflog recovery
- [Shell Scripting Fundamentals (2026-08-10)](../docs/concepts/linux-os-fundamentals/scripts/2026-08-10-shell-scripting-fundamentals.sh) — Practice script covering variables, conditionals, loops, and functions
- [Process Service Management with systemd (2026-08-21)](../docs/concepts/linux-os-fundamentals/scripts/2026-08-21-process-service-management-systemd.sh) — Script for managing services with systemd: start, stop, enable, status
- [System Admin Patterns (2026-08-10)](../docs/concepts/linux-os-fundamentals/snippets/2026-08-10-system-admin-patterns.sh) — Common patterns for disk usage, process inspection, and service checks