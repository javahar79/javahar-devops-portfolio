# Topics

> A map of what's here. For a beginner-to-advanced reading order, see [learning-path.md](learning-path.md).

## Docker · 67 files

- **primer:** [primer-docker](../docker/notes/0000-primer-docker.md)
- **notes** (20): most recent → [Docker Quickstart — What Tripped Me Up (2026-07-18)](../docker/notes/2026-07-18-docker-quickstart-tripped-me.md), [Docker Quickstart — What Tripped Me Up (2026-07-16)](../docker/notes/2026-07-16-docker-quickstart-tripped-me.md), [Docker Quickstart Trials (2026-07-08)](../docker/notes/2026-07-08-docker-quickstart-trials.md)
- **scripts** (21): most recent → [Build Multi-Stage with Secrets (2026-07-31)](../docker/scripts/build-multi-stage-with-secrets.sh), [Run Container Port Map (2026-07-18)](../docker/scripts/2026-07-18-run-container-port-map.sh), [Automating Container Lifecycle](../docker/scripts/automating-container-lifecycle.sh)
- **dockerfiles** (22): most recent → [Multi-Stage BuildKit Distroless (2026-07-18)](../docker/dockerfiles/2026-07-18-tagged-nonroot.Dockerfile), [Multi-Stage Python Webapp](../docker/dockerfiles/multi-stage-python-webapp.Dockerfile), [Minimal Multi-Stage](../docker/dockerfiles/minimal-multi-stage.Dockerfile)
- **configs** (1): [Multi-Service Compose](../docker/configs/multi-service-compose.yaml)
- **docs** (2): [Multi-Stage vs Distroless vs Alpine](../docker/docs/multi-stage-vs-distroless-vs-alpine.md), [Dockerfile Antipatterns](../docker/docs/dockerfile-antipatterns.md)
- **notebooks** (1): [Multi-Service Compose Walkthrough](../docker/notebooks/multi-service-compose.ipynb)
- _…and browse `docker/` for the full collection._

## Git · 17 files

- **primer:** [primer-git](../git/notes/0000-primer-git.md)
- **notes** (7): most recent → [Common Git Mistakes (2026-07-20)](../git/notes/2026-07-20-common-git-mistakes.md), [Git Undo/Stage/Commit/Push (2026-07-19)](../git/notes/2026-07-19-git-undo-stage-commit-push.md), [Git Quickstart Trials (2026-07-19)](../git/notes/2026-07-19-git-quickstart-trials.md)
- **scripts** (7): most recent → [Automate Git Bisect (2026-07-30)](../git/scripts/git-bisect-automation.sh), [Branch, Merge, and Revert Workflow (2026-07-20)](../git/scripts/2026-07-20-branch-merge-revert-workflow.sh), [Clean Git History (2026-07-20)](../git/scripts/2026-07-20-clean-git-history.sh)
- **configs** (1): [.gitattributes: merge, EOL, diff](../git/configs/gitattributes-merge-eol-diff.gitattributes)
- **docs** (1): [Git Merge vs Rebase](../git/docs/git-merge-vs-rebase.md)
- **notebooks** (1): [Git Bisect Automation & History Rewrite](../git/notebooks/git-bisect-automation-and-history-rewrite.ipynb)
- _…and browse `git/` for the full collection._

## GitHub Actions · 16 files

