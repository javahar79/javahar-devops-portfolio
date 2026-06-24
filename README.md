# javahar-devops-portfolio
> A working-engineer's DevOps reference — Docker, Git, GitHub Actions, Kubernetes, and Terraform notes, scripts, and configs.

![Last commit](https://img.shields.io/github/last-commit/javahar79/javahar-devops-portfolio)
![Files](https://img.shields.io/badge/files-32-blue)
![Markdown](https://img.shields.io/badge/Markdown-000?logo=markdown&logoColor=white)
![Shell](https://img.shields.io/badge/Shell-4EAA25?logo=gnubash&logoColor=white)
![YAML](https://img.shields.io/badge/YAML-CB171E?logo=yaml&logoColor=white)

---

## What's in here

DevOps learning portfolio covering five tool families — Docker, Git, GitHub Actions, Kubernetes, and Terraform. Each tool has a primer, CLI walkthrough notes, and where applicable a ready-to-run script or config file.

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

- [Learning Path](00_index/learning-path.md) — Suggested progression from beginner to advanced
- [Tagged Non-Root Multi-Stage Dockerfile](docker/dockerfiles/2026-06-23-tagged-nonroot.Dockerfile) — Multi-stage build with non-root runtime
- [Port Map Container Script](docker/scripts/2026-06-23-run-container-port-map.sh) — Build, run, map port, and verify a container
- [Docker Quickstart Notes — Second Pass](docker/notes/2026-06-23-docker-quickstart.md) — Following the quickstart again with Compose
- [Git Quickstart Notes](git/notes/2026-06-22-git-quickstart.md) — Git quickstart notes

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
| `docker/` | Docker primers, CLI notes, quickstart notes, scripts, Dockerfiles, Compose config |
| `git/` | Git primer, CLI notes, quickstart notes, first-commit script |
| `github-actions/` | Actions primer, UI notes, CI workflow |
| `kubernetes/` | K8s primer, kubectl notes, local cluster install script |
| `terraform/` | Terraform primer, install script, local provider config |
| `00_index/` | Topic index, quick links, glossary, learning path |

---

## Status

Currently filling L1 primers and first-contact notes across all active tools. Recent additions include Docker quickstart notes, a non-root user Dockerfile, and a port-mapping container script.

---

_Last updated: 2026-06-23_
