# Changelog

## 2026-08-17

- Reworked Git branching convention scaffold template — removed unverifiable version prerequisites (git-021)

## 2026-08-16

- Added reusable Git helper script to clean up merged local branches and sync a fork with its upstream remote (git-020)
- Added branch strategies for automated pipelines doc combining CI/CD Concepts with Git & Version Control — trunk-based, GitHub Flow, GitFlow, and pipeline trigger mapping (con-066)
- Added Git branching convention scaffold template with pre-commit hook and branching-convention docs (git-021)

## 2026-08-15

- Added container lifecycle management script combining Scripting & Automation with Container Fundamentals — create, start, verify, stop, remove lifecycle (con-067)
- Added network diagnostics and traffic analysis practice script for Networking Basics — connectivity, listeners, and active connection states (con-068)
- Added minimal OpenTofu program snippet — local_file resource with required_providers and output (of-006)
- Added OpenTofu S3 backend HCL config with DynamoDB state locking (of-007)

## 2026-08-14

- Added Docker + Kubernetes multi-service project scaffold template — Compose for local dev, K8s manifests (Deployment, Service, Ingress, StatefulSet + PVC) for cluster deploy (docker-018)
- Added OpenTofu official quickstart walkthrough notes — plan/apply loop, state file, destroy lifecycle (of-005)
- Added Docker install-from-official-apt-repo notes and hello-world run (docker-015)
- Added first Docker CLI bash snippet covering pull, run, list, and inspect (docker-016)
- Added Docker daemon.json config for log rotation and resource limits (docker-017)
- Added branch-strategies-for-ci doc combining Git & Version Control with CI/CD Concepts — trunk-based, GitFlow, feature-branch flow, and CI policy wiring (con-061)
- Added automated-release-process bash snippet combining Git & Version Control with Scripting & Automation — tag-based release flow (con-062)
- Added DNS and connectivity checks practice script for Networking Basics — resolution, reverse lookup, port and HTTP checks (con-065)
- Added cloud deployment patterns doc combining Cloud Computing Fundamentals with CI/CD — GitOps, environment-as-code, canary and red-black rollback (con-059)
- Added cloud infrastructure cross-environment consistency script (environment-as-code drift checker) in Python (con-060)
- Added multi-container application patterns doc for Container Fundamentals — sidecar, one-concern-per-container, volumes, service discovery (con-058)
- Added Docker + Terraform integration patterns for infrastructure provisioning doc — provider, provisioner, and image-build patterns (docker-019)

## 2026-08-12

- Added automated provisioning pipeline doc combining Infrastructure as Code with CI/CD — plan on PR, approved apply, remote state with locking (con-055)
- Added Terraform module exploration notebook covering module interfaces, calling modules from a root, and reading real-world modules (con-056)
- Added container networking patterns script covering bridge/host/none modes, port publishing, and shared-network service discovery (con-057)

## 2026-08-10

- Added Pulumi quick primer covering what Pulumi is, key terminology, and a tiny first program example (pulumi-004)
- Added first Pulumi program in Python creating an AWS S3 bucket (pulumi-005)
- Added first Trivy container image scan bash snippet with severity filtering and JSON output (trivy-006)
- Added minikube install and first cluster interaction notes covering start, deployment creation, and addon troubleshooting (k8s-012)
- Added first Trivy vulnerability scan notes covering basic scan execution, severity filtering, and next steps (trivy-005)
- Added shell scripting fundamentals practice script demonstrating variables, conditionals, loops, and functions (con-063)
- Added Linux system administration patterns snippet covering disk usage, process inspection, service checks, and large file discovery (con-064)
- Added Terraform + GitHub Actions CI/CD integration doc covering remote state, credential scoping, plan/apply workflows, and environment promotion (tf-023)
- Added production Terraform workspace manifest with remote S3 state and DynamoDB locking (tf-022)
- Added Trivy quick primer covering vulnerability scanning, terminology, and first-scan example (trivy-004)

## 2026-08-09

- Added multi-stage Dockerfile for Terraform provisioning workflows with provider caching and minimal runtime (tf-021)
- Added Terraform + Docker multi-service deployment project scaffold template (tf-020)

## 2026-08-08