- **primer:** [primer-github-actions](../github-actions/notes/0000-primer-github-actions.md)
- **notes** (4): [GHA Quickstart — What Tripped Me Up (2026-07-21)](../github-actions/notes/2026-07-21-gha-quickstart-tripped-me.md), [GHA Quickstart — What Tripped Me Up (2026-07-09)](../github-actions/notes/2026-07-09-gha-quickstart-trials.md), [GitHub Actions UI Walkthrough (2026-06-16)](../github-actions/notes/2026-06-16-explore-gha-ui.md)
- **configs** (6): most recent → [Reusable Workflow with Inputs](../github-actions/configs/reusable-workflow-with-inputs.yaml), [CI Workflow](../github-actions/configs/ci-workflow.yaml), [Minimal CI Workflow (2026-07-19)](../github-actions/configs/2026-07-19-minimal-ci-workflow.yaml), [Minimal CI Workflow (2026-07-12)](../github-actions/configs/2026-07-12-minimal-ci-workflow.yaml), [Debug Run-Name & Conditions (2026-07-19)](../github-actions/configs/2026-07-19-debug-run-name-conditions.yaml)
- **docs** (3): [Reading Workflow Logs and Debugging (2026-07-19)](../github-actions/docs/2026-07-19-reading-workflow-logs-and-debugging.md), [Reading Workflow Logs and Debugging (2026-07-10)](../github-actions/docs/2026-07-10-reading-workflow-logs-and-debugging.md), [Matrix Builds & Conditional Deploys](../github-actions/docs/matrix-builds-conditional-deploys.md)
- **scripts** (2): [Validate Workflow Runs (2026-07-21)](../github-actions/scripts/2026-07-21-validate-workflow-runs.sh), [Audit Failed Workflow Runs](../github-actions/scripts/audit-failed-workflow-runs.sh)
- **snippets** (1): [Complex Reusable Workflow: Matrix, Approvals, Rollback](../github-actions/snippets/complex-reusable-workflow-matrix-approvals.yaml)
- _…and browse `github-actions/` for the full collection._

## Kubernetes · 17 files

- **primer:** [primer-kubernetes](../kubernetes/notes/0000-primer-kubernetes.md)
- **notes** (4): most recent → [K8s Quickstart — What Tripped Me Up (2026-07-19)](../kubernetes/notes/2026-07-19-k8s-quickstart-trials.md), [K8s Quickstart — What Tripped Me Up (2026-07-10)](../kubernetes/notes/2026-07-10-k8s-quickstart-trials.md), [kubectl CLI Exploration (2026-06-16)](../kubernetes/notes/2026-06-16-explore-kubectl.md)
- **scripts** (4): most recent → [kubectl Rollout vs Edit (2026-07-30)](../kubernetes/scripts/kubectl-rollout-vs-edit.sh), [Troubleshoot Failing Deployments (2026-07-21)](../kubernetes/scripts/2026-07-21-troubleshoot-failing-deployment.sh), [Troubleshoot Pods (2026-07-19)](../kubernetes/scripts/2026-07-19-troubleshoot-pods.sh)
- **docs** (3): most recent → [ConfigMaps, Secrets, and env vars (2026-07-30)](../kubernetes/docs/configmaps-secrets-env-vars.md), [Inspecting Pods, Services, and Events (2026-07-19)](../kubernetes/docs/2026-07-19-inspecting-pods-services-events.md), [Inspecting Pods, Services, and Events (2026-07-12)](../kubernetes/docs/2026-07-12-inspecting-pods-services-events.md)
- **manifests** (4): most recent → [StatefulSet PostgreSQL with PVC (2026-07-31)](../kubernetes/manifests/statefulset-postgresql-pvc.yaml), [Minimal Deployment + Service (2026-07-21)](../kubernetes/manifests/2026-07-21-minimal-deployment-service.yaml), [Minimal Deployment + Service (2026-07-10)](../kubernetes/manifests/2026-07-10-minimal-deployment-service.yaml), [StatefulSet PostgreSQL](../kubernetes/manifests/statefulset-postgresql.yaml)
- **snippets** (1): [Debugging Port-Forward, Exec, and Logs (2026-07-21)](../kubernetes/snippets/2026-07-21-debugging-port-forward-exec-logs.sh)
- **notebooks** (1): [Multi-Tier App Debugging Walkthrough](../kubernetes/notebooks/multi-tier-app-debugging-walkthrough.ipynb)
- _…and browse `kubernetes/` for the full collection._

## Terraform · 23 files

