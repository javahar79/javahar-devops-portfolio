# javahar-devops-portfolio
> A working DevOps engineer's shelf reference for Docker, Git, Kubernetes, Terraform, GitHub Actions, OpenTofu, Ansible, and Jenkins — notes, snippets, runnable configs, and first-contact walkthroughs.

![Last commit](https://img.shields.io/github/last-commit/javahar79/javahar-devops-portfolio)
![Top language](https://img.shields.io/github/languages/top/javahar79/javahar-devops-portfolio)
![Languages](https://img.shields.io/github/languages/count/javahar79/javahar-devops-portfolio)
![Repo size](https://img.shields.io/github/repo-size/javahar79/javahar-devops-portfolio)

> **New here? Start at [the learning path](00_index/learning-path.md).** It walks you from first-contact to confident in a sensible order — read that before the tables below.

## Who this is for

A working DevOps engineer's quick-reference: first-contact notes, runnable snippets, and configs for Docker, Git, Kubernetes, Terraform, GitHub Actions, OpenTofu, Ansible, and Jenkins. Use it as a shelf you grab from, not a tutorial site. It deliberately does not try to replace each tool's official docs.

## What's in here

A DevOps learning portfolio across nine tool families and cross-cutting concept primers. Each tool has a primer, dated CLI walkthrough notes, runnable scripts, Dockerfiles, configs, manifests, and notebooks accumulated through hands-on practice.

## Quick links

- [Integrating CI with GitOps](docs/concepts/ci-cd-concepts/integrating-ci-with-gitops.md) — CI-to-GitOps controller flow and verification steps
- [Combining Scripting & Automation with Container Fundamentals](docs/concepts/scripting-automation/automated-build-pipeline.md) — Shell script build orchestration and idempotent CI integration
- [First kubectl command](kubernetes/scripts/2026-08-08-first-kubectl-command.sh) — First kubectl commands and node listing
- [Install Git and log my first commit](git/notes/2026-08-08-install-git-and-log-first-commit.md) — Installing Git and making the first commit
- [First Git branch and merge](git/snippets/2026-08-08-first-git-branch-and-merge.sh) — First Git branch and merge workflow

## Layout

| Directory | Contents |
|-----------|----------|
| `docker/` | Docker primer, CLI notes, install/port-map scripts, Dockerfiles, compose config, docs, notebook, templates |
| `git/` | Git primer, CLI notes, undo/stage/commit/push notes, branch/merge/revert/reflog/bisect scripts, .gitattributes config, merge-vs-rebase docs, bisect notebook |
| `github-actions/` | Actions primer, UI walkthrough, CI workflow configs, workflow debugging docs, validation & audit scripts, snippets |
| `kubernetes/` | K8s primer, kubectl notes, local cluster install script, manifests, pod/service debugging scripts and docs, snippets, notebook |
| `terraform/` | Terraform primer, install script, provider configs, local file resource configs, init & version notes, remote backend docs |
| `tf/` | Terraform state and modules interactive notebook |
| `ansible/` | Ansible primer, install and first-command notes, playbook configs |
| `of/` | OpenTofu primer and first-resource config |
| `jenkins/` | Jenkins primer, install and first-UI notes, first pipeline snippet |
| `docs/concepts/` | Cross-cutting concept primers and runnable snippets (CI/CD, Cloud Computing, Container Fundamentals, Git & version control, Infrastructure as Code, Linux fundamentals, Networking, Scripting & Automation) |
| `00_index/` | Topic index, quick links, glossary, learning path |

## Coverage

| Tool | Notes | Scripts | Configs | Dockerfiles | Manifests | Docs | Snippets | Notebooks | Templates | Last verified |
|------|-------|---------|---------|-------------|-----------|------|----------|-----------|-----------|---------------|
| Docker | 20 | 21 | 1 | 22 | 2 | 2 | — | 1 | 5 | 2026-08-06 |
| Git | 8 | 7 | 1 | — | — | 1 | 1 | 1 | — | 2026-08-08 |
| GitHub Actions | 4 | 2 | 6 | — | — | 3 | 1 | — | — | 2026-07-21 |
| Kubernetes | 5 | 5 | — | — | 4 | 3 | 1 | 1 | — | 2026-08-08 |
| Terraform | 10 | 4 | 6 | — | — | 2 | — | — | — | 2026-07-21 |
| TF | — | — | — | — | — | — | — | 2 | — | 2026-08-06 |
| Ansible | 2 | — | 1 | — | — | — | — | — | — | 2026-08-05 |
| OpenTofu | 1 | 1 | 1 | — | — | — | — | — | — | 2026-08-05 |
| Jenkins | 2 | — | — | — | — | — | 1 | — | — | 2026-08-06 |
| Cross-cutting concepts | 12 | 7 | — | — | — | — | 6 | 1 | — | 2026-08-08 |

## Status

Actively building out first-contact notes and runnable configs across all nine tools. Recent additions include CI/CD + GitOps integration docs, Scripting & Automation automated build pipeline, Git install and first-commit notes, Kubernetes kubectl exploration, and Git branch/merge snippets. Docker tagged non-root and multi-stage Dockerfiles and Terraform notes/configs remain the deepest categories.

---
_Last updated: 2026-08-09_
