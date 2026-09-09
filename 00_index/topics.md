# Topics

> A map of what's here. For a beginner-to-advanced reading order, see [learning-path.md](learning-path.md).

## Docker · 90 files

- **primer:** [primer-docker](../docker/notes/0000-primer-docker.md)
- **notes** (21): most recent → [Install Docker from the Official APT Repo (2026-08-14)](../docker/notes/2026-08-14-install-docker-from-official-apt-repo.md), [Docker Quickstart — What Tripped Me Up (2026-07-18)](../docker/notes/2026-07-18-docker-quickstart-tripped-me.md), [Docker Quickstart — What Tripped Me Up (2026-07-16)](../docker/notes/2026-07-16-docker-quickstart-tripped-me.md)
- **scripts** (21): [Build Multi-Stage with Secrets (2026-07-31)](../docker/scripts/build-multi-stage-with-secrets.sh), [Run Container Port Map (2026-07-18)](../docker/scripts/2026-07-18-run-container-port-map.sh), [Automating Container Lifecycle](../docker/scripts/automating-container-lifecycle.sh)
- **dockerfiles** (22): most recent → [Multi-Stage BuildKit Distroless (2026-07-18)](../docker/dockerfiles/2026-07-18-tagged-nonroot.Dockerfile), [Multi-Stage Python Webapp](../docker/dockerfiles/multi-stage-python-webapp.Dockerfile), [Minimal Multi-Stage](../docker/dockerfiles/minimal-multi-stage.Dockerfile)
- **configs** (2): [Multi-Service Compose](../docker/configs/multi-service-compose.yaml), [daemon.json — log rotation & limits (2026-08-14)](../docker/configs/2026-08-14-daemon-json.json)
- **docs** (3): [Docker + Terraform Integration Patterns (2026-08-14)](../docker/docs/docker-terraform-integration-patterns.md), [Multi-Stage vs Distroless vs Alpine](../docker/docs/multi-stage-vs-distroless-vs-alpine.md), [Dockerfile Antipatterns](../docker/docs/dockerfile-antipatterns.md)
- **manifests** (2): [Kubernetes Deployment with Resource Limits](../docker/manifests/kubernetes-deployment-resource-limits.yaml), [Multi-Service App](../docker/manifests/multi-service-app.yaml)
- **notebooks** (1): [Multi-Service Compose Walkthrough](../docker/notebooks/multi-service-compose.ipynb)
- **snippets** (1): [First Docker CLI Snippet (2026-08-14)](../docker/snippets/2026-08-14-first-docker-cli.sh)
- **templates** (17): [Project Scaffold: Compose + K8s](../docker/templates/project-scaffold-docker-k8s/README.md), [Project Scaffold README](../docker/templates/project-scaffold-docker-compose/README.md)
- _…and browse `docker/` for the full collection._

## Git · 27 files

- **primer:** [primer-git](../git/notes/0000-primer-git.md)
- **notes** (9): most recent → [Install Git and First Commit Workflow (2026-08-17)](../git/notes/2026-08-17-install-git-first-commit-workflow.md), [Install Git and Log First Commit (2026-08-08)](../git/notes/2026-08-08-install-git-and-log-first-commit.md), [Common Git Mistakes (2026-07-20)](../git/notes/2026-07-20-common-git-mistakes.md)
- **scripts** (8): [Sync Fork & Clean Merged Branches (2026-08-16)](../git/scripts/sync-fork-and-clean-merged.sh), [Automate Git Bisect](../git/scripts/git-bisect-automation.sh), [Clean Git History (2026-07-20)](../git/scripts/2026-07-20-clean-git-history.sh)
- **docs** (2): [Git Worktrees & Cherry-Pick for Release Management](../git/docs/git-worktrees-cherry-pick-release-management.md), [Git Merge vs Rebase](../git/docs/git-merge-vs-rebase.md)
- **templates** (4): [Project Scaffold: Git Branching Convention](../git/templates/project-scaffold-git-branching/README.md)
- **configs** (2): [.gitattributes: merge, EOL, diff](../git/configs/gitattributes-merge-eol-diff.gitattributes), [Monorepo Sparse-Checkout & Conditional Includes](../git/configs/monorepo-sparse-checkout-conditional-includes.ini)
- **notebooks** (1): [Git Bisect Automation & History Rewrite](../git/notebooks/git-bisect-automation-and-history-rewrite.ipynb)
- **snippets** (1): [First Git Branch and Merge (2026-08-08)](../git/snippets/2026-08-08-first-git-branch-and-merge.sh)
- _…and browse `git/` for the full collection._

