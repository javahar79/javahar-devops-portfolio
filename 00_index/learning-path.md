# Learning Path — DevOps

> A suggested progression from beginner to confident practitioner. Each stage builds on the previous one. If a topic is listed but has no content yet, it's marked as ⏳ (coming soon).

## Stage 1: Foundations

Start where everything begins — the concepts that underpin every other skill in this portfolio.

- [Linux OS Fundamentals Primer](../docs/concepts/linux-os-fundamentals/0000-primer-linux-os-fundamentals.md) — Filesystems, processes, and permissions — the ground every container and server stands on.
- [Networking Basics Primer](../docs/concepts/networking-basics/0000-primer-networking-basics.md) — IPs, ports, DNS, and how traffic actually flows between services.
- [Git & Version Control Primer](../docs/concepts/git-version-control/0000-primer-git-version-control.md) — Why version control underpins every DevOps workflow.
- [Scripting & Automation Primer](../docs/concepts/scripting-automation/0000-primer-scripting-automation.md) — Shell, Cron, idempotency, and the patterns that turn one-off commands into reliable automation.
- [Container Fundamentals Primer](../docs/concepts/container-fundamentals/0000-primer-container-fundamentals.md) — Images, registries, volumes, and the kernel features that make containers portable.
- [Infrastructure as Code Primer](../docs/concepts/infrastructure-as-code/0000-primer-infrastructure-as-code.md) — Declarative config, state, drift, and modules. The foundation for Terraform and every other IaC tool.
- [Cloud Computing Fundamentals Primer](../docs/concepts/cloud-computing-fundamentals/0000-primer-cloud-computing-fundamentals.md) — IaaS, PaaS, SaaS, regions, and why the cloud changed how we build infrastructure.
- [CI/CD Concepts Primer](../docs/concepts/ci-cd-concepts/0000-primer-ci-cd-concepts.md) — Pipelines, triggers, and runners. The mental model that makes GitHub Actions (and any CI tool) make sense.

## Stage 2: Core Tools

Once the foundations make sense, pick up the tools that sit at the centre of most DevOps workflows.

- [Git Primer](../git/notes/0000-primer-git.md) — Version control is the bedrock of modern DevOps. Understand commits, branches, and remotes before you touch any other tool.
- [Docker Primer](../docker/notes/0000-primer-docker.md) — Containers package software with its environment. This primer explains images, containers, and why Docker exists in the first place.
- [Kubernetes Primer](../kubernetes/notes/0000-primer-kubernetes.md) — Container orchestration at scale. Learn what pods, deployments, and services actually mean.
- [Terraform Primer](../terraform/notes/0000-primer-terraform.md) — Declarative infrastructure as code. Understand providers, resources, and why this approach replaces manual provisioning.
- [GitHub Actions Primer](../github-actions/notes/0000-primer-github-actions.md) — Automation built into GitHub. Learn workflows, jobs, runners, and triggers.

## Stage 3: Building Skills

Apply the mental models with hands-on practice. Work through these in order — they build on the previous stage.

