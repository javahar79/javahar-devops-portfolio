# javahar-devops-portfolio
> A working DevOps engineer's shelf reference for Docker, Git, GitHub Actions, Kubernetes, and Terraform — notes, snippets, runnable configs, and first-contact walkthroughs.

![Last commit](https://img.shields.io/github/last-commit/javahar79/javahar-devops-portfolio)
![Top language](https://img.shields.io/github/languages/top/javahar79/javahar-devops-portfolio)
![Languages](https://img.shields.io/github/languages/count/javahar79/javahar-devops-portfolio)
![Repo size](https://img.shields.io/github/repo-size/javahar79/javahar-devops-portfolio)
![License](https://img.shields.io/github/license/javahar79/javahar-devops-portfolio)

> **New here? Start at [the learning path](00_index/learning-path.md).** It walks you from first-contact to confident in a sensible order — read that before the tables below.

## Who this is for

A working DevOps engineer's quick-reference: first-contact notes, runnable snippets, and configs for Docker, Git, GitHub Actions, Kubernetes, and Terraform. Use it as a shelf you grab from, not a tutorial site. It deliberately does not try to replace each tool's official docs.

## What's in here

A DevOps learning portfolio across five tool families — Docker (64 files), Git (13), GitHub Actions (14), Kubernetes (12), and Terraform (19) — plus cross-cutting concept primers in CI/CD, Cloud Computing, Container Fundamentals, Git & version control, Infrastructure as Code, Linux OS fundamentals, Networking, and Scripting & Automation. Each tool has a primer, dated CLI walkthrough notes, runnable scripts, Dockerfiles, configs, and manifests accumulated through hands-on practice.

## Quick links

- [Multi-Stage vs Distroless vs Alpine](docker/docs/multi-stage-vs-distroless-vs-alpine.md) — When to choose each Docker image base
- [Dockerfile Antipatterns](docker/docs/dockerfile-antipatterns.md) — Common Dockerfile mistakes and how to avoid them
- [Common Rebase and Reset Patterns](docs/concepts/git-version-control/snippets/2026-07-27-common-rebase-reset-patterns.sh) — Interactive rebase and reset recovery patterns
- [Common Loops, Conditions, and File Patterns](docs/concepts/scripting-automation/snippets/2026-07-27-common-loops-conditions-file-patterns.sh) — Bash patterns for real-world scripting
- [Common Modular and Versioned Configs](docs/concepts/infrastructure-as-code/snippets/2026-07-27-common-modular-versioned-configs.hcl) — Reusable Terraform patterns with modules and version constraints

## Layout

| Directory | Contents |
|-----------|----------|
| `docker/` | Docker primer, CLI walkthrough notes, install/port-map scripts, Dockerfiles, compose config, docs |
| `git/` | Git primer, CLI exploration notes, undo/stage/commit/push notes, branch/merge/revert/reflog scripts |
| `github-actions/` | Actions primer, UI walkthrough, CI workflow configs, workflow debugging docs, validation & audit scripts |
| `kubernetes/` | K8s primer, kubectl notes, local cluster install script, manifests, pod/service debugging scripts and docs |
| `terraform/` | Terraform primer, install script, provider configs, local file resource configs, init & version notes, remote backend docs |
| `docs/` | Cross-cutting concept primers and runnable snippets (CI/CD, Cloud Computing, Container Fundamentals, Git & version control, Infrastructure as Code, Linux fundamentals, Networking, Scripting & Automation) |
| `00_index/` | Topic index, quick links, glossary, learning path |

## Coverage

| Tool | Notes | Scripts | Configs | Dockerfiles | Manifests | Docs | Snippets | Last verified |
|------|-------|---------|---------|-------------|-----------|------|----------|---------------|
| Docker | 20 | 19 | 1 | 21 | — | 2 | — | 2026-07-25 |
| Git | 7 | 6 | — | — | — | — | — | 2026-07-20 |
| GitHub Actions | 4 | 2 | 5 | — | — | 3 | — | 2026-07-24 |
| Kubernetes | 4 | 3 | — | — | 2 | 2 | 1 | 2026-07-21 |
| Terraform | 10 | 3 | 5 | — | — | 1 | — | 2026-07-22 |

## Status

Actively building out first-contact notes and runnable configs across all five tools. Recent additions include multi-stage vs distroless vs alpine comparison docs, a CI pipeline practice script, and cross-cutting concept snippets for Git rebase/reset, Bash loops/conditions, and HCL modular configs. Docker tagged non-root Dockerfiles and Terraform state/backend docs remain the deepest categories.

---

_Last updated: 2026-07-27_