## GitHub Actions · 19 files

- **primer:** [primer-github-actions](../github-actions/notes/0000-primer-github-actions.md)
- **notes** (5): most recent → [First Workflow and Actions Tab (2026-08-12)](../github-actions/notes/2026-08-12-first-workflow-and-actions-tab.md), [GHA Quickstart — What Tripped Me Up (2026-07-21)](../github-actions/notes/2026-07-21-gha-quickstart-tripped-me.md), [GHA Quickstart — What Tripped Me Up (2026-07-09)](../github-actions/notes/2026-07-09-gha-quickstart-trials.md)
- **configs** (8): most recent → [Manual Deploy with Input & Dependent Job (2026-08-18)](../github-actions/configs/2026-08-18-manual-workflow-dispatch-dependent-job.yaml), [First Build on Push (2026-08-12)](../github-actions/configs/2026-08-12-first-build-on-push.yaml), [Reusable Workflow with Inputs](../github-actions/configs/reusable-workflow-with-inputs.yaml)
- **docs** (3): [Reading Workflow Logs and Debugging (2026-07-19)](../github-actions/docs/2026-07-19-reading-workflow-logs-and-debugging.md), [Reading Workflow Logs and Debugging (2026-07-10)](../github-actions/docs/2026-07-10-reading-workflow-logs-and-debugging.md), [Matrix Builds & Conditional Deploys](../github-actions/docs/matrix-builds-conditional-deploys.md)
- **scripts** (2): [Validate Workflow Runs (2026-07-21)](../github-actions/scripts/2026-07-21-validate-workflow-runs.sh), [Audit Failed Workflow Runs](../github-actions/scripts/audit-failed-workflow-runs.sh)
- **snippets** (1): [Complex Reusable Workflow: Matrix, Approvals, Rollback](../github-actions/snippets/complex-reusable-workflow-matrix-approvals.yaml)
- _…and browse `github-actions/` for the full collection._

## Kubernetes · 25 files

- **primer:** [primer-kubernetes](../kubernetes/notes/0000-primer-kubernetes.md)
- **notes** (6): most recent → [Install minikube and log first cluster interaction (2026-08-10)](../kubernetes/notes/2026-08-10-install-minikube-and-log-my-first-kubernetes-cluster-interaction.md), [Install kubectl and Explore Cluster (2026-08-08)](../kubernetes/notes/2026-08-08-install-kubectl-and-explore-cluster.md), [K8s Quickstart — What Tripped Me Up (2026-07-19)](../kubernetes/notes/2026-07-19-k8s-quickstart-trials.md)
- **scripts** (7): most recent → [Deploy, Rollout, and Rollback (2026-08-20)](../kubernetes/scripts/deploy-rollout-rollback.sh), [Deploy, Rollout Status, and Rollback (2026-08-20)](../kubernetes/scripts/deploy-rollout-status-rollback.sh), [First kubectl Command (2026-08-08)](../kubernetes/scripts/2026-08-08-first-kubectl-command.sh)
- **docs** (4): most recent → [Service Networking: ClusterIP, NodePort, LoadBalancer, Ingress](../kubernetes/docs/service-networking-clusterip-nodeport-loadbalancer-ingress.md), [ConfigMaps, Secrets, and env vars](../kubernetes/docs/configmaps-secrets-env-vars.md), [Inspecting Pods, Services, and Events (2026-07-19)](../kubernetes/docs/2026-07-19-inspecting-pods-services-events.md)
- **manifests** (5): most recent → [Production Deployment with Rolling Updates, Probes, PDB (2026-08-18)](../kubernetes/manifests/production-deployment-rolling-updates-probes-pdb.yaml), [StatefulSet PostgreSQL with PVC (2026-07-31)](../kubernetes/manifests/statefulset-postgresql-pvc.yaml), [Minimal Deployment + Service (2026-07-21)](../kubernetes/manifests/2026-07-21-minimal-deployment-service.yaml)
- **snippets** (2): [Debugging Port-Forward, Exec, and Logs (2026-07-21)](../kubernetes/snippets/2026-07-21-debugging-port-forward-exec-logs.sh), [First kubectl Deploy, Inspect, Delete (2026-08-12)](../kubernetes/snippets/2026-08-12-first-kubectl-deploy-inspect-delete.sh)
- **notebooks** (1): [Multi-Tier App Debugging Walkthrough](../kubernetes/notebooks/multi-tier-app-debugging-walkthrough.ipynb)
- _…and browse `kubernetes/` for the full collection._

## k8s · 7 files

