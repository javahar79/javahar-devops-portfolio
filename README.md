# javahar-devops-portfolio
> A working-engineer's DevOps reference — Docker, Terraform, Kubernetes, Git, and GitHub Actions notes, scripts, and configs.

![Last commit](https://img.shields.io/github/last-commit/javahar79/javahar-devops-portfolio)
![Files](https://img.shields.io/badge/files-38-blue)
![Markdown](https://img.shields.io/badge/Markdown-000?logo=markdown&logoColor=white)
![Shell](https://img.shields.io/badge/Shell-4EAA25?logo=gnubash&logoColor=white)
![HCL](https://img.shields.io/badge/HCL-844BBA?logo=terraform&logoColor=white)

---

## What's in here

DevOps learning portfolio covering five tool families — Docker, Git, GitHub Actions, Kubernetes, and Terraform. Each tool has a primer, CLI walkthrough notes, and where applicable a ready-to-run script, config file, or Dockerfile.

---

## Coverage

| Tool | Notes | Scripts | Configs | Dockerfiles |
|------|-------|---------|---------|-------------|
| Docker | 8 | 4 | 1 | 5 |
| Git | 4 | 1 | — | — |
| GitHub Actions | 2 | — | 1 | — |
| Kubernetes | 2 | 1 | — | — |
| Terraform | 1 | 1 | 1 | — |

---

## Quick links

- [Git Undo, Stage, Commit, Push](git/notes/2026-06-24-git-undo-stage-commit-push.md) — Basic Git workflow including undoing mistakes
- [Docker Quickstart — Third Pass](docker/notes/2026-06-24-docker-quickstart.md) — Official tutorial walkthrough with Compose gotchas
- [Go Hello-World Non-Root Dockerfile](docker/dockerfiles/2026-06-24-hello-go-nonroot.Dockerfile) — Multi-stage Go build with non-root user
- [Nginx Non-Root Dockerfile](docker/dockerfiles/2026-06-24-nginx-nonroot.Dockerfile) — Multi-stage nginx build running as non-root
- [Container Port Map Script](docker/scripts/2026-06-24-run-container-port-map.sh) — Build and run container with port mapping end to end

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

Currently working through L1 notes across all active tools. Recent additions cover Docker quickstart passes (Compose networking, layer caching, Docker Hub push), non-root Dockerfiles (Go, nginx), port-map scripts, and the Git undo/stage/commit workflow.

---
_Last updated: 2026-06-25_
