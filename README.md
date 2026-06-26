# javahar-devops-portfolio
> A working-engineer's DevOps reference — Docker, Terraform, Kubernetes, Git, and GitHub Actions notes, scripts, and configs.

![Last commit](https://img.shields.io/github/last-commit/javahar79/javahar-devops-portfolio)
![Files](https://img.shields.io/badge/files-47-blue)
![Markdown](https://img.shields.io/badge/Markdown-000?logo=markdown&logoColor=white)
![Shell](https://img.shields.io/badge/Shell-4EAA25?logo=gnubash&logoColor=white)
![Dockerfile](https://img.shields.io/badge/Dockerfile-2496ED?logo=docker&logoColor=white)

---

## What's in here

DevOps learning portfolio covering five tool families — Docker, Git, GitHub Actions, Kubernetes, and Terraform. Each tool has a primer, CLI walkthrough notes, and where applicable a ready-to-run script, config file, or Dockerfile. Over 45 files split across notes, scripts, configs, Dockerfiles, and index pages.

---

## Coverage

| Tool | Notes | Scripts | Configs | Dockerfiles |
|------|-------|---------|---------|-------------|
| Docker | 11 | 7 | 1 | 8 |
| Git | 4 | 1 | — | — |
| GitHub Actions | 2 | — | 1 | — |
| Kubernetes | 2 | 1 | — | — |
| Terraform | 1 | 1 | 1 | — |

---

## Quick links

- [Docker Quickstart Walkthrough](docker/notes/2026-06-25-docker-quickstart-walkthrough.md) — Guided build, run, tag, and push walkthrough
- [Docker Quickstart Trip-Ups](docker/notes/2026-06-26-docker-quickstart-trip-ups.md) — What went wrong following the official getting-started guide
- [Tagged Build Dockerfile (Python)](docker/dockerfiles/2026-06-26-trying-tagged-build.Dockerfile) — Python multi-stage build with non-root user
- [First Container Port Map Script (nginx)](docker/scripts/2026-06-26-first-container-port-map.sh) — Run nginx and verify port mapping end to end
- [Tagged Non-Root Dockerfile](docker/dockerfiles/2026-06-26-tagged-nonroot.Dockerfile) — Alpine multi-stage build with non-root user

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

Currently working through L1 notes across all active tools. Recent additions cover a Docker getting-started walkthrough (trying-tagged-build), trip-ups notes, a new port-map script for nginx, and a Go-based tagged non-root Dockerfile.

---

_Last updated: 2026-06-26_