- **templates** (7): [Sample-App Scaffold README](../k8s/templates/project-scaffold-sample-app/README.md) — A ready-to-apply Kubernetes sample app: Deployment, Service, Ingress, ConfigMap, Secret, and Namespace
- _…and browse `k8s/` for the full collection._

## Terraform · 22 files

- **primer:** [primer-terraform](../terraform/notes/0000-primer-terraform.md)
- **notes** (10): most recent → [What I Learned from Validate and Plan (2026-07-21)](../terraform/notes/2026-07-21-what-i-learned-from-validate-and-plan.md), [What Tripped Me Up Quickstart (2026-07-21)](../terraform/notes/2026-07-21-what-tripped-me-up-quickstart.md), [Terraform Directory Structure (2026-07-19)](../terraform/notes/2026-07-19-terraform-directory-structure.md)
- **configs** (6): [Variables, Outputs, and Dependencies (2026-07-22)](../terraform/configs/2026-07-22-variables-outputs-dependencies.hcl), [VPC Multi-Resource Infrastructure](../terraform/configs/vpc-multi-resource-infrastructure.hcl), [Local Provider Config](../terraform/configs/local-provider.hcl)
- **docs** (2): [State Files & Remote Backends (2026-07-22)](../terraform/docs/2026-07-22-terraform-state-files-remote-backends.md), [Workspaces vs Directory-per-Env](../terraform/docs/terraform-workspaces-vs-directory-per-env.md)
- **scripts** (4): [Remote State Management (S3 + DynamoDB)](../terraform/scripts/remote-state-management-s3.sh), [Terraform Lifecycle (2026-07-22)](../terraform/scripts/2026-07-22-terraform-lifecycle.sh), [Terraform Vars and Outputs (2026-07-21)](../terraform/scripts/2026-07-21-terraform-vars-and-outputs.sh)
- _…and browse `terraform/` for the full collection._

## TF · 27 files

- **templates** (18): [Multi-Service Deployment Scaffold](../tf/templates/multi-service-deployment/README.md), [Terraform Pipeline Scaffold](../tf/templates/tf-027-pipeline-scaffold/README.md)
- **configs** (3): [VPC Reusable Module — main.tf](../tf/configs/vpc-reusable-module/main.hcl), [VPC Reusable Module — variables.tf](../tf/configs/vpc-reusable-module/variables.hcl), [VPC Reusable Module — outputs.tf](../tf/configs/vpc-reusable-module/outputs.hcl)
- **notebooks** (2): most recent → [Terraform State, Backends, and Modules](../tf/notebooks/terraform-state-backends-and-modules.ipynb), [Terraform Modules, State, and Workspaces](../tf/notebooks/terraform-modules-state-workspaces.ipynb)
- **docs** (2): [Terraform + GitHub Actions CI/CD Integration (2026-08-10)](../tf/docs/terraform-github-actions-ci-cd.md), [Remote State Reference: S3 + DynamoDB Isolation (2026-08-21)](../tf/docs/remote-state-reference-s3-dynamodb-state-isolation.md)
- **manifests** (1): [Production Terraform Workspace with Remote State Locking (2026-08-10)](../tf/manifests/production-terraform-workspace-remote-state-locking.yaml)
- **dockerfiles** (1): [Terraform Provisioning (2026-08-09)](../tf/dockerfiles/multi-stage-dockerfile-terraform-provisioning.Dockerfile)
- _…and browse `tf/` for the full collection._

## Ansible · 3 files

- **primer:** [primer-ansible](../ansible/notes/0000-primer-ansible.md)
- **notes** (2): most recent → [Install Ansible and Run First Command (2026-08-05)](../ansible/notes/2026-08-05-install-ansible-and-run-first-command.md), [Ansible Primer (2026-08-05)](../ansible/notes/0000-primer-ansible.md)
- **configs** (1): [First Ping Playbook](../ansible/configs/2026-08-05-first-ping-playbook.yaml)
- _…and browse `ansible/` for the full collection._

## OpenTofu · 7 files

- **primer:** [primer-opentofu](../of/notes/0000-primer-opentofu.md)
- **notes** (3): most recent → [OpenTofu Quickstart — What Tripped Me Up (2026-08-14)](../of/notes/2026-08-14-opentofu-quickstart-trip-ups.md), [OpenTofu — log my first command (2026-08-11)](../of/notes/2026-08-11-first-opentofu-command.md), [OpenTofu Primer (2026-08-05)](../of/notes/0000-primer-opentofu.md)
- **configs** (2): [S3 Backend & State Locking (2026-08-15)](../of/configs/2026-08-15-s3-backend-state-locking.hcl), [First Resource](../of/configs/2026-08-05-first-resource.hcl)
- **scripts** (1): [Install OpenTofu (2026-08-06)](../of/scripts/2026-08-06-install-opentofu.sh)
- **snippets** (1): [Provision a Local Resource (2026-08-15)](../of/snippets/2026-08-15-provision-local-resource.hcl)
- _…and browse `of/` for the full collection._