- Reworked multi-stage Dockerfile with BuildKit cache mounts and distroless non-root runtime, fixing HEALTHCHECK exec-form syntax and updating to Docker 29.7.2 (docker-013)
- Updated companion Go service with healthcheck subcommand for distroless liveness probe (docker-013)
- Added first kubectl command and node listing script for Kubernetes CLI exploration (k8s-018)
- Added CI/CD + GitOps integration doc covering CI-to-GitOps controller flow, prerequisites, and verification steps (con-052)
- Added Scripting & Automation + Container Fundamentals automated build pipeline doc covering shell script build orchestration and idempotent CI integration (con-053)
- Added Git install and first-commit notes (git-017)
- Added Git branch and merge bash snippet (git-018)
- Added kubectl install and cluster exploration notes (k8s-016)

## 2026-08-06

- Added Kubernetes deployment manifest with resource limits and security controls for Docker images (docker-014)
- Added Docker + Compose multi-service production scaffold template (docker-012)
- Added Terraform modules, state, and workspaces interactive notebook (tf-016)
- Added OpenTofu install and version check script (of-002)
- Added Jenkins quick primer (jenkins-001), install and first-UI notes (jenkins-002), and first pipeline snippet (jenkins-003)

## 2026-08-05

- Added OpenTofu first-resource config with variables and output (of-003)
- Added Networking Basics exercises script covering DNS resolution, port testing, and SSH tunneling (con-022)
- Added Docker Compose manifest for a multi-service web app and database (docker-010)
- Added OpenTofu quick primer covering what OpenTofu is, key terminology, and a tiny example (of-001)
- Added Ansible quick primer covering what Ansible is, key terminology, and a tiny ping playbook (ansible-001)
- Added Ansible install and first-command notes (ansible-002)
- Added Ansible ping playbook config (ansible-003)

## 2026-08-04

- Added Container Fundamentals Dockerfile snippet demonstrating multi-stage builds and non-root runtimes (con-018)
- Added Cloud Computing Fundamentals CLI practice script for provisioning and managing cloud resources (con-019)
- Added Cloud Computing Fundamentals bash snippet covering networking, IAM, and storage patterns (con-020)
- Added scripting automation practice script (con-013), IaC declarative config CLI exercises (con-015), and container fundamentals Dockerfile/layers/registry script (con-017)
- Fixed invalid source URL in Terraform notebook front-matter (tf-015)

## 2026-08-03

- Updated Terraform state, backends, and modules interactive notebook with current research sources and verification date (tf-015)

## 2026-08-02

- Added Terraform state, backends, and modules interactive notebook covering state management, remote backends, and reusable modules (tf-015)

## 2026-08-01

- Added complex reusable GitHub Actions workflow snippet with matrix builds, environment approval gates, and automatic rollback trigger (gha-009)
- Added multi-tier Kubernetes app deployment and debugging notebook covering ConfigMap, StatefulSet, Deployment, Service, Ingress, and five common failure modes (k8s-010)
- Converted git bisect automation and history rewrite notebook from invalid markdown to valid Jupyter notebook JSON (git-011)

## 2026-07-31

- Added multi-stage Dockerfile with BuildKit cache mounts, distroless runtime, non-root user, and HEALTHCHECK (docker-008)
- Added bash build script demonstrating BuildKit secrets mount pattern (docker-008)
- Added StatefulSet with PVC manifest for PostgreSQL (k8s-008)
- Added state-aware CI/CD + IaC pipeline doc combining CI/CD with Infrastructure as Code (con-027)
- Added CI/CD pipeline stage patterns snippet with build, test, deploy, approval gate, and rollback stages (con-021)
- Added Docker Compose multi-service notebook: Flask web app + PostgreSQL with healthcheck, network inspection, and service discovery walkthrough (docker-007)

## 2026-07-30

- Added kubectl rollout vs edit zero-downtime comparison script (k8s-009)
- Reworked k8s-007 docs: fixed path from k8s/docs/ to kubernetes/docs/ and adjusted voice to L3 instructional tone (k8s-007)
- Added git bisect automation script for finding the first breaking commit (git-008)
- Added git merge vs git rebase comparison doc (git-009)
- Added .gitattributes config for merge strategy, EOL normalization, and diff configuration (git-010)
- Reworked k8s-007 docs again: removed L5 "When to use" and "References" sections, fixed voice to L3 instructional tone with hedging, corrected tool_version to ≥1.24 (k8s-007)

