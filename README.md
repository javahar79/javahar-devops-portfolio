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

A DevOps learning portfolio across five tool families — Docker, Git, GitHub Actions, Kubernetes, and Terraform. Each tool has a primer, CLI walkthrough notes, Dockerfiles, scripts, and config files for hands-on practice, plus a small set of cross-cutting concept primers under `docs/`.

---

## Quick links

- [Docker Quickstart — What Tripped Me Up (2026-07-18)](docker/notes/2026-07-18-docker-quickstart-tripped-me.md) — Latest port-mapping, volume, and debugging gotchas
- [Tagged Non-Root Dockerfile (2026-07-18)](docker/dockerfiles/2026-07-18-tagged-nonroot.Dockerfile) — Multi-stage Dockerfile with pinned tag and non-root runtime user
- [Run Container Port Map Script (2026-07-18)](docker/scripts/2026-07-18-run-container-port-map.sh) — Build and run a Go container with port mapping
- [Terraform Version & Init Notes (2026-07-16)](terraform/notes/2026-07-16-terraform-version-init.md) — Terraform CLI version check, init, and first-run notes
- [Local File Resource Config (2026-07-16)](terraform/configs/2026-07-16-local-file-resource.hcl) — Terraform local_file resource with content and filename attributes

## Layout

| Directory | Contents |
|-----------|----------|
| `docker/` | Docker primer, CLI notes, quickstart notes, install/port-map scripts, Dockerfiles, compose config |
| `git/` | Git primer, CLI exploration, quickstart notes, undo/stage/commit workflow, branch/merge/revert script |
| `github-actions/` | Actions primer, UI walkthrough, CI workflow configs, quickstart trials, workflow debugging docs |
| `kubernetes/` | K8s primer, kubectl walkthrough, local cluster install script, K8s manifests, pod/service/event docs |
| `terraform/` | Terraform primer, install script, local provider config, local file resource configs, init & version notes |
| `docs/` | Cross-cutting concept primers (CI/CD, Linux fundamentals, networking basics) |
| `00_index/` | Topic index, quick links, glossary, learning path |
| `CHANGELOG.md` | Project changelog and release history |

---

## Coverage

| Tool | Notes | Scripts | Configs | Dockerfiles | Manifests | Docs | Last verified |
|------|-------|---------|---------|-------------|-----------|------|---------------|
| Docker | 21 | 18 | 1 | 17 | — | — | 2026-07-18 |
| Git | 4 | 2 | — | — | — | — | 2026-07-09 |
| GitHub Actions | 3 | — | 3 | — | — | 1 | 2026-07-12 |
| Kubernetes | 3 | 1 | — | — | 1 | 1 | 2026-07-12 |
| Terraform | 5 | 1 | 3 | — | — | — | 2026-07-16 |

---

## Status

Actively building out first-contact notes and runnable configs. Current focus is Docker quickstart notes and tagged non-root Dockerfiles, with Terraform L1 (install, config, and init) notes recently rounded out.

---
_Last updated: 2026-07-18_