## Pulumi · 3 files

- **primer:** [primer-pulumi](../pulumi/notes/0000-primer-pulumi.md)
- **notes** (1): [Pulumi Primer (2026-08-10)](../pulumi/notes/0000-primer-pulumi.md)
- **snippets** (1): [First Pulumi Program (2026-08-10)](../pulumi/snippets/2026-08-10-first-pulumi-program.py)
- **configs** (1): [My First Pulumi Stack Config (2026-08-11)](../pulumi/configs/2026-08-11-my-first-pulumi-stack.yaml)
- _…and browse `pulumi/` for the full collection._

## Trivy · 5 files

- **primer:** [primer-trivy](../trivy/notes/0000-primer-trivy.md)
- **notes** (3): most recent → [Scan First Container Image (2026-08-23)](../trivy/notes/2026-08-23-scan-first-container-image.md), [First Trivy Scan (2026-08-10)](../trivy/notes/2026-08-10-first-trivy-scan.md)
- **snippets** (2): [First Trivy Commands (2026-08-23)](../trivy/snippets/2026-08-23-first-trivy-commands.sh), [First Trivy Scan Snippet (2026-08-10)](../trivy/snippets/2026-08-10-first-trivy-scan.sh)
- _…and browse `trivy/` for the full collection._

## Jenkins · 5 files

- **primer:** [primer-jenkins](../jenkins/notes/0000-primer-jenkins.md)
- **notes** (3): most recent → [Followed Jenkins Quickstart (2026-08-23)](../jenkins/notes/2026-08-23-followed-jenkins-quickstart.md), [Install Jenkins and Open Web UI (2026-08-06)](../jenkins/notes/2026-08-06-install-jenkins-and-open-web-ui.md), [Jenkins Primer (2026-08-06)](../jenkins/notes/0000-primer-jenkins.md)
- **configs** (1): [Minimal Declarative Jenkinsfile (2026-08-23)](../jenkins/configs/2026-08-23-minimal-declarative-jenkinsfile.groovy)
- **snippets** (1): [Run First Pipeline](../jenkins/snippets/2026-08-06-run-first-pipeline.groovy)
- _…and browse `jenkins/` for the full collection._

## Cross-cutting concepts · 42 files