## 2026-07-29

- Added ConfigMaps, Secrets, and env vars reference doc for multi-tier K8s app (k8s-007)
- Added kubectl rollout vs edit comparison script for zero-downtime updates (k8s-009)

## 2026-07-28

- Added terraform remote state management script with S3 backend init, migrate, and lock (tf-013)

## 2026-07-27

- Reworked Linux & OS Fundamentals concept primer (con-001) — restructured sections, 800-word first-person voice, verified front-matter
- Reworked Networking Basics concept primer (con-002) — expanded terminology, refreshed diagnostic bash example, verified front-matter

- Added common rebase and reset patterns snippet (docs/concepts/git-version-control/snippets/2026-07-27-common-rebase-reset-patterns.sh)
- Added common loops, conditions, and file processing patterns snippet (docs/concepts/scripting-automation/snippets/2026-07-27-common-loops-conditions-file-patterns.sh)
- Added common modular, reusable, and versioned configs snippet (docs/concepts/infrastructure-as-code/snippets/2026-07-27-common-modular-versioned-configs.hcl)

- Added VPC multi-resource infrastructure config (terraform/configs/vpc-multi-resource-infrastructure.hcl)
- Added Terraform workspaces vs directory-per-env comparison doc (terraform/docs/terraform-workspaces-vs-directory-per-env.md)

## 2026-07-26

- Added reusable workflow config with inputs for lint-test-deploy pipeline pattern (github-actions/configs/reusable-workflow-with-inputs.yaml)

## 2026-07-25

- Added Docker image optimization comparison docs (docker/docs/multi-stage-vs-distroless-vs-alpine.md)
- Added Docker Compose container lifecycle automation script (docker/scripts/automating-container-lifecycle.sh)

## 2026-07-24

- Added matrix builds and conditional deploys docs (github-actions/docs/matrix-builds-conditional-deploys.md)
- Added failed workflow run audit script using gh CLI (github-actions/scripts/audit-failed-workflow-runs.sh)

## 2026-07-23

- Added Docker workflow script with resource limits, health checks, and volume cleanup (docker/scripts/docker-workflow-limits-healthcheck-cleanup.sh)
- Added CI/CD Concepts minimal CI pipeline practice script (docs/concepts/ci-cd-concepts/scripts/2026-07-23-minimal-ci-pipeline.sh)
- Added multi-stage Python web app Dockerfile with HEALTHCHECK and non-root user (docker/dockerfiles/multi-stage-python-webapp.Dockerfile)
- Added Dockerfile antipatterns docs on layer caching, pinned tags, and common mistakes (docker/docs/dockerfile-antipatterns.md)
- Added CI/CD Concepts interactive notebook with CI pipeline simulation and approval gates (docs/concepts/ci-cd-concepts/notebooks/2026-07-23-intro-to-cicd-core-concepts-with-interactive-examples.ipynb)

## 2026-07-22

- Added Infrastructure as Code concept primer (docs/concepts/infrastructure-as-code/0000-primer-infrastructure-as-code.md)
- Added Container Fundamentals concept primer (docs/concepts/container-fundamentals/0000-primer-container-fundamentals.md)
- Added Cloud Computing Fundamentals concept primer (docs/concepts/cloud-computing-fundamentals/0000-primer-cloud-computing-fundamentals.md)
- Added Terraform variables, outputs, and resource dependencies config (terraform/configs/2026-07-22-variables-outputs-dependencies.hcl)
- Added Terraform init/validate/plan/apply lifecycle script (terraform/scripts/2026-07-22-terraform-lifecycle.sh)

## 2026-07-21