- **primer:** [primer-terraform](../terraform/notes/0000-primer-terraform.md)
- **notes** (10): most recent → [What I Learned from Validate and Plan (2026-07-21)](../terraform/notes/2026-07-21-what-i-learned-from-validate-and-plan.md), [What Tripped Me Up Quickstart (2026-07-21)](../terraform/notes/2026-07-21-what-tripped-me-up-quickstart.md), [Terraform Directory Structure (2026-07-19)](../terraform/notes/2026-07-19-terraform-directory-structure.md)
- **configs** (6): [Variables, Outputs, and Dependencies (2026-07-22)](../terraform/configs/2026-07-22-variables-outputs-dependencies.hcl), [VPC Multi-Resource Infrastructure](../terraform/configs/vpc-multi-resource-infrastructure.hcl), [Local Provider Config](../terraform/configs/local-provider.hcl)
- **docs** (2): [State Files & Remote Backends (2026-07-22)](../terraform/docs/2026-07-22-terraform-state-files-remote-backends.md), [Workspaces vs Directory-per-Env](../terraform/docs/terraform-workspaces-vs-directory-per-env.md)
- **scripts** (4): [Remote State Management (S3 + DynamoDB)](../terraform/scripts/remote-state-management-s3.sh), [Terraform Lifecycle (2026-07-22)](../terraform/scripts/2026-07-22-terraform-lifecycle.sh), [Terraform Vars and Outputs (2026-07-21)](../terraform/scripts/2026-07-21-terraform-vars-and-outputs.sh)
- **notebooks** (1): [Terraform State, Backends, and Modules](../terraform/notebooks/terraform-state-backends-and-modules.ipynb)
- _…and browse `terraform/` for the full collection._

## Cross-cutting concepts · 17 files

- **CI/CD concepts** (6): [CI/CD Primer](../docs/concepts/ci-cd-concepts/0000-primer-ci-cd-concepts.md), [CI/CD Workflow Overview (2026-07-19)](../docs/concepts/ci-cd-concepts/2026-07-19-ci-cd-workflow-overview.md), [Minimal CI Pipeline Script (2026-07-23)](../docs/concepts/ci-cd-concepts/scripts/2026-07-23-minimal-ci-pipeline.sh), [Intro to CI/CD Core Concepts (2026-07-23)](../docs/concepts/ci-cd-concepts/notebooks/2026-07-23-intro-to-cicd-core-concepts-with-interactive-examples.ipynb), [CI/CD Pipeline Stage Patterns (2026-07-31)](../docs/concepts/ci-cd-concepts/snippets/2026-07-31-cicd-pipeline-stage-patterns.yaml), [State-Aware IaC Pipelines (2026-07-31)](../docs/concepts/ci-cd-concepts/state-aware-iac-pipelines.md)
- **Cloud Computing** (1): [Cloud Computing Fundamentals Primer](../docs/concepts/cloud-computing-fundamentals/0000-primer-cloud-computing-fundamentals.md)
- **Container Fundamentals** (1): [Container Fundamentals Primer](../docs/concepts/container-fundamentals/0000-primer-container-fundamentals.md)
- **Git & version control** (3): [Git Version Control Primer](../docs/concepts/git-version-control/0000-primer-git-version-control.md), [Git Branching, Merging, and Conflicts (2026-07-22)](../docs/concepts/git-version-control/scripts/2026-07-22-git-branching-merging-conflicts.sh), [Common Rebase and Reset Patterns (2026-07-27)](../docs/concepts/git-version-control/snippets/2026-07-27-common-rebase-reset-patterns.sh)
- **Infrastructure as Code** (2): [Infrastructure as Code Primer](../docs/concepts/infrastructure-as-code/0000-primer-infrastructure-as-code.md), [Common Modular Configs](../docs/concepts/infrastructure-as-code/snippets/2026-07-27-common-modular-versioned-configs.hcl)
- **Linux OS fundamentals** (1): [Linux Primer](../docs/concepts/linux-os-fundamentals/0000-primer-linux-os-fundamentals.md)
- **Networking basics** (1): [Networking Primer](../docs/concepts/networking-basics/0000-primer-networking-basics.md)
- **Scripting & Automation** (2): [Scripting & Automation Primer](../docs/concepts/scripting-automation/0000-primer-scripting-automation.md), [Common Loops and Conditions](../docs/concepts/scripting-automation/snippets/2026-07-27-common-loops-conditions-file-patterns.sh)