- **CI/CD concepts** (8): [CI/CD Primer](../docs/concepts/ci-cd-concepts/0000-primer-ci-cd-concepts.md), [Branch Strategies for Automated Pipelines (2026-08-16)](../docs/concepts/ci-cd-concepts/branch-strategies-for-automated-pipelines.md), [State-Aware IaC Pipelines (2026-07-31)](../docs/concepts/ci-cd-concepts/state-aware-iac-pipelines.md), [Integrating CI with GitOps](../docs/concepts/ci-cd-concepts/integrating-ci-with-gitops.md), [CI/CD Workflow Overview (2026-07-19)](../docs/concepts/ci-cd-concepts/2026-07-19-ci-cd-workflow-overview.md), [Minimal CI Pipeline Script (2026-07-23)](../docs/concepts/ci-cd-concepts/scripts/2026-07-23-minimal-ci-pipeline.sh), [Intro to CI/CD Core Concepts (2026-07-23)](../docs/concepts/ci-cd-concepts/notebooks/2026-07-23-intro-to-cicd-core-concepts-with-interactive-examples.ipynb), [CI/CD Stage Patterns (2026-07-31)](../docs/concepts/ci-cd-concepts/snippets/2026-07-31-cicd-pipeline-stage-patterns.yaml)
- **Cloud Computing** (5): [Cloud Computing Fundamentals Primer](../docs/concepts/cloud-computing-fundamentals/0000-primer-cloud-computing-fundamentals.md), [Cloud Deployment Patterns (2026-08-14)](../docs/concepts/cloud-computing-fundamentals/cloud-deployment-patterns.md), [Infrastructure Patterns — Structural Parity Check (2026-08-14)](../docs/concepts/cloud-computing-fundamentals/scripts/infrastructure-patterns.py), [Practice Cloud Computing Exercises (2026-08-04)](../docs/concepts/cloud-computing-fundamentals/scripts/2026-08-04-practice-cloud-computing-exercises.sh), [Common Patterns for Networking, IAM, and Storage (2026-08-04)](../docs/concepts/cloud-computing-fundamentals/snippets/2026-08-04-common-patterns-for-networking-iam-and-storage.sh)
- **Container Fundamentals** (5): [Container Fundamentals Primer](../docs/concepts/container-fundamentals/0000-primer-container-fundamentals.md), [Multi-Container Application Patterns (2026-08-14)](../docs/concepts/container-fundamentals/multi-container-application-patterns.md), [Dockerfile Layers and Registry Script (2026-08-04)](../docs/concepts/container-fundamentals/scripts/2026-08-04-dockerfile-layers-registry.sh), [Common Patterns for Multi-Stage Builds and Non-Root Runtimes (2026-08-04)](../docs/concepts/container-fundamentals/snippets/2026-08-04-common-patterns-for-multi-stage-builds-and-non-root-runtimes.dockerfile), [Container Networking Patterns (2026-08-04)](../docs/concepts/container-fundamentals/scripts/container-networking-patterns.sh)
- **Git & version control** (5): [Git Version Control Primer](../docs/concepts/git-version-control/0000-primer-git-version-control.md), [Branch Strategies for CI (2026-08-14)](../docs/concepts/git-version-control/branch-strategies-for-ci.md), [Git Branching, Merging, and Conflicts (2026-07-22)](../docs/concepts/git-version-control/scripts/2026-07-22-git-branching-merging-conflicts.sh), [Common Rebase and Reset Patterns (2026-07-27)](../docs/concepts/git-version-control/snippets/2026-07-27-common-rebase-reset-patterns.sh), [Automated Release Process (2026-08-14)](../docs/concepts/git-version-control/snippets/automated-release-process.sh)
- **Infrastructure as Code** (5): [Infrastructure as Code Primer](../docs/concepts/infrastructure-as-code/0000-primer-infrastructure-as-code.md), [Automated Provisioning Pipeline (2026-08-12)](../docs/concepts/infrastructure-as-code/automated-provisioning-pipeline.md), [Declarative Config CLI Exercises (2026-08-04)](../docs/concepts/infrastructure-as-code/scripts/2026-08-04-declarative-config-cli-exercises.sh), [Common Modular Configs](../docs/concepts/infrastructure-as-code/snippets/2026-07-27-common-modular-versioned-configs.hcl), [Terraform Module Exploration (2026-08-12)](../docs/concepts/infrastructure-as-code/notebooks/terraform-module-exploration.ipynb)
- **Linux OS fundamentals** (4): [Linux Primer](../docs/concepts/linux-os-fundamentals/0000-primer-linux-os-fundamentals.md), [Process & Service Management with systemd (2026-08-21)](../docs/concepts/linux-os-fundamentals/scripts/2026-08-21-process-service-management-systemd.sh), [Shell Scripting Fundamentals (2026-08-10)](../docs/concepts/linux-os-fundamentals/scripts/2026-08-10-shell-scripting-fundamentals.sh), [System Admin Patterns (2026-08-10)](../docs/concepts/linux-os-fundamentals/snippets/2026-08-10-system-admin-patterns.sh)
- **Networking basics** (4): [Networking Primer](../docs/concepts/networking-basics/0000-primer-networking-basics.md), [Network Diagnostics & Traffic Analysis (2026-08-15)](../docs/concepts/networking-basics/scripts/2026-08-15-network-diagnostics-traffic-analysis.sh), [DNS and Connectivity Checks (2026-08-14)](../docs/concepts/networking-basics/scripts/2026-08-14-dns-and-connectivity-checks.sh), [Networking Exercises (2026-08-05)](../docs/concepts/networking-basics/scripts/2026-08-05-networking-exercises.sh)
- **Scripting & Automation** (6): [Scripting & Automation Primer](../docs/concepts/scripting-automation/0000-primer-scripting-automation.md), [Automated Build Pipeline](../docs/concepts/scripting-automation/automated-build-pipeline.md), [Container Lifecycle Management (2026-08-15)](../docs/concepts/scripting-automation/scripts/container-lifecycle-management.sh), [Automated Terraform Workflow (2026-08-04)](../docs/concepts/scripting-automation/scripts/automated-terraform-workflow.sh), [Scheduling, Error Handling, and Parsing (2026-08-04)](../docs/concepts/scripting-automation/scripts/2026-08-04-scheduling-error-handling-parsing.sh), [Common Loops and Conditions](../docs/concepts/scripting-automation/snippets/2026-07-27-common-loops-conditions-file-patterns.sh)
- _…and browse `docs/concepts/` for the full collection._