- Added minimal Kubernetes Deployment + Service manifest (kubernetes/manifests/2026-07-21-minimal-deployment-service.yaml)
- Added GitHub Actions quickstart notes — what tripped me up (github-actions/notes/2026-07-21-gha-quickstart-tripped-me.md)
- Added Git & Version Control concept primer (docs/concepts/git-version-control/0000-primer-git-version-control.md)
- Added GitHub Actions workflow validation script with gh CLI (github-actions/scripts/2026-07-21-validate-workflow-runs.sh)
- Added kubectl debugging snippet — port-forward, exec, logs (kubernetes/snippets/2026-07-21-debugging-port-forward-exec-logs.sh)
- Added Kubernetes failing Deployment troubleshoot script (kubernetes/scripts/2026-07-21-troubleshoot-failing-deployment.sh)
- Added Terraform quickstart — what tripped me up notes (terraform/notes/2026-07-21-what-tripped-me-up-quickstart.md)
- Added Terraform variables and outputs scaffold script (terraform/scripts/2026-07-21-terraform-vars-and-outputs.sh)
- Added Terraform validate and plan first-run notes (terraform/notes/2026-07-21-what-i-learned-from-validate-and-plan.md)

## 2026-07-20

- Added Git common mistakes notes (git/notes/2026-07-20-common-git-mistakes.md)
- Added Git clean history, .gitignore audit, and merge conflict recovery script (git/scripts/2026-07-20-clean-git-history.sh)
- Added Git reflog and interactive rebase cleanup snippet (git/scripts/2026-07-20-git-reflog-rebase.sh)
- Added Git branch, merge, and revert workflow script (git/scripts/2026-07-20-branch-merge-revert-workflow.sh)
- Added Git minimal config for user.name, user.email, and init script (git/scripts/2026-07-20-minimal-git-config-init.sh)

## 2026-07-19

- Added GitHub Actions debug snippet with run-name and conditional steps (github-actions/configs/2026-07-19-debug-run-name-conditions.yaml)
- Added Kubernetes troubleshoot-pods script using kubectl logs and describe (kubernetes/scripts/2026-07-19-troubleshoot-pods.sh)
- Added Kubernetes inspecting pods, services, events docs (kubernetes/docs/2026-07-19-inspecting-pods-services-events.md)
- Added GitHub Actions reading workflow logs & debugging docs (github-actions/docs/2026-07-19-reading-workflow-logs-and-debugging.md)
- Added Kubernetes quickstart — what tripped me up notes (kubernetes/notes/2026-07-19-k8s-quickstart-trials.md)

- Added Terraform version + init first-run notes (terraform/notes/2026-07-19-terraform-version-init.md)
- Added minimal CI workflow config with setup-python caching (github-actions/configs/2026-07-19-minimal-ci-workflow.yaml)
- Added Git quickstart — what tripped me up notes (git/notes/2026-07-19-git-quickstart-trials.md)
- Documented Terraform directory structure, purpose, and WIP modules (terraform/notes/2026-07-19-terraform-directory-structure.md)
- Documented CI/CD workflow linking GitHub Actions and Jenkins directories (docs/concepts/ci-cd-concepts/2026-07-19-ci-cd-workflow-overview.md)
- Added Terraform install + version notes (terraform/notes/2026-07-19-install-terraform-and-run-version.md)
- Added first local file resource Terraform config (terraform/configs/2026-07-19-first-local-file-resource.hcl)
- Added Git undo, stage, commit, and push tutorial notes (git/notes/2026-07-19-git-undo-stage-commit-push.md)

## 2026-07-18

- Added Docker quickstart notes — what tripped me up (docker/notes/2026-07-18-docker-quickstart-tripped-me.md)
- Added tagged multi-stage non-root Python Dockerfile (docker/dockerfiles/2026-07-18-tagged-nonroot.Dockerfile)
- Added container port map script with Python HTTP server (docker/scripts/2026-07-18-run-container-port-map.sh)

## 2026-07-17

- Reworked CI/CD Concepts concept primer with verified sources in front-matter (con-005 rework, Pass 4 fix)
- Added Linux & OS Fundamentals concept primer (docs/concepts/linux-os-fundamentals/0000-primer-linux-os-fundamentals.md)
- Added Networking Basics concept primer (docs/concepts/networking-basics/0000-primer-networking-basics.md)
- Added CI/CD Concepts concept primer (docs/concepts/ci-cd-concepts/0000-primer-ci-cd-concepts.md)

## 2026-07-16

