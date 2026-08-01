# javahar-devops-portfolio
> A working DevOps engineer's shelf reference for Docker, Git, GitHub Actions, Kubernetes, and Terraform — notes, snippets, runnable configs, and first-contact walkthroughs.

![Last commit](https://img.shields.io/github/last-commit/javahar79/javahar-devops-portfolio)
![Top language](https://img.shields.io/github/languages/top/javahar79/javahar-devops-portfolio)
![Languages](https://img.shields.io/github/languages/count/javahar79/javahar-devops-portfolio)
![Repo size](https://img.shields.io/github/repo-size/javahar79/javahar-devops-portfolio)

> **New here? Start at [the learning path](00_index/learning-path.md).** It walks you from first-contact to confident in a sensible order — read that before the tables below.

## Who this is for

A working DevOps engineer's quick-reference: first-contact notes, runnable snippets, and configs for Docker, Git, GitHub Actions, Kubernetes, and Terraform. Use it as a shelf you grab from, not a tutorial site. It deliberately does not try to replace each tool's official docs.

## What's in here

A DevOps learning portfolio across five tool families — Docker (67 files), Git (17), GitHub Actions (14), Kubernetes (16), and Terraform (22) — plus cross-cutting concept primers (17 files) in CI/CD, Cloud Computing, Container Fundamentals, Git & version control, Infrastructure as Code, Linux OS fundamentals, Networking, and Scripting & Automation. Each tool has a primer, dated CLI walkthrough notes, runnable scripts, Dockerfiles, configs, manifests, and notebooks accumulated through hands-on practice.

## Quick links

- [BuildKit Distroless Dockerfile](docker/dockerfiles/multi-stage-buildkit-distroless.Dockerfile) — Multi-stage Go build with BuildKit cache mounts, distroless runtime, non-root user, and HEALTHCHECK
- [Build Multi-Stage with Secrets Script](docker/scripts/build-multi-stage-with-secrets.sh) — BuildKit secrets mount pattern keeping API keys out of image layers
- [Multi-Service Compose Notebook](docker/notebooks/multi-service-compose.ipynb) — Flask web app with PostgreSQL, healthcheck, network inspection, and service discovery walkthrough
- [Git Bisect Automation Notebook](git/notebooks/git-bisect-automation-and-history-rewrite.ipynb) — Binary search through commit history to isolate the first breaking change
- [CI/CD Pipeline Stage Patterns](docs/concepts/ci-cd-concepts/snippets/2026-07-31-cicd-pipeline-stage-patterns.yaml) — Build, test, deploy, approval gate, and rollback stage patterns for GitHub Actions

## Layout

| Directory | Contents |
|-----------|----------|
| `docker/` | Docker primer, CLI notes, install/port-map scripts, Dockerfiles, compose config, docs, notebook |
| `git/` | Git primer, CLI notes, undo/stage/commit/push notes, branch/merge/revert/reflog/bisect scripts, .gitattributes config, merge-vs-rebase docs, bisect notebook |
| `github-actions/` | Actions primer, UI walkthrough, CI workflow configs, workflow debugging docs, validation & audit scripts |
| `kubernetes/` | K8s primer, kubectl notes, local cluster install script, manifests, pod/service debugging scripts and docs |
| `terraform/` | Terraform primer, install script, provider configs, local file resource configs, init & version notes, remote backend docs |
| `docs/concepts/` | Cross-cutting concept primers and runnable snippets (CI/CD, Cloud Computing, Container Fundamentals, Git & version control, Infrastructure as Code, Linux fundamentals, Networking, Scripting & Automation) |
| `00_index/` | Topic index, quick links, glossary, learning path |

## Coverage

| Tool | Notes | Scripts | Configs | Dockerfiles | Manifests | Docs | Notebooks | Snippets | Last verified |
|------|-------|---------|---------|-------------|-----------|------|----------|----------|---------------|
| Docker | 20 | 21 | 1 | 22 | — | 2 | 1 | — | 2026-07-25 |
| Git | 7 | 7 | 1 | — | — | 1 | 1 | — | 2026-07-30 |
| GitHub Actions | 4 | 2 | 5 | — | — | 3 | — | — | 2026-07-24 |
| Kubernetes | 4 | 4 | — | — | 4 | 3 | — | 1 | 2026-07-30 |
| Terraform | 10 | 4 | 6 | — | — | 2 | — | — | 2026-07-27 |

## Status

Actively building out first-contact notes and runnable configs across all five tools. Recent additions include a Git bisect automation notebook and script; a multi-stage BuildKit distroless Dockerfile with secrets mount; a Docker Compose multi-service Flask + PostgreSQL notebook; state-aware CI/CD + IaC pipeline documentation; and CI/CD pipeline stage patterns with approval gates and rollback. Docker tagged non-root and multi-stage Dockerfiles and Terraform notes/configs remain the deepest categories.

---

_Last updated: 2026-08-01_
