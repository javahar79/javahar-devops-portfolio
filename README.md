# javahar-devops-portfolio
> A working DevOps engineer's shelf reference for Docker, Git, GitHub Actions, Kubernetes, Terraform, OpenTofu, Pulumi, Ansible, Jenkins, Trivy, and the concepts that tie them together.

![Last commit](https://img.shields.io/github/last-commit/javahar79/javahar-devops-portfolio)
![Top language](https://img.shields.io/github/languages/top/javahar79/javahar-devops-portfolio)
![Languages](https://img.shields.io/github/languages/count/javahar79/javahar-devops-portfolio)
![Repo size](https://img.shields.io/github/repo-size/javahar79/javahar-devops-portfolio)

> **New here? Start at [the learning path](00_index/learning-path.md).** It walks you from first-contact to confident in a sensible order — read that before the tables below.

## Who this is for

A working DevOps engineer's quick-reference: first-contact notes, runnable snippets, and configs for Docker, Git, GitHub Actions, Kubernetes, Terraform, OpenTofu, Pulumi, Ansible, Jenkins, and Trivy. Use it as a shelf you grab from, not a tutorial site. It deliberately does not try to replace each tool's official docs.

## What's in here

A DevOps learning portfolio across eleven tool directories and cross-cutting concept primers. Each tool has a primer, dated CLI walkthrough notes, runnable scripts, Dockerfiles, configs, manifests, and notebooks accumulated through hands-on practice. The `tf/` folder pairs Terraform provisioning with a Docker Compose multi-service scaffold. Recent additions include a GitHub Actions first-build workflow, Kubernetes deploy/inspect/delete snippet, container networking patterns, and an automated provisioning pipeline doc.

## Quick links

The five most recently added files:

- [First Build on Push](github-actions/configs/2026-08-12-first-build-on-push.yaml) — Minimal CI workflow that builds and pushes on every push
- [First Workflow and Actions Tab](github-actions/notes/2026-08-12-first-workflow-and-actions-tab.md) — First-day notes for the GitHub Actions UI and workflow tab
- [First kubectl Deploy, Inspect, Delete](kubernetes/snippets/2026-08-12-first-kubectl-deploy-inspect-delete.sh) — kubectl create, get, describe, logs, and delete workflow
- [Container Networking Patterns](docs/concepts/container-fundamentals/scripts/container-networking-patterns.sh) — Hands-on exercises for bridge, host, and overlay networks
- [Automated Provisioning Pipeline](docs/concepts/infrastructure-as-code/automated-provisioning-pipeline.md) — Plan-on-PR / apply-on-merge pipeline with remote state, approval gates, and locking

## Layout

| Directory | Contents |
|-----------|----------|
| `docker/` | Docker primer, CLI notes, install/port-map scripts, Dockerfiles, compose config, docs, notebook, templates |
| `git/` | Git primer, CLI notes, undo/stage/commit/push notes, branch/merge/revert/reflog/bisect scripts, .gitattributes config, merge-vs-rebase docs, bisect notebook, first-branch snippet |
| `github-actions/` | Actions primer, UI walkthrough, CI workflow configs, workflow debugging docs, validation & audit scripts, snippets |
| `kubernetes/` | K8s primer, kubectl notes, minikube first-cluster notes, local cluster install script, manifests, pod/service debugging scripts and docs, snippets, notebook |
| `terraform/` | Terraform primer, install script, provider configs, local file resource configs, init & version notes, remote backend docs |
| `tf/` | Terraform provisioning Dockerfile, CI/CD integration docs, production workspace manifest, state/modules notebooks, multi-service deployment template scaffold |
| `ansible/` | Ansible primer, install and first-command notes, playbook configs |
| `of/` | OpenTofu primer, install script, first-resource config, first-command notes |
| `pulumi/` | Pulumi primer, first Python program snippet, first stack config |
| `jenkins/` | Jenkins primer, install and first-UI notes, first pipeline snippet |
| `trivy/` | Trivy primer, first vulnerability scan notes and snippet |
| `docs/concepts/` | Cross-cutting concept primers and runnable snippets (CI/CD, Cloud Computing, Container Fundamentals, Git & version control, Infrastructure as Code, Linux fundamentals, Networking, Scripting & Automation) |
| `00_index/` | Topic index, quick links, glossary, learning path |

## Coverage

| Tool | Notes | Scripts | Configs | Dockerfiles | Manifests | Docs | Snippets | Notebooks | Templates | Last verified |
|------|-------|---------|---------|-------------|-----------|------|----------|-----------|-----------|---------------|
| Docker | 20 | 21 | 1 | 22 | 2 | 2 | — | 1 | 5 | 2026-08-06 |
| Git | 8 | 7 | 1 | — | — | 1 | 1 | 1 | — | 2026-08-08 |
| GitHub Actions | 4 | 2 | 7 | — | — | 3 | 1 | — | — | 2026-08-12 |
| Kubernetes | 6 | 5 | — | — | 4 | 3 | 2 | 1 | — | 2026-08-10 |
| Terraform | 10 | 4 | 6 | — | — | 2 | — | — | — | 2026-07-27 |
| TF | — | — | — | 1 | 1 | 1 | — | 2 | 9 | 2026-08-10 |
| Ansible | 2 | — | 1 | — | — | — | — | — | — | 2026-08-05 |
| OpenTofu | 2 | 1 | 1 | — | — | — | — | — | — | 2026-08-11 |
| Pulumi | 1 | — | 1 | — | — | — | 1 | — | — | 2026-08-10 |
| Jenkins | 2 | — | — | — | — | — | 1 | — | — | 2026-08-06 |
| Trivy | 2 | — | — | — | — | — | 1 | — | — | 2026-08-10 |

## Status

Actively building out first-contact notes and runnable configs across the tool families. Recent additions include a GitHub Actions first-build workflow, Kubernetes deploy/inspect/delete snippet, container networking patterns, and an automated provisioning pipeline doc. Docker tagged non-root and multi-stage Dockerfiles and Terraform notes/configs remain the deepest categories.

---

_Last updated: 2026-08-13_