- Added Terraform install + version notes (terraform/notes/2026-07-16-install-terraform-and-run-version.md)
- Added version + init run notes (terraform/notes/2026-07-16-terraform-version-init.md)
- Added minimal local file resource config (terraform/configs/2026-07-16-local-file-resource.hcl)
- Added Docker quickstart notes — what tripped me up (docker/notes/2026-07-16-docker-quickstart-tripped-me.md)
- Added tagged multi-stage non-root Dockerfile with Go build (docker/dockerfiles/2026-07-16-tagged-nonroot.Dockerfile)
- Added container port map script with nginx (docker/scripts/2026-07-16-run-container-port-map.sh)

## 2026-07-14

- Added Terraform version + init first-run notes (terraform/notes/2026-07-14-terraform-init-first-run.md)

## 2026-07-12

- Added tagged multi-stage Go Dockerfile with non-root runtime (docker/dockerfiles/2026-07-12-tagged-nonroot.Dockerfile)
- Added companion Go source and go.mod for Dockerfile build (docker/dockerfiles/main.go, docker/dockerfiles/go.mod)
- Added container port map script with nginx (docker/scripts/2026-07-12-run-container-port-map.sh)
- Added minimal CI workflow config with setup-node caching (github-actions/configs/2026-07-12-minimal-ci-workflow.yaml)

## 2026-07-10

- Added docs on reading GitHub Actions workflow logs and debugging failures (github-actions/docs/2026-07-10-reading-workflow-logs-and-debugging.md)
- Added Kubernetes quickstart — what tripped me up notes (kubernetes/notes/2026-07-10-k8s-quickstart-trials.md)
- Added minimal Kubernetes Deployment + Service manifest (kubernetes/manifests/2026-07-10-minimal-deployment-service.yaml)
- Updated 00_index/quick-links.md with new GHA, Kubernetes entries

## 2026-07-09

- Added Git branch/merge/revert workflow practice script (git/scripts/2026-07-09-branch-merge-revert-workflow.sh)
- Added minimal CI workflow config for GHA pushes and PRs (github-actions/configs/2026-07-09-minimal-ci-workflow.yaml)
- Added GitHub Actions quickstart — what tripped me up notes (github-actions/notes/2026-07-09-gha-quickstart-trials.md)
- Added minimal Alpine tagged multi-stage non-root Dockerfile (docker/dockerfiles/2026-07-09-tagged-nonroot.Dockerfile)
- Added first container port map script (docker/scripts/2026-07-09-first-container-port-map.sh)
- Updated 00_index/quick-links.md with new Git, GHA, and Docker entries

## 2026-07-04

- Added Docker quickstart notes — what tripped me up (docker/notes/2026-07-04-docker-quickstart-trials.md)
- Added tagged non-root multi-stage Dockerfile (docker/dockerfiles/2026-07-04-tagged-nonroot.Dockerfile)
- Added first container port-map script (docker/scripts/2026-07-04-first-container-port-map.sh)
- Updated 00_index/quick-links.md with new Docker entries

## 2026-07-01

- Added Docker quickstart follow-up notes (docker/notes/2026-07-01-following-docker-quickstart.md)
- Added Python self-contained tagged build Dockerfile (docker/dockerfiles/2026-07-01-trying-tagged-build.Dockerfile)
- Added port-mapping container script (docker/scripts/2026-07-01-run-container-port-map.sh)
- Updated 00_index/quick-links.md with new Docker entries

## 2026-06-16

- Added Kubernetes primer (kubernetes/notes/0000-primer-kubernetes.md)
- Added Kubernetes cluster install script (kubernetes/scripts/install-local-cluster.sh)
- Added kubectl CLI exploration notes (kubernetes/notes/2026-06-16-explore-kubectl.md)

- Added Docker primer (docker/notes/0000-primer-docker.md)
- Added Docker install script (docker/scripts/2026-06-16-install-docker.sh)
- Added Docker CLI exploration notes (docker/notes/2026-06-16-explore-docker-cli.md)
- Added Git primer (git/notes/0000-primer-git.md)
- Added Git configure & first commit script (git/scripts/configure-and-commit-first.sh)
- Added Git CLI exploration notes (git/notes/2026-06-16-explore-git-cli.md)
- Added GitHub Actions primer (github-actions/notes/0000-primer-github-actions.md)
- Added CI workflow config (github-actions/configs/ci-workflow.yaml)
- Added GitHub Actions UI exploration notes (github-actions/notes/2026-06-16-explore-gha-ui.md)
- Updated README.md to document docker/ and 00_index/ folders

