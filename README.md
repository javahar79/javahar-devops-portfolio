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

A DevOps learning portfolio across five tool families — Docker (64 files), Git (16), GitHub Actions (14), Kubernetes (15), and Terraform (22) — plus cross-cutting concept primers in CI/CD, Cloud Computing, Container Fundamentals, Git & version control, Infrastructure as Code, Linux OS fundamentals, Networking, and Scripting & Automation. Each tool has a primer, dated CLI walkthrough notes, runnable scripts, Dockerfiles, configs, and manifests accumulated through hands-on practice.

## Quick links

- [Automate Git Bisect](git/scripts/git-bisect-automation.sh) — Find the first breaking commit with automated bisect
- [Git Merge vs Rebase](git/docs/git-merge-vs-rebase.md) — Comparing merge and rebase for integrating changes
- [.gitattributes Config](git/configs/gitattributes-merge-eol-diff.gitattributes) — EOL normalization, merge strategies, and diff configuration
- [kubectl Rollout vs Edit](kubernetes/scripts/kubectl-rollout-vs-edit.sh) — Zero-downtime update strategy comparison
- [ConfigMaps, Secrets, and env vars](kubernetes/docs/configmaps-secrets-env-vars.md) — Wiring configuration and secrets into a K8s Deployment

## Layout

| Directory | Contents |
|-----------|----------|
| `docker/` | Docker primer, CLI walkthrough notes, install/port-map scripts, Dockerfiles, compose config, docs |
| `git/` | Git primer, CLI notes, undo/stage/commit/push notes, branch/merge/revert/reflog/bisect scripts, .gitattributes config, merge-vs-rebase docs |
| `github-actions/` | Actions primer, UI walkthrough, CI workflow configs, workflow debugging docs, validation & audit scripts |
| `kubernetes/` | K8s primer, kubectl notes, local cluster install script, manifests, pod/service debugging scripts and docs |
| `terraform/` | Terraform primer, install script, provider configs, local file resource configs, init & version notes, remote backend docs |
| `docs/` | Cross-cutting concept primers and runnable snippets (CI/CD, Cloud Computing, Container Fundamentals, Git & version control, Infrastructure as Code, Linux fundamentals, Networking, Scripting & Automation) |
| `00_index/` | Topic index, quick links, glossary, learning path |

## Coverage

| Tool | Notes | Scripts | Configs | Dockerfiles | Manifests | Docs | Snippets | Last verified |
|------|-------|---------|---------|-------------|-----------|------|----------|---------------|
| Docker | 20 | 20 | 1 | 21 | — | 2 | — | 2026-07-25 |
| Git | 7 | 7 | 1 | — | — | 1 | — | 2026-07-30 |
| GitHub Actions | 4 | 2 | 5 | — | — | 3 | — | 2026-07-24 |
| Kubernetes | 4 | 4 | — | — | 3 | 3 | 1 | 2026-07-30 |
| Terraform | 10 | 4 | 6 | — | — | 2 | — | 2026-07-27 |

## Status

Actively building out first-contact notes and runnable configs across all five tools. Recent additions include Git bisect automation, merge-vs-rebase docs, and .gitattributes config; Kubernetes ConfigMap/Secret wiring and zero-downtime rollout-vs-edit scripts; and a PostgreSQL StatefulSet manifest with PVC. Docker tagged non-root Dockerfiles and Terraform notes/configs remain the deepest categories.

---

_Last updated: 2026-07-31_
