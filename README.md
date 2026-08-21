# javahar-devops-portfolio
> A working DevOps engineer's reference for Docker, Git, GitHub Actions, Kubernetes, Terraform, OpenTofu, Pulumi, Ansible, Jenkins, Trivy, and the concepts that tie them together.

![Last commit](https://img.shields.io/github/last-commit/javahar79/javahar-devops-portfolio)
![Top language](https://img.shields.io/github/languages/top/javahar79/javahar-devops-portfolio)
![Languages](https://img.shields.io/github/languages/count/javahar79/javahar-devops-portfolio)
![Repo size](https://img.shields.io/github/repo-size/javahar79/javahar-devops-portfolio)

> **New here? Start at [the learning path](00_index/learning-path.md).** It walks you from first-contact to confident in a sensible order — read that before the tables below.

## Who this is for

A working DevOps engineer's quick-reference: first-contact notes, runnable snippets, and configs for Docker, Git, GitHub Actions, Kubernetes, Terraform, OpenTofu, Pulumi, Ansible, Jenkins, and Trivy. Use it as a shelf you grab from, not a tutorial site. It deliberately does not try to replace each tool's official docs.

## What's in here

A DevOps reference across tool directories and cross-cutting concept primers. Each tool has a primer, dated CLI walkthrough notes, runnable scripts, Dockerfiles, configs, manifests, and notebooks accumulated through hands-on practice. The concept folders cover CI/CD, cloud computing, container fundamentals, Git, infrastructure as code, Linux, networking, and scripting — including the deployment and branch-strategy patterns that connect them. Recent additions include a Kubernetes sample-app scaffold (Deployment, Service, Ingress, ConfigMap, Secret, Namespace), a Kubernetes production deployment with rolling updates and PDB, a manual deploy workflow with environment inputs and dependent jobs, an OpenTofu S3 backend with state locking, and Git worktrees and cherry-pick release-management patterns.

## Quick links

The five most recently added files:

- [Sample-App K8s Scaffold: README](k8s/templates/project-scaffold-sample-app/README.md) — A ready-to-apply Kubernetes sample app: Deployment, Service, Ingress, ConfigMap, Secret, and Namespace
- [Sample-App ConfigMap](k8s/templates/project-scaffold-sample-app/configmap.yaml) — Non-sensitive configuration wired into the sample app
- [Sample-App Deployment + Service](k8s/templates/project-scaffold-sample-app/deployment.yaml) — Deployment and Service manifest for the sample app
- [Sample-App Ingress](k8s/templates/project-scaffold-sample-app/ingress.yaml) — Ingress routing for the sample app
- [Sample-App Namespace](k8s/templates/project-scaffold-sample-app/namespace.yaml) — Dedicated namespace that scopes the sample app

## Layout

| Directory | Contents |
|-----------|----------|
| `docker/` | Docker primer, CLI notes, install/port-map scripts, 22 Dockerfiles, compose and daemon configs, integration docs (incl. Docker–Terraform patterns), notebook, two project scaffolds (Compose and Compose+K8s) |
| `git/` | Git primer, CLI notes, undo/branch/merge/reflog/bisect scripts, a fork-sync helper, worktrees & cherry-pick docs, a branching-convention scaffold, two configs (`.gitattributes` and monorepo sparse-checkout), bisect notebook |
| `github-actions/` | Actions primer, UI walkthrough, CI workflow configs, workflow-log debugging docs, validation & audit scripts, snippets |
| `kubernetes/` | K8s primer, kubectl notes, minikube first-cluster notes, local cluster install script, manifests, pod/service troubleshooting scripts and docs, snippets, notebook |
| `k8s/` | A Kubernetes sample-app project scaffold: Deployment, Service, Ingress, ConfigMap, Secret, and Namespace manifests |
| `terraform/` | Terraform primer, install script, HCL configs, init/version/plan-apply notes, remote-state and workspace docs |
| `tf/` | Terraform provisioning Dockerfile, CI/CD integration docs, production workspace manifest, state/modules notebooks, multi-service deployment template |
| `of/` | OpenTofu primer, install script, first-resource config, S3 backend/locking config, provisioning snippet, quickstart notes |
| `pulumi/` | Pulumi primer, first Python program snippet, first stack config |
| `ansible/` | Ansible primer, install and first-command notes, ping playbook config |
| `jenkins/` | Jenkins primer, install and web-UI notes, first pipeline snippet |
| `trivy/` | Trivy primer, first vulnerability scan notes and snippet |
| `docs/concepts/` | Cross-cutting concept primers plus runnable scripts and snippets (CI/CD, Cloud Computing, Container Fundamentals, Git, Infrastructure as Code, Linux, Networking, Scripting & Automation) |
| `00_index/` | Topic index, quick links, glossary, learning path |

## Coverage

<details>
<summary>Coverage table</summary>

| Tool | Notes | Scripts | Configs | Dockerfiles | Manifests | Docs | Snippets | Notebooks | Templates | Last verified |
|------|-------|---------|---------|-------------|-----------|------|----------|-----------|-----------|---------------|
| Docker | 21 | 21 | 2 | 22 | 2 | 3 | 1 | 1 | 17 | 2026-08-14 |
| Git | 9 | 8 | 2 | — | — | 2 | 1 | 1 | 4 | 2026-08-17 |
| GitHub Actions | 5 | 2 | 8 | — | — | 3 | 1 | — | — | 2026-08-12 |
| Kubernetes | 6 | 6 | — | — | 5 | 3 | 2 | 1 | — | 2026-08-10 |
| k8s | — | — | — | — | — | — | — | — | 7 | 2026-08-19 |
| Terraform | 10 | 4 | 6 | — | — | 2 | — | — | — | 2026-07-27 |
| TF | — | — | — | 1 | 1 | 1 | — | 2 | 9 | 2026-08-10 |
| Ansible | 2 | — | 1 | — | — | — | — | — | — | 2026-08-05 |
| OpenTofu | 3 | 1 | 2 | — | — | — | 1 | — | — | 2026-08-14 |
| Pulumi | 1 | — | 1 | — | — | — | 1 | — | — | 2026-08-10 |
| Jenkins | 2 | — | — | — | — | — | 1 | — | — | 2026-08-06 |
| Trivy | 2 | — | — | — | — | — | 1 | — | — | 2026-08-10 |

</details>

## Status

Recent work added a Kubernetes sample-app scaffold (Deployment, Service, Ingress, ConfigMap, Secret, Namespace), a Kubernetes production deployment with rolling updates, probes, and PDB, a manual deploy workflow with environment inputs and dependent jobs, and an OpenTofu S3 backend with state locking. A complex reusable GitHub Actions workflow with matrix strategies and approval gates is next on the list.

---
_Last updated: 2026-08-20_
