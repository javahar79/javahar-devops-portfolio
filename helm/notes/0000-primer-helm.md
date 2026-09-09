---
last_verified: 2026-09-09
tool_version: n/a
sources: []
---

# Helm — quick primer

> First-day notes for someone who's never used Helm. Personal voice, plain language.

## What is it?

Helm is the package manager for Kubernetes. It works like apt or yum for a cluster: install pre-packaged charts with one command instead of writing every Deployment and Service YAML by hand.

## What does it do?

A chart is a templated set of Kubernetes manifests with `Chart.yaml` metadata and `values.yaml` defaults. You run `helm install`, `helm upgrade`, or `helm rollback` to manage releases, and Helm tracks every version so you can revert if needed.

## Why does it exist?

Before Helm, deploying meant copy-pasting raw YAML per environment. Rolling back meant keeping old files around. Helm removes that bookkeeping by templating the YAML, storing release history, and giving you one CLI for installs, upgrades, and rollbacks.

## Key terminology

- **Chart** — A Helm package: templates plus metadata. Example: `helm create my-app` scaffolds one.
- **Release** — A running instance of a chart. Install the same chart twice and you get two releases.
- **values.yaml** — Default configuration for a chart. Override with `--set` or a custom file.
- **Template** — Kubernetes YAML with placeholders. Helm renders it with your values before applying.
- **Repository** — A hosted collection of charts. Bitnami and the official repo are common ones.
- **Hook** — A manifest that runs at a specific release event, like before install. Handy for migrations.
- **Rollback** — Revert a release to a previous revision with `helm rollback`.

## A tiny example

```bash
helm repo add bitnami <bitnami-repo-url>
helm install my-nginx bitnami/nginx --set service.type=NodePort
```

This installs the Nginx chart with a NodePort service into the current cluster context.

## What I'll cover next

I want to build a chart from scratch — `Chart.yaml`, a `values.yaml`, and a real template. After that, I'll explore `helm upgrade`, `helm history`, and writing a hook.
