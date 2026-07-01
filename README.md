# javahar-devops-portfolio
> A working-engineer's DevOps reference — Docker, Terraform, Kubernetes, Git, and GitHub Actions notes, scripts, and configs.

![Last commit](https://img.shields.io/github/last-commit/javahar79/javahar-devops-portfolio)
![Files](https://img.shields.io/badge/files-47-blue)
![Shell](https://img.shields.io/badge/Shell-4EAA25?logo=gnubash&logoColor=white)
![YAML](https://img.shields.io/badge/YAML-000?logo=yaml&logoColor=white)

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

- [Docker Quickstart Trip-Ups (2026-06-29)](docker/notes/2026-06-29-docker-quickstart-trip-ups.md) — Getting-started guide: what tripped me up this time
- [Tagged Non-Root Dockerfile (2026-06-29)](docker/dockerfiles/2026-06-29-tagged-nonroot.Dockerfile) — Minimal multi-stage Alpine build with non-root user
- [First Container Port Map Script (2026-06-29)](docker/scripts/2026-06-29-first-container-port-map.sh) — Run nginx and verify port mapping end to end
- [Docker Quickstart Trip-Ups](docker/notes/2026-06-26-docker-quickstart-trip-ups.md) — Official getting-started guide: what tripped me up
- [Trying Tagged Build Dockerfile](docker/dockerfiles/2026-06-26-trying-tagged-build.Dockerfile) — Python multi-stage build with non-root user
- [First Container Port Map Script](docker/scripts/2026-06-26-first-container-port-map.sh) — Run nginx and verify port mapping
- [Tagged Non-Root Dockerfile](docker/dockerfiles/2026-06-26-tagged-nonroot.Dockerfile) — Tagged multi-stage build with non-root user
- [Docker Quickstart Trials](docker/notes/2026-06-26-docker-quickstart-trials.md) — More quickstart trials and gotchas

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

Currently working through L1 notes across all active tools. Recent additions cover Docker quickstart trip-ups and trying tagged build patterns.

---

_Last updated: 2026-06-29_
