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

- [Tagged Non-Root Dockerfile (2026-07-09)](docker/dockerfiles/2026-07-09-tagged-nonroot.Dockerfile) — Minimal Alpine multi-stage build with pinned tag and non-root runtime
- [First Container Port Map Script (2026-07-09)](docker/scripts/2026-07-09-first-container-port-map.sh) — Build and run Alpine container with port 8082 mapping
- [Branch, Merge, and Revert Workflow (2026-07-09)](git/scripts/2026-07-09-branch-merge-revert-workflow.sh) — Git branch, merge, and revert practice script
- [Minimal CI Workflow (2026-07-09)](github-actions/configs/2026-07-09-minimal-ci-workflow.yaml) — Minimal GitHub Actions CI workflow config
- [GitHub Actions Quickstart — What Tripped Me Up (2026-07-09)](github-actions/notes/2026-07-09-gha-quickstart-trials.md) — Workflow syntax, checkout action, and trigger gotchas

## Layout

| Directory | Contents |
|-----------|----------|
| `docker/` | Docker primer, CLI notes, quickstart notes, install scripts, Dockerfiles, compose config |
| `git/` | Git primer, CLI exploration, quickstart notes, undo/stage/commit workflow, branch/merge/revert script |
| `github-actions/` | Actions primer, UI walkthrough, CI workflow config, quickstart trials |
| `kubernetes/` | K8s primer, kubectl walkthrough, local cluster install script |
| `terraform/` | Terraform primer, install script, local provider config |
| `00_index/` | Topic index, quick links, glossary, learning path |
| `CHANGELOG.md` | Project changelog and release history |

---

## Coverage

| Tool | Notes | Scripts | Configs | Dockerfiles | Last verified |
|------|-------|---------|---------|-------------|---------------|
| Docker | 18 | 15 | 1 | 15 | 2026-07-09 |
| Git | 4 | 2 | — | — | 2026-07-09 |
| GitHub Actions | 3 | — | 2 | — | 2026-07-09 |
| Kubernetes | 2 | 1 | — | — | 2026-06-16 |
| Terraform | 1 | 1 | 1 | — | 2026-06-17 |

---

## Status

Actively building out first-contact notes and runnable configs. Recent additions cover Git branch/merge/revert workflows, GitHub Actions quickstart trials, and updated Docker non-root work.

---

_Last updated: 2026-07-10_
