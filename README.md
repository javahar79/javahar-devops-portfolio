# javahar-devops-portfolio

> A working DevOps engineer's quick-reference for Docker, Git, GitHub Actions, Kubernetes, and Terraform.

![Last commit](https://img.shields.io/github/last-commit/javahar79/javahar-devops-portfolio)
![Top language](https://img.shields.io/github/languages/top/javahar79/javahar-devops-portfolio)
![Languages](https://img.shields.io/github/languages/count/javahar79/javahar-devops-portfolio)
![Repo size](https://img.shields.io/github/repo-size/javahar79/javahar-devops-portfolio)
![License](https://img.shields.io/github/license/javahar79/javahar-devops-portfolio)

> **New here? Start at [the learning path](00_index/learning-path.md).** It walks you from first-contact to confident in a sensible order — read that before this table.

## Who this is for

A working DevOps engineer's quick-reference: first-contact notes, runnable snippets, and configs for Docker, Git, GitHub Actions, Kubernetes, and Terraform. Use it as a shelf you grab from, not a tutorial site. It deliberately does not try to replace each tool's official docs.

## What's in here

A DevOps learning portfolio across five tool families — Docker (59 files), Git (13), GitHub Actions (12), Kubernetes (12), and Terraform (19) — plus cross-cutting concept primers in CI/CD, Git & version control, Linux OS fundamentals, networking, and scripting & automation. Each tool has a primer, dated CLI walkthrough notes, Dockerfiles, scripts, and config files accumulated through hands-on practice.

---

## Quick links

- [Terraform State Files & Remote Backends (2026-07-22)](terraform/docs/2026-07-22-terraform-state-files-remote-backends.md) — S3 backends, DynamoDB locking, and workspace isolation
- [Git Branching, Merging, and Conflicts (2026-07-22)](docs/concepts/git-version-control/scripts/2026-07-22-git-branching-merging-conflicts.sh) — Hands-on merge-conflict resolution script
- [What I Learned from Validate and Plan (2026-07-21)](terraform/notes/2026-07-21-what-i-learned-from-validate-and-plan.md) — `terraform validate` and `plan` before applying
- [What Tripped Me Up — Terraform Quickstart (2026-07-21)](terraform/notes/2026-07-21-what-tripped-me-up-quickstart.md) — Init-order and directory mistakes
- [GHA Quickstart — What Tripped Me Up (2026-07-21)](github-actions/notes/2026-07-21-gha-quickstart-tripped-me.md) — Workflow syntax, triggers, and debugging gotchas

## Layout

| Directory | Contents |
|-----------|----------|
| `docker/` | Docker primer, CLI walkthrough notes, install/port-map scripts, Dockerfiles, compose config |
| `git/` | Git primer, CLI exploration notes, undo/stage/commit workflow, branch/merge/revert script, reflog/rebase script |
| `github-actions/` | Actions primer, UI walkthrough, CI workflow configs, workflow debugging docs, validation script |
| `kubernetes/` | K8s primer, kubectl notes, local cluster install script, manifests, pod/service debugging scripts and docs |
| `terraform/` | Terraform primer, install script, provider configs, local file resource configs, init & version notes, remote backend docs |
| `docs/` | Cross-cutting concept primers (CI/CD, Git & version control, Linux fundamentals, networking, scripting & automation) |
| `00_index/` | Topic index, quick links, glossary, learning path |
| `CHANGELOG.md` | Release notes and change log |

---

## Coverage

| Tool | Notes | Scripts | Configs | Dockerfiles | Manifests | Docs | Snippets | Source | Last verified |
|------|-------|---------|---------|-------------|-----------|------|----------|--------|---------------|
| Docker | 20 | 18 | 1 | 20 | — | — | — | 2 | 2026-07-18 |
| Git | 7 | 6 | — | — | — | — | — | — | 2026-07-20 |
| GitHub Actions | 4 | 1 | 5 | — | — | 2 | — | — | 2026-07-21 |
| Kubernetes | 4 | 3 | — | — | 2 | 2 | 1 | — | 2026-07-21 |
| Terraform | 10 | 3 | 5 | — | — | 1 | — | — | 2026-07-22 |

---

## Status

Actively building out first-contact notes and runnable configs across all five tools. Recent additions include Terraform remote backend docs, Git branching/conflict resolution scripts, scripting & automation primer, and Terraform validate/plan notes (all 2026-07-21/22). Docker L2 content and tagged non-root Dockerfiles remain the deepest category.

---

_Last updated: 2026-07-22_
