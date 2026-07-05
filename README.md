# javahar-devops-portfolio
> A working DevOps engineer's quick-reference for Docker, Git, GitHub Actions, Kubernetes, and Terraform.

![Last commit](https://img.shields.io/github/last-commit/javahar79/javahar-devops-portfolio)
![License](https://img.shields.io/github/license/javahar79/javahar-devops-portfolio)
![Top language](https://img.shields.io/github/languages/top/javahar79/javahar-devops-portfolio)
![Repo size](https://img.shields.io/github/repo-size/javahar79/javahar-devops-portfolio)

> **New here? Start at [the learning path](00_index/learning-path.md).** It walks you from first-contact to confident in a sensible order — read that before this table.

## Who this is for

A working DevOps engineer's quick-reference: first-contact notes, runnable snippets, and configs for Docker, Git, GitHub Actions, Kubernetes, and Terraform. Use it as a shelf you grab from, not a tutorial site. It deliberately does not try to replace each tool's official docs.

## What's in here

DevOps learning portfolio covering five tool families — Docker, Git, GitHub Actions, Kubernetes, and Terraform. Each tool has a primer, CLI walkthrough notes, and where applicable a ready-to-run script, config file, or Dockerfile.

---

## Quick links

- [Following the official Docker quickstart](docker/notes/2026-07-01-following-docker-quickstart.md) — What tripped me up on the official getting-started guide
- [Tagged Build Dockerfile (2026-07-01)](docker/dockerfiles/2026-07-01-trying-tagged-build.Dockerfile) — Self-contained Python multi-stage build with non-root user
- [Port Map Script (2026-07-01)](docker/scripts/2026-07-01-run-container-port-map.sh) — Build and run Python server with port mapping
- [Go Server Dockerfile (2026-06-28)](docker/dockerfiles/2026-06-28-trying-tagged-go-server.Dockerfile) — Multi-stage Go build with non-root server binary
- [Docker Quickstart Trials (2026-06-28)](docker/notes/2026-06-28-docker-quickstart-trials.md) — Go server quickstart trials with port mapping

## Layout

| Directory | Contents |
|-----------|----------|
| `docker/` | Docker primer, CLI notes, quickstart notes, install scripts, Dockerfiles, compose config |
| `git/` | Git primer, CLI exploration, quickstart notes, undo/stage/commit workflow, first-commit script |
| `github-actions/` | Actions primer, UI walkthrough, CI workflow |
| `kubernetes/` | K8s primer, kubectl walkthrough, local cluster install script |
| `terraform/` | Terraform primer, install script, local provider config |
| `00_index/` | Topic index, quick links, glossary, learning path |

---

## Coverage

| Tool | Notes | Scripts | Configs | Dockerfiles |
|------|-------|---------|---------|-------------|
| Docker | 13 | 8 | 1 | 9 |
| Git | 4 | 1 | — | — |
| GitHub Actions | 2 | — | 1 | — |
| Kubernetes | 2 | 1 | — | — |
| Terraform | 1 | 1 | 1 | — |

---

## Status

Currently working through L1 notes across all active tools. Recent additions cover Docker quickstart follow-up and trying tagged multi-stage build patterns.

---

_Last updated: 2026-07-04_