- [Git CLI Exploration](../git/notes/2026-06-16-explore-git-cli.md) — Branching, merging, remotes, and the commands you will use daily.
- [Git Quickstart Notes](../git/notes/2026-06-22-git-quickstart.md) — Set up your first remote repository and push a commit.
- [Common Git Mistakes (2026-07-20)](../git/notes/2026-07-20-common-git-mistakes.md) — Everyday Git pitfalls and how to fix them.
- [Common Rebase and Reset Patterns (2026-07-27)](../docs/concepts/git-version-control/snippets/2026-07-27-common-rebase-reset-patterns.sh) — Soft, mixed, and hard reset patterns plus rebase walkthroughs.
- [Branch, Merge, and Revert Workflow (2026-07-20)](../git/scripts/2026-07-20-branch-merge-revert-workflow.sh) — Hands-on practice with feature branches, merge commits, and reverts.
- [Clean Git History (2026-07-20)](../git/scripts/2026-07-20-clean-git-history.sh) — .gitignore audit and merge conflict recovery.
- [Git Reflog & Rebase (2026-07-20)](../git/scripts/2026-07-20-git-reflog-rebase.sh) — Interactive rebase and reflog recovery.
- [Automate Git Bisect](../git/scripts/git-bisect-automation.sh) — Binary-search commit history to find the first breaking change.
- [Git Bisect Automation Notebook](../git/notebooks/git-bisect-automation-and-history-rewrite.ipynb) — Interactive walkthrough of bisect automation and history-rewriting techniques.
- [Docker CLI Notes](../docker/notes/2026-06-16-explore-docker-cli.md) — Build, run, and manage containers from the command line.
- [Docker Quickstart Notes](../docker/notes/2026-06-20-docker-quickstart.md) — Building your first image and running a container.
- [Install Docker Script](../docker/scripts/2026-06-16-install-docker.sh) — Docker installation smoke test.
- [First Container Port Map Script](../docker/scripts/2026-06-21-first-container-port-map.sh) — Run nginx and verify port mapping.
- [Configure Git Script](../git/scripts/configure-and-commit-first.sh) — Set up Git identity and push your first commit.
- [Install Git and log my first commit](../git/notes/2026-08-08-install-git-and-log-first-commit.md) — Installing Git and making the first commit.
- [First Git branch and merge](../git/snippets/2026-08-08-first-git-branch-and-merge.sh) — First Git branch and merge workflow.
- [Common Loops, Conditions, and File Patterns (2026-07-27)](../docs/concepts/scripting-automation/snippets/2026-07-27-common-loops-conditions-file-patterns.sh) — Bash patterns for iterating arrays, branching on conditions, and processing files idempotently.
- [Dockerfile Layers and Registry Script (2026-08-04)](../docs/concepts/container-fundamentals/scripts/2026-08-04-dockerfile-layers-registry.sh) — Hands-on Dockerfile layer inspection and registry push exercises.
- [Container Networking Patterns (2026-08-04)](../docs/concepts/container-fundamentals/scripts/container-networking-patterns.sh) — Container networking patterns and exercises.
- [Infrastructure Patterns — Structural Parity Check (2026-08-14)](../docs/concepts/cloud-computing-fundamentals/scripts/infrastructure-patterns.py) — Drift check that dev/stage/prod declare the same component layout before promoting.
- [Declarative Config CLI Exercises (2026-08-04)](../docs/concepts/infrastructure-as-code/scripts/2026-08-04-declarative-config-cli-exercises.sh) — CLI exercises for declarative infrastructure config patterns.
- [Scheduling, Error Handling, and Parsing (2026-08-04)](../docs/concepts/scripting-automation/scripts/2026-08-04-scheduling-error-handling-parsing.sh) — Cron scheduling, error trapping, and output parsing patterns.
- [Networking Exercises (2026-08-05)](../docs/concepts/networking-basics/scripts/2026-08-05-networking-exercises.sh) — Hands-on exercises for DNS resolution, port testing, and SSH tunneling.
- [Practice Cloud Computing Exercises (2026-08-04)](../docs/concepts/cloud-computing-fundamentals/scripts/2026-08-04-practice-cloud-computing-exercises.sh) — Hands-on exercises for cloud service models and provider patterns.
- [Shell Scripting Fundamentals (2026-08-10)](../docs/concepts/linux-os-fundamentals/scripts/2026-08-10-shell-scripting-fundamentals.sh) — Practice script covering variables, conditionals, loops, and functions.
- [System Admin Patterns (2026-08-10)](../docs/concepts/linux-os-fundamentals/snippets/2026-08-10-system-admin-patterns.sh) — Common patterns for disk usage, process inspection, and service checks.
- [First kubectl command](../kubernetes/scripts/2026-08-08-first-kubectl-command.sh) — First kubectl commands and node listing.
- [OpenTofu — log my first command](../of/notes/2026-08-11-first-opentofu-command.md) — First `tofu` session, backend prompt gotcha, and `.terraform.lock.hcl`.
- [Install OpenTofu](../of/scripts/2026-08-06-install-opentofu.sh) — Install OpenTofu CLI and initialise your first resource.
- [First Pulumi Program (2026-08-10)](../pulumi/snippets/2026-08-10-first-pulumi-program.py) — Minimal Python program defining an S3 bucket through the Pulumi workflow.
- [Install minikube and log first cluster interaction (2026-08-10)](../kubernetes/notes/2026-08-10-install-minikube-and-log-my-first-kubernetes-cluster-interaction.md) — Local single-node cluster, first deployment, and addon gotchas.

## Stage 4: Integration

Combine tools to build real infrastructure and pipelines. This is where the separate pieces start to feel like a system.

