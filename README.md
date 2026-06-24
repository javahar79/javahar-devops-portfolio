# javahar-devops-portfolio
> A working-engineer's DevOps reference — Docker, Terraform, Kubernetes, Git, and GitHub Actions notes, scripts, and configs.

![Last commit](https://img.shields.io/github/last-commit/javahar79/javahar-devops-portfolio)
![Files](https://img.shields.io/badge/files-32-blue)
![Markdown](https://img.shields.io/badge/Markdown-000?logo=markdown&logoColor=white)
![Shell](https://img.shields.io/badge/Shell-4EAA25?logo=gnubash&logoColor=white)

---

## What's in here

DevOps learning portfolio covering five tool families — Docker, Git, GitHub Actions, Kubernetes, and Terraform. Each tool has a primer, CLI walkthrough notes, and where applicable a ready-to-run script or config file. 32 files in total.

---

## Coverage

| Tool | Notes | Scripts | Configs | Dockerfiles |
|------|-------|---------|---------|-------------|
| Docker | 6 | 3 | 1 | 3 |
| Git | 3 | 1 | — | — |
| GitHub Actions | 2 | — | 1 | — |
| Kubernetes | 2 | 1 | — | — |
| Terraform | 1 | 1 | 1 | — |

---

## Quick links

- [Non-Root Multi-Stage Dockerfile](docker/dockerfiles/minimal-tagged-nonroot.Dockerfile) — Security-focused multi-stage build with non-root user
- [Docker Quickstart Notes (2026-06-23)](docker/notes/2026-06-23-docker-quickstart.md) — Docker quickstart — what tripped me up
- [Tagged Non-Root Dockerfile](docker/dockerfiles/2026-06-23-tagged-nonroot.Dockerfile) — Tagged build with non-root runtime
- [Multi-Service Compose Config](docker/configs/multi-service-compose.yaml) — Web app plus PostgreSQL
- [Port Map Script (2026-06-23)](docker/scripts/2026-06-23-run-container-port-map.sh) — Run nginx and verify port mapping

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
| `docker/` | Docker primer, CLI notes, quickstart notes, install script, Dockerfiles, compose config |
| `git/` | Git primer, CLI exploration, quickstart notes, first-commit script |
| `github-actions/` | Actions primer, UI walkthrough, CI workflow |
| `kubernetes/` | K8s primer, kubectl walkthrough, local cluster install script |
| `terraform/` | Terraform primer, install script, local provider config |
| `00_index/` | Topic index, quick links, glossary, learning path |

---

## Status

Currently filling L1 primers and first-contact notes across all active tools. Recent additions include tagged non-root Dockerfile, Docker quickstart notes (2026-06-23), and port map script.

---

_Last updated: 2026-06-23_
