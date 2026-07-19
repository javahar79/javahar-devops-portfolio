# javahar-devops-portfolio

> A working DevOps engineer's quick-reference for Docker, Git, GitHub Actions, Kubernetes, and Terraform.

![Last commit](https://img.shields.io/github/last-commit/javahar79/javahar-devops-portfolio)
![Top language](https://img.shields.io/github/languages/top/javahar79/javahar-devops-portfolio)
![Languages](https://img.shields.io/github/languages/count/javahar79/javahar-devops-portfolio)
![Repo size](https://img.shields.io/github/repo-size/javahar79/javahar-devops-portfolio)

> **New here? Start at [the learning path](00_index/learning-path.md).** It walks you from first-contact to confident in a sensible order — read that before this table.

## Who this is for

A working DevOps engineer's quick-reference: first-contact notes, runnable snippets, and configs for Docker, Git, GitHub Actions, Kubernetes, and Terraform. Use it as a shelf you grab from, not a tutorial site. It deliberately does not try to replace each tool's official docs.

## What's in here

A DevOps learning portfolio across five tool families — Docker, Git, GitHub Actions, Kubernetes, and Terraform — plus cross-cutting concept primers on CI/CD, Linux & OS fundamentals, and networking basics. Each tool has a primer, CLI walkthrough notes, Dockerfiles, scripts, and config files for hands-on practice.

---

## Quick links

- [Tagged Non-Root Dockerfile (2026-07-18)](docker/dockerfiles/2026-07-18-tagged-nonroot.Dockerfile) — Multi-stage Dockerfile with pinned tag and non-root runtime user
- [Docker Quickstart — What Tripped Me Up (2026-07-18)](docker/notes/2026-07-18-docker-quickstart-tripped-me.md) — Docker init, volume mounts, and port mapping gotchas
- [Run Container Port Map Script (2026-07-18)](docker/scripts/2026-07-18-run-container-port-map.sh) — Build and run a Go container with port mapping
- [CI/CD Concepts Primer](docs/concepts/ci-cd-concepts/0000-primer-ci-cd-concepts.md) — CI/CD pipeline fundamentals and terminology
- [Linux & OS Fundamentals Primer](docs/concepts/linux-os-fundamentals/0000-primer-linux-os-fundamentals.md) — Essential Linux concepts for DevOps

---

## Layout

| Directory | Contents |
|-----------|----------|
| `docker/` | Docker primer, CLI notes, quickstart notes, install/port-map scripts, Dockerfiles, compose config |
| `git/` | Git primer, CLI exploration, quickstart notes, undo/stage/commit workflow, branch/merge/revert script |
| `github-actions/` | Actions primer, UI walkthrough, CI workflow configs, quickstart trials, workflow debugging docs |
| `kubernetes/` | K8s primer, kubectl walkthrough, local cluster install script, K8s manifests, pod/service/event docs |
| `terraform/` | Terraform primer, install script, local provider config, local file resource configs, init & version notes |
| `00_index/` | Topic index, quick links, glossary, learning path |
| `docs/` | Cross-cutting concept primers (CI/CD, Linux, Networking) |

---

## Coverage

| Tool | Notes | Scripts | Configs | Dockerfiles | Manifests | Docs | Last verified |
|------|-------|---------|---------|-------------|-----------|------|---------------|
| Docker | 20 | 18 | 1 | 20 | — | — | 2026-07-18 |
| Git | 4 | 2 | — | — | — | — | 2026-07-09 |
| GitHub Actions | 3 | — | 3 | — | — | 1 | 2026-07-10 |
| Kubernetes | 3 | 1 | — | — | 1 | 1 | 2026-07-12 |
| Terraform | 6 | 1 | 3 | — | — | — | 2026-07-19 |

---

## Status

Actively building out first-contact notes and runnable configs. Current focus is Terraform L1 (install, config, directory structure) and Docker quickstart notes. Recently added Dockerfiles (July 18), Terraform directory structure notes, CI/CD workflow overview, and concept primers for CI/CD, Linux, and Networking.

---

_Last updated: 2026-07-19_
