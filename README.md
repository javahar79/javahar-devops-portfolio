# javahar-devops-portfolio
> A working-engineer's DevOps reference — Docker, Terraform, Kubernetes, Git, and GitHub Actions notes, scripts, and configs.

![Last commit](https://img.shields.io/github/last-commit/javahar79/javahar-devops-portfolio)
![Files](https://img.shields.io/badge/files-50-blue)
![Shell](https://img.shields.io/badge/Shell-4EAA25?logo=gnubash&logoColor=white)
![Dockerfile](https://img.shields.io/badge/Dockerfile-2496ED?logo=docker&logoColor=white)
![Markdown](https://img.shields.io/badge/Markdown-000?logo=markdown&logoColor=white)

---

## What's in here

DevOps learning portfolio covering five tool families — Docker, Git, GitHub Actions, Kubernetes, and Terraform. Each tool has a primer, CLI walkthrough notes, and where applicable a ready-to-run script, config file, or Dockerfile.

---

## Coverage

| Tool | Notes | Scripts | Configs | Dockerfiles |
|------|-------|---------|---------|-------------|
| Docker | 12 | 8 | 1 | 9 |
| Git | 4 | 1 | — | — |
| GitHub Actions | 2 | — | 1 | — |
| Kubernetes | 2 | 1 | — | — |
| Terraform | 1 | 1 | 1 | — |

---

## Quick links

- [Go Server Dockerfile](docker/dockerfiles/2026-06-28-trying-tagged-go-server.Dockerfile) — Go multi-stage build with non-root server binary
- [Docker Quickstart Trials (2026-06-28)](docker/notes/2026-06-28-docker-quickstart-trials.md) — Go server quickstart trials with port mapping
- [Run Container Port Map Script (2026-06-28)](docker/scripts/2026-06-28-run-container-port-map.sh) — Build and run Go server with port mapping
- [Trying Tagged Build Dockerfile](docker/dockerfiles/2026-06-26-trying-tagged-build.Dockerfile) — Python multi-stage build with non-root user
- [Docker Quickstart Trip-Ups](docker/notes/2026-06-26-docker-quickstart-trip-ups.md) — Official getting-started guide: what tripped me up

<details>
<summary>Full index</summary>

- [Topics](00_index/topics.md) — Complete topic index
- [Quick Links](00_index/quick-links.md) — Intent-based navigation
- [Glossary](00_index/glossary.md) — Tool-specific terms
- [Learning Path](00_index/learning-path.md) — Suggested progression
- [Changelog](CHANGELOG.md) — Release history

</details>

---

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

## Status

Currently working through L1 notes across all active tools. Recent additions cover Go server quickstart trials and tagged multi-stage builds.

---

_Last updated: 2026-07-01_
