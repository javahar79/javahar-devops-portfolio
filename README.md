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

A DevOps learning portfolio across eleven tool directories and cross-cutting concept primers. Each tool has a primer, dated CLI walkthrough notes, runnable scripts, Dockerfiles, configs, manifests, and notebooks accumulated through hands-on practice. The concept folders cover CI/CD, cloud computing, container fundamentals, Git, infrastructure as code, Linux, networking, and scripting — including the deployment patterns that connect them. Recent additions include a Docker + Kubernetes project scaffold, a Docker install-from-apt walkthrough, and OpenTofu quickstart notes.

## Quick links

The five most recently added files:

- [Docker + Kubernetes Project Scaffold](docker/templates/project-scaffold-docker-k8s/README.md) — Compose for local dev plus K8s manifests (Deployment, Service, Ingress, StatefulSet + PVC) for cluster deploy
- [Scaffold Compose](docker/templates/project-scaffold-docker-k8s/docker-compose.yml) — The scaffold's multi-service local stack with health checks
- [Scaffold Dockerfile](docker/templates/project-scaffold-docker-k8s/dockerfiles/Dockerfile) — The scaffold app image definition
- [Scaffold Cache Deployment](docker/templates/project-scaffold-docker-k8s/kubernetes/cache-deployment.yaml) — Cache deployment manifest for the cluster stack
- [Scaffold Cache Service](docker/templates/project-scaffold-docker-k8s/kubernetes/cache-service.yaml) — Service manifest exposing the cache pods

## Layout

| Directory | Contents |
|-----------|----------|
| `docker/` | Docker primer, CLI notes, install/port-map scripts, Dockerfiles, compose configs, docs, notebook, two project scaffolds (Compose and Compose+K8s) |
| `git/` | Git primer, CLI notes, undo/stage/commit/push notes, branch/merge/revert/reflog/bisect scripts, .gitattributes config, merge-vs-rebase docs, bisect notebook, first-branch snippet |
| `github-actions/` | Actions primer, UI walkthrough, CI workflow configs, workflow debugging docs, validation & audit scripts, snippets |
| `kubernetes/` | K8s primer, kubectl notes, minikube first-cluster notes, local cluster install script, manifests, pod/service debugging scripts and docs, snippets, notebook |
| `terraform/` | Terraform primer, install script, provider configs, local file resource configs, init & version notes, remote backend docs |
| `tf/` | Terraform provisioning Dockerfile, CI/CD integration docs, production workspace manifest, state/modules notebooks, multi-service deployment template scaffold |
| `docs/concepts/` | Cross-cutting concept primers plus runnable snippets and scripts (CI/CD, Cloud Computing, Container Fundamentals, Git, Infrastructure as Code, Linux, Networking, Scripting & Automation) |
| `ansible/` | Ansible primer, install and first-command notes, playbook configs |
| `of/` | OpenTofu primer, install script, first-resource config, first-command and quickstart notes |
| `pulumi/` | Pulumi primer, first Python program snippet, first stack config |
| `jenkins/` | Jenkins primer, install and first-UI notes, first pipeline snippet |
| `trivy/` | Trivy primer, first vulnerability scan notes and snippet |
| `00_index/` | Topic index, quick links, glossary, learning path |

## Coverage

| Tool | Notes | Scripts | Configs | Dockerfiles | Manifests | Docs | Snippets | Notebooks | Templates | Last verified |
|------|-------|---------|---------|-------------|-----------|------|----------|-----------|-----------|---------------|
| Docker | 21 | 21 | 2 | 22 | 2 | 2 | 1 | 1 | 17 | 2026-08-14 |
| Git | 8 | 7 | 1 | — | — | 1 | 1 | 1 | — | 2026-08-08 |
| GitHub Actions | 5 | 2 | 7 | — | — | 3 | 1 | — | — | 2026-08-12 |
| Kubernetes | 6 | 5 | — | — | 4 | 3 | 2 | 1 | — | 2026-08-10 |
| Terraform | 10 | 4 | 6 | — | — | 2 | — | — | — | 2026-07-27 |
| TF | — | — | — | 1 | 1 | 1 | — | 2 | 9 | 2026-08-10 |
| Ansible | 2 | — | 1 | — | — | — | — | — | — | 2026-08-05 |
| OpenTofu | 3 | 1 | 1 | — | — | — | — | — | — | 2026-08-14 |
| Pulumi | 1 | — | 1 | — | — | — | 1 | — | — | 2026-08-10 |
| Jenkins | 2 | — | — | — | — | — | 1 | — | — | 2026-08-06 |
| Trivy | 2 | — | — | — | — | — | 1 | — | — | 2026-08-10 |

## Status

Just landed the Docker + Kubernetes project scaffold, the Docker install-from-apt walkthrough, and OpenTofu quickstart notes. Docker–Terraform integration patterns and a Kubernetes StatefulSet-with-PVC walkthrough are next on the list.

---
_Last updated: 2026-08-14_
