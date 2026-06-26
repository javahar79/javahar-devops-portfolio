# javahar-devops-portfolio
> A working-engineer's DevOps reference — Docker, Terraform, Kubernetes, Git, and GitHub Actions notes, scripts, and configs.

![Last commit](https://img.shields.io/github/last-commit/javahar79/javahar-devops-portfolio)
![Files](https://img.shields.io/badge/files-41-blue)
![Markdown](https://img.shields.io/badge/Markdown-000?logo=markdown&logoColor=white)
![Shell](https://img.shields.io/badge/Shell-4EAA25?logo=gnubash&logoColor=white)

---

## What's in here

DevOps learning portfolio covering five tool families — Docker, Git, GitHub Actions, Kubernetes, and Terraform. Each tool has a primer, CLI walkthrough notes, and where applicable a ready-to-run script, config file, or Dockerfile.

---

## Coverage

| Tool | Notes | Scripts | Configs | Dockerfiles |
|------|-------|---------|---------|-------------|
| Docker | 9 | 5 | 1 | 6 |
| Git | 4 | 1 | — | — |
| GitHub Actions | 2 | — | 1 | — |
| Kubernetes | 2 | 1 | — | — |
| Terraform | 1 | 1 | 1 | — |

---

## Quick links

- [Docker Quickstart Walkthrough](docker/notes/2026-06-25-docker-quickstart-walkthrough.md) — Guided walkthrough covering build, run, tag, and push
- [Minimal Tagged Non-Root Dockerfile](docker/dockerfiles/2026-06-25-minimal-tagged-nonroot.Dockerfile) — Tagged multi-stage build with non-root user
- [Container Port Map Script](docker/scripts/2026-06-25-first-container-port-map.sh) — Build and run nginx with port mapping end to end
- [Git Undo, Stage, Commit, Push](git/notes/2026-06-24-git-undo-stage-commit-push.md) — Basic Git workflow including undoing mistakes
- [Go Hello-World Non-Root Dockerfile](docker/dockerfiles/2026-06-24-hello-go-nonroot.Dockerfile) — Multi-stage Go build with non-root user

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

Currently working through L1 notes across all active tools. Recent additions cover a Docker quickstart walkthrough (build, run, tag, push), a minimal tagged non-root Dockerfile, and a first-container port-map script.

---

_Last updated: 2026-06-26_