- [Docker Quickstart Walkthroughs](../docker/notes/2026-06-25-docker-quickstart-walkthrough.md) — Multi-stage builds and practical Dockerfile walkthroughs.
- [Docker Quickstart — What Tripped Me Up (2026-07-18)](../docker/notes/2026-07-18-docker-quickstart-tripped-me.md) — Latest quickstart notes with port mapping, volume mount, and debugging gotchas.
- [Dockerfile Antipatterns](../docker/docs/dockerfile-antipatterns.md) — Common Dockerfile mistakes and how to avoid them.
- [Multi-Stage vs Distroless vs Alpine](../docker/docs/multi-stage-vs-distroless-vs-alpine.md) — Comparing three strategies for reducing image size and attack surface.
- [Docker Workflow: Limits, Healthcheck, Cleanup](../docker/scripts/docker-workflow-limits-healthcheck-cleanup.sh) — Resource limits, HEALTHCHECK-driven startup order, and volume cleanup.
- [Automate Container Lifecycle](../docker/scripts/automating-container-lifecycle.sh) — Build, smoke-test, and tear down a Compose stack in one script.
- [Multi-Stage Python Webapp Dockerfile](../docker/dockerfiles/multi-stage-python-webapp.Dockerfile) — Python multi-stage build with pip dependencies.
- [Multi-Stage BuildKit Distroless Dockerfile (2026-07-31)](../docker/dockerfiles/multi-stage-buildkit-distroless.Dockerfile) — Go multi-stage build with BuildKit cache mounts, distroless runtime, non-root user, and HEALTHCHECK.
- [Build Multi-Stage with Secrets Script (2026-07-31)](../docker/scripts/build-multi-stage-with-secrets.sh) — BuildKit secrets mount pattern keeping API keys out of image layers.
- [Multi-Service Compose Config](../docker/configs/multi-service-compose.yaml) — Multi-container applications with Compose.
- [Multi-Service Compose Notebook (2026-07-31)](../docker/notebooks/multi-service-compose.ipynb) — Interactive walkthrough: Flask web app, PostgreSQL, healthcheck, network inspection, and service discovery.
- [Multi-Container Application Patterns (2026-08-14)](../docs/concepts/container-fundamentals/multi-container-application-patterns.md) — One process per container, service discovery by name, stateful backing stores, and the sidecar composite.
- [Cloud Deployment Patterns (2026-08-14)](../docs/concepts/cloud-computing-fundamentals/cloud-deployment-patterns.md) — Environment-as-code, GitOps, image-as-delivery-unit, and designed-in rollback in real DevOps projects.
- [Project Scaffold: Docker + Compose](../docker/templates/project-scaffold-docker-compose/README.md) — Production-grade Docker Compose scaffold for multi-service applications.
- [GHA Quickstart — What Tripped Me Up (2026-07-21)](../github-actions/notes/2026-07-21-gha-quickstart-tripped-me.md) — Workflow syntax, triggers, and debugging gotchas.
- [First Workflow and Actions Tab (2026-08-12)](../github-actions/notes/2026-08-12-first-workflow-and-actions-tab.md) — First-day notes for the GitHub Actions UI and workflow tab.
- [First Build on Push (2026-08-12)](../github-actions/configs/2026-08-12-first-build-on-push.yaml) — Minimal CI workflow that builds and pushes on every push.
- [Minimal CI Workflow (2026-07-19)](../github-actions/configs/2026-07-19-minimal-ci-workflow.yaml) — GHA CI workflow with setup-python caching.
- [Debug Run-Name & Conditions (2026-07-19)](../github-actions/configs/2026-07-19-debug-run-name-conditions.yaml) — Run-name and conditional step examples.
- [Matrix Builds & Conditional Deploys](../github-actions/docs/matrix-builds-conditional-deploys.md) — Matrix strategies and conditional deployment patterns.
- [CI/CD Pipeline Stage Patterns (2026-07-31)](../docs/concepts/ci-cd-concepts/snippets/2026-07-31-cicd-pipeline-stage-patterns.yaml) — Build, test, deploy, approval gate, and rollback stage patterns.
- [State-Aware IaC Pipelines (2026-07-31)](../docs/concepts/ci-cd-concepts/state-aware-iac-pipelines.md) — Wiring CI/CD and IaC for stateful infrastructure + stateless app rollouts.
- [Integrating CI with GitOps](../docs/concepts/ci-cd-concepts/integrating-ci-with-gitops.md) — Connecting a CI pipeline to a GitOps controller for automated, Git-driven deployments.
- [Automated Build Pipeline](../docs/concepts/scripting-automation/automated-build-pipeline.md) — Wiring a shell script into a containerized build pipeline for reproducible images.
- [Reading Workflow Logs and Debugging (2026-07-19)](../github-actions/docs/2026-07-19-reading-workflow-logs-and-debugging.md) — How I learned to read logs and debug GHA failures.
- [Audit Failed Workflow Runs](../github-actions/scripts/audit-failed-workflow-runs.sh) — Audit failed GHA runs and identify root causes via gh CLI.
- [Validate Workflow Runs (2026-07-21)](../github-actions/scripts/2026-07-21-validate-workflow-runs.sh) — Validate GHA workflows from the command line with gh CLI.
- [Minimal CI Pipeline Script (2026-07-23)](../docs/concepts/ci-cd-concepts/scripts/2026-07-23-minimal-ci-pipeline.sh) — Hands-on sandbox for practicing CI pipeline mechanics.
- [CI/CD Workflow Overview (2026-07-19)](../docs/concepts/ci-cd-concepts/2026-07-19-ci-cd-workflow-overview.md) — Mapping the CI/CD pieces in this portfolio.
- [Terraform Directory Structure (2026-07-19)](../terraform/notes/2026-07-19-terraform-directory-structure.md) — How the terraform/ folder is organised and what each directory holds.
- [Terraform Version & Init (2026-07-19)](../terraform/notes/2026-07-19-terraform-version-init.md) — Terraform version check, init, and first-run walkthrough.
- [Terraform Init First-Run Notes (2026-07-14)](../terraform/notes/2026-07-14-terraform-init-first-run.md) — First-run `terraform init` behaviour, provider download, and `.terraform.lock.hcl`.
- [Install Terraform and Run Version (2026-07-19)](../terraform/notes/2026-07-19-install-terraform-and-run-version.md) — Terraform CLI install, init, and version verification.
- [What Tripped Me Up Quickstart (2026-07-21)](../terraform/notes/2026-07-21-what-tripped-me-up-quickstart.md) — Quickstart gotchas and recovery patterns.
- [What I Learned from Validate and Plan (2026-07-21)](../terraform/notes/2026-07-21-what-i-learned-from-validate-and-plan.md) — Validation, planning, and apply walkthrough notes.
- [Terraform State Files & Remote Backends (2026-07-22)](../terraform/docs/2026-07-22-terraform-state-files-remote-backends.md) — Remote state management, S3 backends, DynamoDB locking, and workspace isolation.
- [Workspaces vs Directory-per-Env](../terraform/docs/terraform-workspaces-vs-directory-per-env.md) — Comparing Terraform workspace isolation with directory-per-environment patterns.
- [Variables, Outputs, and Dependencies (2026-07-22)](../terraform/configs/2026-07-22-variables-outputs-dependencies.hcl) — Terraform variables, output blocks, and explicit dependencies.
- [VPC Multi-Resource Infrastructure](../terraform/configs/vpc-multi-resource-infrastructure.hcl) — Multi-resource VPC setup with subnets, routes, and security groups.
- [Terraform Lifecycle (2026-07-22)](../terraform/scripts/2026-07-22-terraform-lifecycle.sh) — init, validate, plan, and apply end-to-end.
- [Remote State Management (S3 + DynamoDB)](../terraform/scripts/remote-state-management-s3.sh) — Initialize S3 backend, migrate local state, and enable DynamoDB locking.
- [First Local File Resource (2026-07-19)](../terraform/configs/2026-07-19-first-local-file-resource.hcl) — Terraform local_file resource with content and filename.
- [Local Provider Config](../terraform/configs/local-provider.hcl) — Infrastructure configuration with Terraform.
- [Automated Terraform Workflow (2026-08-04)](../docs/concepts/scripting-automation/scripts/automated-terraform-workflow.sh) — End-to-end Terraform init, plan, and apply automation.
- [Automated Provisioning Pipeline (2026-08-12)](../docs/concepts/infrastructure-as-code/automated-provisioning-pipeline.md) — Plan-on-PR / apply-on-merge pipeline with remote state, approval gates, and locking.
- [Terraform State, Backends, and Modules Notebook](../tf/notebooks/terraform-state-backends-and-modules.ipynb) — Interactive notebook on Terraform state management, remote backends, and reusable module patterns.
- [Terraform Modules, State, and Workspaces Notebook](../tf/notebooks/terraform-modules-state-workspaces.ipynb) — Interactive notebook on Terraform modules, state backends, and workspace isolation.
- [Terraform Module Exploration (2026-08-12)](../docs/concepts/infrastructure-as-code/notebooks/terraform-module-exploration.ipynb) — Interactive notebook exploring Terraform modules and state patterns.
- [Multi-Service Deployment Scaffold](../tf/templates/multi-service-deployment/README.md) — Terraform + Docker Compose scaffold that provisions a container registry and IAM user for CI/CD image pushes while defining a local three-service stack.
- [Terraform Multi-Service Deployment Main](../tf/templates/multi-service-deployment/main.tf) — Terraform config provisioning a container registry and IAM user for CI/CD image pushes.
- [Multi-Service Docker Compose for Terraform Scaffold](../tf/templates/multi-service-deployment/docker-compose.yml) — Web, API, and database services with health checks for local development.
- [Terraform Provisioning Dockerfile](../tf/dockerfiles/multi-stage-dockerfile-terraform-provisioning.Dockerfile) — Multi-stage Dockerfile for Terraform plan/apply workflows.
- [Terraform + GitHub Actions CI/CD Integration (2026-08-10)](../tf/docs/terraform-github-actions-ci-cd.md) — How Terraform plan/apply workflows integrate with GitHub Actions and cloud credentials.
- [Production Terraform Workspace Manifest (2026-08-10)](../tf/manifests/production-terraform-workspace-remote-state-locking.yaml) — Production workspace config with remote S3 state and DynamoDB locking.
- [Run First Jenkins Pipeline](../jenkins/snippets/2026-08-06-run-first-pipeline.groovy) — Groovy snippet for a minimal Jenkins pipeline.
- [Jenkins Primer](../jenkins/notes/0000-primer-jenkins.md) — First-contact notes for Jenkins setup and pipeline basics.
- [Install Jenkins and Open Web UI](../jenkins/notes/2026-08-06-install-jenkins-and-open-web-ui.md) — Install Jenkins locally and access the web UI.
- [Ansible Primer](../ansible/notes/0000-primer-ansible.md) — Ansible primer with first-contact notes for configuration management.
- [Install Ansible and Run First Command](../ansible/notes/2026-08-05-install-ansible-and-run-first-command.md) — Install Ansible and run your first ad-hoc command.
- [First Ping Playbook](../ansible/configs/2026-08-05-first-ping-playbook.yaml) — Minimal playbook to verify Ansible connectivity.
- [OpenTofu Primer](../of/notes/0000-primer-opentofu.md) — OpenTofu primer, a Terraform-compatible IaC tool.
- [First OpenTofu Resource](../of/configs/2026-08-05-first-resource.hcl) — First Terraform-compatible OpenTofu resource configuration.
- [My First Pulumi Stack Config (2026-08-11)](../pulumi/configs/2026-08-11-my-first-pulumi-stack.yaml) — First Pulumi stack config with AWS region and project settings.
- [Trivy Primer](../trivy/notes/0000-primer-trivy.md) — Vulnerability scanning, SBOM generation, and severity filtering for container images.
- [First Trivy Scan (2026-08-10)](../trivy/notes/2026-08-10-first-trivy-scan.md) — First-day notes for running a Trivy vulnerability scan against a container image.
- [First Trivy Scan Snippet (2026-08-10)](../trivy/snippets/2026-08-10-first-trivy-scan.sh) — Scan an image, filter by severity, and export JSON.

## Stage 5: Mastery

Advanced patterns and production-ready configurations across the full stack.

- ⏳ GitOps workflows with full Kubernetes deployments
- ⏳ Advanced networking and service meshes
- ⏳ Secret management and CI/CD security hardening

## Progression Map

```
Stage 1 → Stage 2 → Stage 3 → Stage 4 → Stage 5
             ↓         ↓         ↓         ↓
      Concepts   →  Core     → Quickstart → Compose  → Advanced
    (Cloud,      →  Tools    → CLI Notes  → K8s     → GitOps
     Container,   → (K8s,     → Branch/    → Install
      IaC,         Terraform,  → Conflict   → State
     Scripting)    GitHub     → Docker     → Multi-env
             ↓      Actions)    Port Map    GHA
      Git/Docker          ↓         ↓
      Primers       K8s Debug  K8s Debug
             ↓       (describe, (describe,
      Linux/Net     logs,        logs,
             ↓       events)     events)
      Networking
```
