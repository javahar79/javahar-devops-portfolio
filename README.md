# javahar-devops-portfolio

> A working DevOps engineer's quick-reference for Docker, Git, GitHub Actions, Kubernetes, Terraform, and core Linux/networking concepts.

![Last commit](https://img.shields.io/github/last-commit/javahar79/javahar-devops-portfolio)
![Top language](https://img.shields.io/github/languages/top/javahar79/javahar-devops-portfolio)
![Languages](https://img.shields.io/github/languages/count/javahar79/javahar-devops-portfolio)
![Repo size](https://img.shields.io/github/repo-size/javahar79/javahar-devops-portfolio)

> **New here? Start at [the learning path](00_index/learning-path.md).** It walks you from first-contact to confident in a sensible order — read that before this table.

## Who this is for

A working DevOps engineer's quick-reference: first-contact notes, runnable snippets, and configs for Docker, Git, GitHub Actions, Kubernetes, and Terraform, plus foundational Linux OS and networking concepts. Use it as a shelf you grab from, not a tutorial site. It deliberately does not try to replace each tool's official docs.

## What's in here

A DevOps learning portfolio across five tool families and three foundational concept areas — Docker, Git, GitHub Actions, Kubernetes, Terraform, Linux OS fundamentals, networking basics, and CI/CD concepts. Each tool has a primer, CLI walkthrough notes, Dockerfiles, scripts, and config files for hands-on practice. The concept primers provide the foundational knowledge that underpins everything else.

## Quick links

- [CI/CD Concepts Primer](docs/concepts/ci-cd-concepts/0000-primer-ci-cd-concepts.md) — First-day notes on pipelines, stages, jobs, and triggers
- [Linux & OS Fundamentals Primer](docs/concepts/linux-os-fundamentals/0000-primer-linux-os-fundamentals.md) — Filesystem hierarchy, permissions, processes, and services
- [Networking Basics Primer](docs/concepts/networking-basics/0000-primer-networking-basics.md) — IP addresses, ports, DNS, firewalls, and TCP/UDP
- [Terraform Init First Run (2026-07-14)](terraform/notes/2026-07-14-terraform-init-first-run.md) — Terraform init, provider setup, and first apply walkthrough
- [Tagged Non-Root Dockerfile (2026-07-16)](docker/dockerfiles/2026-07-16-tagged-nonroot.Dockerfile) — Latest tagged non-root multi-stage Dockerfile

## Layout

| Directory | Contents |
|-----------|----------|
| `docker/` | Docker primer, CLI notes, quickstart notes, install/port-map scripts, Dockerfiles, compose config |
| `git/` | Git primer, CLI exploration, quickstart notes, undo/stage/commit workflow, branch/merge/revert script |
| `github-actions/` | Actions primer, UI walkthrough, CI workflow configs, quickstart trials, workflow debugging docs |
| `kubernetes/` | K8s primer, kubectl walkthrough, local cluster install script, K8s manifests, pod/service/event docs |
| `terraform/` | Terraform primer, install script, local provider config, local file resource config, init walkthrough |
| `docs/concepts/` | Foundational primers for Linux OS fundamentals, networking basics, and CI/CD concepts |
| `00_index/` | Topic index, quick links, glossary, learning path |
| `CHANGELOG.md` | Project changelog and release history |

## Coverage

| Tool | Notes | Scripts | Dockerfiles | Configs | Docs | Manifests | Last verified |
|------|-------|---------|-------------|---------|------|-----------|---------------|
| Docker | 19 | 17 | 19 | 1 | — | — | 2026-07-16 |
| Git | 4 | 2 | — | — | — | — | — |
| GitHub Actions | 3 | — | — | 3 | 1 | — | 2026-07-10 |
| Kubernetes | 3 | 1 | — | — | 1 | 1 | 2026-07-12 |
| Terraform | 5 | 1 | — | 3 | — | — | 2026-07-16 |
| Concepts | — | — | — | — | 3 | — | 2026-07-17 |

## Status

Actively building out first-contact notes, Dockerfiles, and runnable scripts. Latest additions (2026-07-17) cover foundational concept primers for Linux OS fundamentals, networking basics, and CI/CD concepts.

---

_Last updated: 2026-07-18_
