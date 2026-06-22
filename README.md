# javahar-devops-portfolio
> A working-engineer's DevOps reference — Docker, Terraform, Kubernetes, Git, and GitHub Actions notes, scripts, and configs.

![Last commit](https://img.shields.io/github/last-commit/javahar79/javahar-devops-portfolio)
![Files](https://img.shields.io/badge/files-22-blue)
![Contributors](https://img.shields.io/github/contributors/javahar79/javahar-devops-portfolio)
![Markdown](https://img.shields.io/badge/Markdown-000?logo=markdown&logoColor=white)
![Shell](https://img.shields.io/badge/Shell-4EAA25?logo=gnubash&logoColor=white)

---

## What's in here

DevOps learning portfolio covering six tool families — Docker, Git, GitHub Actions, Kubernetes, Terraform, and General devops automation. Each tool has a primer, CLI walkthrough notes, and where applicable a ready-to-run script or config file.

---

## Coverage

| Tool | Notes | Scripts | Configs | Dockerfiles |
|------|-------|---------|---------|-------------|
| Docker | 2 | 1 | 1 | 1 |
| Git | 2 | 1 | — | — |
| GitHub Actions | 2 | — | 1 | — |
| Kubernetes | 2 | 1 | — | — |
| Terraform | 1 | 1 | 1 | — |

---

## Quick links

- [Multi-Service Compose Config](docker/configs/multi-service-compose.yaml) — Web app plus PostgreSQL
- [Minimal Multi-Stage Dockerfile](docker/dockerfiles/minimal-multi-stage.Dockerfile) — Layer-optimised multi-stage build example
- [Local Provider Config](terraform/configs/local-provider.hcl) — Minimal Terraform config with local provider
- [Terraform Primer](terraform/notes/0000-primer-terraform.md) — What is Terraform?
- [Install Terraform Script](terraform/scripts/2026-06-17-install-terraform.sh) — Install and init first project

<details>
<summary>Full index</summary>

- [Topics](00_index/topics.md) — Complete topic index
- [Quick Links](00_index/quick-links.md) — Intent-based navigation
- [Glossary](00_index/glossary.md) — Tool-specific terms
- [Changelog](CHANGELOG.md) — Release history

</details>

---

## Layout

| Directory | Contents |
|-----------|----------|
| `docker/` | Docker primer, CLI notes, install script, Dockerfile, compose config |
| `git/` | Git primer, CLI exploration, first-commit script |
| `github-actions/` | Actions primer, UI walkthrough, CI workflow |
| `kubernetes/` | K8s primer, kubectl walkthrough, local cluster install script |
| `terraform/` | Terraform primer, install script, local provider config |
| `00_index/` | Topic index, quick links, glossary |

---

## Status

Currently filling L1 primers and first-contact notes across all active tools. Most recent work added Docker compose and multi-stage Dockerfile examples.

---

_Last updated: 2026-06-19_