## 2026-06-21

- Added Docker quickstart notes (docker/notes/2026-06-21-docker-quickstart-trials.md)
- Added tagged build non-root Dockerfile (docker/dockerfiles/minimal-tagged-nonroot.Dockerfile)
- Added first container port map script (docker/scripts/2026-06-21-first-container-port-map.sh)

## 2026-06-18

- Added minimal multi-stage Dockerfile (docker/dockerfiles/minimal-multi-stage.Dockerfile)
- Added multi-service Docker Compose config (docker/configs/multi-service-compose.yaml)
- Updated README.md and 00_index/quick-links.md with Docker build and compose entries

## 2026-06-24

- Added Git undo, stage, commit, and push tutorial notes (git/notes/2026-06-24-git-undo-stage-commit-push.md)
- Updated 00_index/quick-links.md with new Git entry
- Updated README.md Git coverage count

## 2026-06-23

- Added Docker quickstart notes — second pass (docker/notes/2026-06-23-docker-quickstart.md)
- Added tagged multi-stage non-root Dockerfile (docker/dockerfiles/2026-06-23-tagged-nonroot.Dockerfile)
- Added port-mapping container script (docker/scripts/2026-06-23-run-container-port-map.sh)
- Updated 00_index/quick-links.md with new Docker entries

## 2026-06-22

- Added Docker quickstart notes (docker/notes/2026-06-22-docker-quickstart.md)
- Added Git quickstart notes (git/notes/2026-06-22-git-quickstart.md)
- Updated 00_index/quick-links.md with General section and new Docker/Git entries

## 2026-06-24

- Added Docker quickstart notes — third pass (docker/notes/2026-06-24-docker-quickstart-trials.md)
- Added Go hello-world non-root Dockerfile (docker/dockerfiles/2026-06-24-hello-go-nonroot.Dockerfile)
- Added port-mapping container script (docker/scripts/2026-06-24-run-container-port-map.sh)
- Updated 00_index/quick-links.md with new Docker entries

## 2026-06-25

- Added Docker getting-started walkthrough notes (docker/notes/2026-06-25-docker-quickstart-walkthrough.md)
- Added minimal tagged non-root Go Dockerfile (docker/dockerfiles/2026-06-25-minimal-tagged-nonroot.Dockerfile)
- Added first container port map script with Python HTTP server (docker/scripts/2026-06-25-first-container-port-map.sh)
- Updated 00_index/quick-links.md with new Docker entries

## 2026-06-26

- Added Docker quickstart trip-ups notes (docker/notes/2026-06-26-docker-quickstart-trip-ups.md)
- Added trying tagged build Dockerfile — Python multi-stage with non-root (docker/dockerfiles/2026-06-26-trying-tagged-build.Dockerfile)
- Added first container port map script — nginx (docker/scripts/2026-06-26-first-container-port-map.sh)
- Added Docker quickstart notes — fourth pass (docker/notes/2026-06-26-docker-quickstart-trials.md)
- Added tagged non-root Dockerfile with Go build (docker/dockerfiles/2026-06-26-tagged-nonroot.Dockerfile)
- Added nginx port-mapping container script (docker/scripts/2026-06-26-port-map-container.sh)
- Updated 00_index/quick-links.md with new Docker entries

## 2026-06-28

- Added tagged multi-stage Go build with non-root Dockerfile (docker/dockerfiles/2026-06-28-trying-tagged-go-server.Dockerfile)
- Added port-mapping container script for Go server (docker/scripts/2026-06-28-run-container-port-map.sh)
- Added Docker quickstart notes — what tripped me up (docker/notes/2026-06-28-docker-quickstart-trials.md)
- Updated 00_index/quick-links.md with new Docker entries

## 2026-06-17

- Reworked Terraform install script to init only without running apply (tf-002 rework: 11-line L1 script)
- Added Terraform primer (terraform/notes/0000-primer-terraform.md)
- Added Terraform install script (terraform/scripts/2026-06-17-install-terraform.sh)
- Added local provider HCL config (terraform/configs/local-provider.hcl)
- Updated README.md and 00_index/quick-links.md with Terraform entries
