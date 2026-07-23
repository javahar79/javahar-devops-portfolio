# javahar-devops-portfolio
> A working DevOps engineer's quick-reference for Docker, Git, GitHub Actions, Kubernetes, and Terraform.

![Last commit](https://img.shields.io/github/last-commit/javahar79/javahar-devops-portfolio)
![Top language](https://img.shields.io/github/languages/top/javahar79/javahar-devops-portfolio)
![Languages](https://img.shields.io/github/languages/count/javahar79/javahar-devops-portfolio)
![Repo size](https://img.shields.io/github/repo-size/javahar79/javahar-devops-portfolio)
![License](https://img.shields.io/github/license/javahar79/javahar-devops-portfolio)

> **New here? Start at [the learning path](00_index/learning-path.md).** It walks you from first-contact to confident in a sensible order — read that before this table.

## Who this is for

A working DevOps engineer's quick-reference: first-contact notes, runnable snippets, and configs for Docker, Git, GitHub Actions, Kubernetes, and Terraform. Use it as a shelf you grab from, not a tutorial site. It deliberately does not try to replace each tool's official docs.

## What's in here

A DevOps learning portfolio across five tool families — Docker (62 files), Git (13), GitHub Actions (12), Kubernetes (12), and Terraform (19) — plus cross-cutting concept primers in CI/CD, Cloud Computing, Container Fundamentals, Git & version control, Infrastructure as Code, Linux OS fundamentals, Networking, and Scripting & Automation. Each tool has a primer, dated CLI walkthrough notes, Dockerfiles, scripts, and config files accumulated through hands-on practice.

---

## Quick links

- [Dockerfile Antipatterns](docker/docs/dockerfile-antipatterns.md) — Common Dockerfile mistakes and how to avoid them
- [Multi-Stage Python Webapp Dockerfile](docker/dockerfiles/multi-stage-python-webapp.Dockerfile) — Python multi-stage build with pip dependencies
- [Minimal CI Pipeline Script](docs/concepts/ci-cd-concepts/scripts/2026-07-23-minimal-ci-pipeline.sh) — Hands-on sandbox for practicing CI pipeline mechanics
- [Cloud Computing Fundamentals Primer](docs/concepts/cloud-computing-fundamentals/0000-primer-cloud-computing-fundamentals.md) — IaaS, PaaS, SaaS, regions, and service models explained
- [Container Fundamentals Primer](docs/concepts/container-fundamentals/0000-primer-container-fundamentals.md) — Images, containers, registries, and volumes explained

## Layout

| Directory | Contents |
|-----------|----------|
| `docker/` | Docker primer, CLI walkthrough notes, install/port-map scripts, Dockerfiles, compose config, antipatterns doc |
| `git/` | Git primer, CLI exploration notes, undo/stage/commit/push notes, branch/merge/revert/reflog scripts |
| `github-actions/` | Actions primer, UI walkthrough, CI workflow configs, workflow debugging docs, validation script |
| `kubernetes/` | K8s primer, kubectl notes, local cluster install script, manifests, pod/service debugging scripts and docs |
| `terraform/` | Terraform primer, install script, provider configs, local file resource configs, init & version notes, remote backend docs |
| `docs/` | Cross-cutting concept primers (CI/CD, Cloud Computing, Container Fundamentals, Git & version control, Infrastructure as Code, Linux fundamentals, Networking, Scripting & Automation) |
| `00_index/` | Topic index, quick links, glossary, learning path |
| `CHANGELOG.md` | Release notes and change log |

---

## Coverage

| Tool | Notes | Scripts | Configs | Dockerfiles | Manifests | Docs | Snippets | Last verified |
|------|-------|---------|---------|-------------|-----------|------|----------|---------------|
| Docker | 20 | 19 | 1 | 21 | — | 1 | — | 2026-07-18 |
| Git | 7 | 6 | — | — | — | — | — | 2026-07-20 |
| GitHub Actions | 4 | 1 | 5 | — | — | 2 | — | 2026-07-21 |
| Kubernetes | 4 | 3 | — | — | 2 | 2 | 1 | 2026-07-21 |
| Terraform | 10 | 3 | 5 | — | — | 1 | — | 2026-07-22 |

---

## Status

Actively building out first-contact notes and runnable configs across all five tools. Recent additions include a Dockerfile antipatterns doc, a multi-stage Python webapp Dockerfile, a CI pipeline practice script, and a Cloud Computing Fundamentals primer. Docker L2 content and tagged non-root Dockerfiles remain the deepest category.

---

_Last updated: 2026-07-24_
