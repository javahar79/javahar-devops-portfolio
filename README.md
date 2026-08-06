# javahar-devops-portfolio
> A working DevOps engineer's shelf reference for Docker, Git, GitHub Actions, Kubernetes, Terraform, OpenTofu, and Jenkins — notes, snippets, runnable configs, and first-contact walkthroughs.

![Last commit](https://img.shields.io/github/last-commit/javahar79/javahar-devops-portfolio)
![Top language](https://img.shields.io/github/languages/top/javahar79/javahar-devops-portfolio)
![Languages](https://img.shields.io/github/languages/count/javahar79/javahar-devops-portfolio)
![Repo size](https://img.shields.io/github/repo-size/javahar79/javahar-devops-portfolio)

> **New here? Start at [the learning path](00_index/learning-path.md).** It walks you from first-contact to confident in a sensible order — read that before the tables below.

## Who this is for

A working DevOps engineer's quick-reference: first-contact notes, runnable snippets, and configs for Docker, Git, GitHub Actions, Kubernetes, Terraform, OpenTofu, and Jenkins. Use it as a shelf you grab from, not a tutorial site. It deliberately does not try to replace each tool's official docs.

## What's in here

A DevOps learning portfolio across nine tool families — Docker (74 files), Git (17), GitHub Actions (16), Kubernetes (17), Terraform (22), Ansible (3), OpenTofu (3), Jenkins (3), and TF notebooks (2) — plus cross-cutting concept primers and runnable snippets (24 files) in CI/CD, Cloud Computing, Container Fundamentals, Git & version control, Infrastructure as Code, Linux OS fundamentals, Networking, and Scripting & Automation. Each tool has a primer, dated CLI walkthrough notes, runnable scripts, Dockerfiles, configs, manifests, and notebooks accumulated through hands-on practice.

## Quick links

- [Kubernetes Deployment Resource Limits](docker/manifests/kubernetes-deployment-resource-limits.yaml) — Deployment manifest with resource limits and security controls
- [Project Scaffold Docker Compose](docker/templates/project-scaffold-docker-compose/docker-compose.yml) — Multi-service production scaffold template
- [Project Scaffold Dockerfile](docker/templates/project-scaffold-docker-compose/dockerfiles/Dockerfile) — Dockerfile for the project scaffold template
- [Project Scaffold README](docker/templates/project-scaffold-docker-compose/README.md) — Setup instructions for the project scaffold
- [Install OpenTofu](of/scripts/2026-08-06-install-opentofu.sh) — Install OpenTofu and verify the installation

## Layout

| Directory | Contents |
|-----------|----------|
| `docker/` | Docker primer, CLI notes, install/port-map scripts, Dockerfiles, compose config, docs, notebook, project scaffold templates |
| `git/` | Git primer, CLI notes, undo/stage/commit/push notes, branch/merge/revert/reflog/bisect scripts, .gitattributes config, merge-vs-rebase docs, bisect notebook |
| `github-actions/` | Actions primer, UI walkthrough, CI workflow configs, workflow debugging docs, validation & audit scripts, snippets |
| `kubernetes/` | K8s primer, kubectl notes, local cluster install script, manifests, pod/service debugging scripts and docs, snippets, notebook |
| `terraform/` | Terraform primer, install script, provider configs, local file resource configs, init & version notes, remote backend docs |
| `tf/` | Terraform state and modules interactive notebook |
| `ansible/` | Ansible primer, install and first-command notes, playbook configs |
| `of/` | OpenTofu primer, first-resource config, install script |
| `jenkins/` | Jenkins primer, install and first-UI notes, first pipeline snippet |
| `docs/concepts/` | Cross-cutting concept primers and runnable snippets (CI/CD, Cloud Computing, Container Fundamentals, Git & version control, Infrastructure as Code, Linux fundamentals, Networking, Scripting & Automation) |
| `00_index/` | Topic index, quick links, glossary, learning path |

## Coverage

| Tool | Notes | Scripts | Configs | Dockerfiles | Manifests | Docs | Snippets | Notebooks | Last verified |
|------|-------|---------|---------|-------------|-----------|------|----------|-----------|---------------|
| Docker | 20 | 21 | 1 | 22 | 2 | 2 | — | 1 | 2026-08-06 |
| Git | 7 | 7 | 1 | — | — | 1 | — | 1 | 2026-07-30 |
| GitHub Actions | 4 | 2 | 6 | — | — | 3 | 1 | — | 2026-08-01 |
| Kubernetes | 4 | 4 | — | — | 4 | 3 | 1 | 1 | 2026-07-31 |
| Terraform | 10 | 4 | 6 | — | — | 2 | — | — | 2026-07-31 |
| TF | — | — | — | — | — | — | — | 1 | 2026-08-04 |
| Ansible | 2 | — | 1 | — | — | — | — | — | 2026-08-05 |
| OpenTofu | 1 | 1 | 1 | — | — | — | — | — | 2026-08-06 |
| Jenkins | 2 | — | — | — | — | — | 1 | — | 2026-08-06 |

## Status

Actively building out first-contact notes and runnable configs across all nine tools. Recent additions include a Kubernetes deployment manifest with resource limits and security controls, a multi-service Docker Compose project scaffold, an OpenTofu install script, a Terraform state and modules interactive notebook, and Jenkins primer and first-pipeline snippet. Docker tagged non-root and multi-stage Dockerfiles and Terraform notes/configs remain the deepest categories.

---
_Last updated: 2026-08-06_
