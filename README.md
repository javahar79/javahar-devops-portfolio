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

A DevOps learning portfolio across five tool families — Docker, Git, GitHub Actions, Kubernetes, and Terraform. Each tool has a primer, CLI walkthrough notes, and where applicable a ready-to-run script, config file, or Dockerfile.

---

## Quick links

- [Docker Quickstart — What Tripped Me Up (2026-07-08)](docker/notes/2026-07-08-docker-quickstart-trials.md) — localhost vs service name, port conflicts, `.dockerignore`, and `latest`-tag gotchas
- [Port Map Script (2026-07-08)](docker/scripts/2026-07-08-first-container-port-map.sh) — Build and run a Python container with host port 8081 mapping
- [Tagged Non-Root Dockerfile (2026-07-08)](docker/dockerfiles/2026-07-08-tagged-nonroot.Dockerfile) — Multi-stage Python build with a pinned tag and non-root runtime
- [Docker Quickstart — What Tripped Me Up (2026-07-07)](docker/notes/2026-07-07-docker-quickstart-tripped-me.md) — First-contact quickstart follow-up notes
- [Docker Quickstart Trials (2026-07-07)](docker/notes/2026-07-07-docker-quickstart-trials.md) — More quickstart follow-up trials

## Layout

| Directory | Contents |
|-----------|----------|
| `docker/` | Docker primer, CLI notes, quickstart notes, install scripts, Dockerfiles, compose config |
| `git/` | Git primer, CLI exploration, quickstart notes, undo/stage/commit workflow, first-commit script |
| `github-actions/` | Actions primer, UI walkthrough, CI workflow config |
| `kubernetes/` | K8s primer, kubectl walkthrough, local cluster install script |
| `terraform/` | Terraform primer, install script, local provider config |
| `00_index/` | Topic index, quick links, glossary, learning path |
| `CHANGELOG.md` | Project changelog and release history |

---

## Coverage

| Tool | Notes | Scripts | Configs | Dockerfiles | Last verified |
|------|-------|---------|---------|-------------|---------------|
| Docker | 18 | 14 | 1 | 14 | 2026-07-08 |
| Git | 4 | 2 | — | — | — |
| GitHub Actions | 3 | — | 2 | — | — |
| Kubernetes | 2 | 1 | — | — | — |
| Terraform | 1 | 1 | 1 | — | — |

## Status

Actively building out first-contact notes and runnable configs. Recent additions focus on Docker quickstart follow-ups and non-root multi-stage build patterns.

---

_Last updated: 2026-07-09_
