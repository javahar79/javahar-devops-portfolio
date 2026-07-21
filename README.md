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

A DevOps learning portfolio across five tool families — Docker, Git, GitHub Actions, Kubernetes, and Terraform — plus cross-cutting concept primers in CI/CD, Linux OS fundamentals, and networking. Each tool has a primer, dated CLI walkthrough notes, Dockerfiles, scripts, and config files accumulated through hands-on practice.

---

## Quick links

- [Docker Quickstart — What Tripped Me Up (2026-07-18)](docker/notes/2026-07-18-docker-quickstart-tripped-me.md) — Latest port-mapping, volume, and debugging gotchas
- [Git Undo/Stage/Commit/Push (2026-07-19)](git/notes/2026-07-19-git-undo-stage-commit-push.md) — Fixing mistakes in Git workflow
- [Reading Workflow Logs & Debugging (2026-07-19)](github-actions/docs/2026-07-19-reading-workflow-logs-and-debugging.md) — Debugging GHA failures
- [K8s Quickstart — What Tripped Me Up (2026-07-19)](kubernetes/notes/2026-07-19-k8s-quickstart-trials.md) — Latest K8s first-contact gotchas
- [Terraform Directory Structure (2026-07-19)](terraform/notes/2026-07-19-terraform-directory-structure.md) — Terraform project layout

## Layout

| Directory | Contents |
|-----------|----------|
| `docker/` | Docker primer, CLI walkthrough notes, install/port-map scripts, Dockerfiles, compose config |
| `git/` | Git primer, CLI exploration notes, undo/stage/commit workflow, branch/merge/revert script, reflog/rebase snippet |
| `github-actions/` | Actions primer, UI walkthrough, CI workflow configs, workflow debugging docs, run-name/conditions snippet |
| `kubernetes/` | K8s primer, kubectl notes, local cluster install script, manifests, pod/service debugging docs |
| `terraform/` | Terraform primer, install script, provider configs, local file resource configs, init & version notes |
| `docs/` | Cross-cutting concept primers (CI/CD, Linux fundamentals, networking basics) |
| `00_index/` | Topic index, quick links, glossary, learning path |
| `CHANGELOG.md` | Release notes and change log |

---

## Coverage

| Tool | Notes | Scripts | Configs | Dockerfiles | Manifests | Docs | Source | Last verified |
|------|-------|---------|---------|-------------|-----------|------|--------|---------------|
| Docker | 20 | 18 | 1 | 18 | — | — | 2 | 2026-07-18 |
| Git | 6 | 6 | — | — | — | — | — | 2026-07-20 |
| GitHub Actions | 3 | — | 5 | — | — | 2 | — | 2026-07-19 |
| Kubernetes | 4 | 2 | — | — | 1 | 2 | — | 2026-07-19 |
| Terraform | 8 | 1 | 4 | — | — | — | — | 2026-07-19 |

---

## Status

Actively building out first-contact notes and runnable configs across all five tools. Recent additions include Git quickstart notes, GHA workflow debugging docs, K8s pod/service inspection notes, and Terraform directory structure notes (all 2026-07-19). Docker L2 content and tagged non-root Dockerfiles continue to be the deepest category.

---

_Last updated: 2026-07-21_
