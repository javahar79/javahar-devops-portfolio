# javahar-devops-portfolio
> A working DevOps engineer's shelf reference for Docker, Git, GitHub Actions, Kubernetes, and Terraform — notes, snippets, runnable configs, and first-contact walkthroughs.

![Last commit](https://img.shields.io/github/last-commit/javahar79/javahar-devops-portfolio)
![Top language](https://img.shields.io/github/languages/top/javahar79/javahar-devops-portfolio)
![Languages](https://img.shields.io/github/languages/count/javahar79/javahar-devops-portfolio)
![Repo size](https://img.shields.io/github/repo-size/javahar79/javahar-devops-portfolio)

> **New here? Start at [the learning path](00_index/learning-path.md).** It walks you from first-contact to confident in a sensible order — read that before this table.

## Who this is for

A working DevOps engineer's quick-reference: first-contact notes, runnable snippets, and configs for Docker, Git, GitHub Actions, Kubernetes, and Terraform. Use it as a shelf you grab from, not a tutorial site. It deliberately does not try to replace each tool's official docs.

## What's in here

A DevOps learning portfolio across five tool families — Docker, Git, GitHub Actions, Kubernetes, and Terraform — plus cross-cutting concept primers in CI/CD, Cloud Computing, Container Fundamentals, Git & version control, Infrastructure as Code, Linux OS fundamentals, Networking, and Scripting & Automation. Each tool has a primer, dated CLI walkthrough notes, runnable scripts, Dockerfiles, configs, manifests, and notebooks accumulated through hands-on practice.

## Quick links

- [Reusable Workflow with Inputs](github-actions/configs/reusable-workflow-with-inputs.yaml) — Reusable GitHub Actions workflow with input parameters and matrix strategy
- [Complex Reusable Workflow](github-actions/snippets/complex-reusable-workflow-matrix-approvals.yaml) — Reusable workflow with matrix builds, approval gates, and rollback
- [Multi-Tier App Debugging Walkthrough](kubernetes/notebooks/multi-tier-app-debugging-walkthrough.ipynb) — End-to-end K8s debugging notebook for multi-tier applications
- [Git Bisect Automation Notebook](git/notebooks/git-bisect-automation-and-history-rewrite.ipynb) — Binary search through commit history to isolate the first breaking change
- [Multi-Service Compose Notebook](docker/notebooks/multi-service-compose.ipynb) — Flask web app with PostgreSQL, healthcheck, network inspection, and service discovery walkthrough

## Layout

| Directory | Contents |
|-----------|----------|
| `docker/` | Docker primer, CLI notes, install/port-map scripts, Dockerfiles, compose config, docs, notebook |
| `git/` | Git primer, CLI notes, undo/stage/commit/push notes, branch/merge/revert/reflog/bisect scripts, .gitattributes config, merge-vs-rebase docs, bisect notebook |
| `github-actions/` | Actions primer, UI walkthrough, CI workflow configs, workflow debugging docs, validation & audit scripts, snippets |
| `kubernetes/` | K8s primer, kubectl notes, local cluster install script, manifests, pod/service debugging scripts and docs, snippets, notebook |
| `terraform/` | Terraform primer, install script, provider configs, local file resource configs, init & version notes, remote backend docs |
| `docs/concepts/` | Cross-cutting concept primers and runnable snippets (CI/CD, Cloud Computing, Container Fundamentals, Git & version control, Infrastructure as Code, Linux fundamentals, Networking, Scripting & Automation) |
| `00_index/` | Topic index, quick links, glossary, learning path |

## Coverage

| Tool | Notes | Scripts | Configs | Dockerfiles | Manifests | Docs | Snippets | Notebooks | Last verified |
|------|-------|---------|---------|-------------|-----------|------|----------|-----------|---------------|
| Docker | 20 | 21 | 1 | 22 | — | 2 | — | 1 | 2026-08-03 |
| Git | 7 | 7 | 1 | — | — | 1 | — | 1 | 2026-08-03 |
| GitHub Actions | 4 | 2 | 6 | — | — | 3 | 1 | — | 2026-08-03 |
| Kubernetes | 4 | 4 | — | — | 4 | 3 | 1 | 1 | 2026-08-03 |
| Terraform | 10 | 4 | 6 | — | — | 2 | — | 1 | 2026-08-03 |

## Status

Actively building out first-contact notes and runnable configs across all five tools. Recent additions include a reusable GitHub Actions workflow with inputs and matrix strategy; a multi-tier Kubernetes debugging notebook; a Git bisect automation notebook; and a multi-service Docker Compose notebook. Docker tagged non-root and multi-stage Dockerfiles and Terraform notes/configs remain the deepest categories.

---
_Last updated: 2026-08-04_