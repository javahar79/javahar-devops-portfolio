---
last_verified: 2026-08-23
tool_version: "3.5.1"
sources:
  - https://argo-cd.readthedocs.io/en/stable/getting_started/
  - https://github.com/argoproj/argo-cd/releases/tag/v3.5.1
---

# ArgoCD — quick primer

> First-day notes for someone who's never used ArgoCD. Personal voice, plain language.

## What is it?

ArgoCD is a GitOps continuous delivery tool for Kubernetes. It watches a Git repository and keeps the state of your cluster in sync with whatever is committed there. If someone edits a YAML manifest in Git, ArgoCD notices and applies the change to the cluster. If someone manually changes something in the cluster, ArgoCD flags it as out of sync and can roll it back. I think of it as a bridge between "what Git says should exist" and "what the cluster actually has running."

## What does it do?

ArgoCD pulls Kubernetes manifests from a Git repo, compares them against the live cluster state, and either reports drift or automatically syncs. It gives you a web UI to see every application, its sync status, and its health. It also provides a CLI for scripting the same operations. The core loop is: Git is the source of truth, ArgoCD is the enforcer.

## Why does it exist?

Before ArgoCD, teams pushed images to a registry and then ran `kubectl apply` from a laptop or a CI server to deploy. That workflow has a few painful gaps: you don't always know what version is deployed, manual `kubectl` changes are invisible, and rolling back means remembering which commit to revert. ArgoCD solves this by making Git the single source of truth and continuously reconciling cluster state with it. Platform engineers use it because it gives them auditability and automated rollback without custom scripts.

## Key terminology

- **Application** — A logical unit that maps a Git repo (or a path within it) to a cluster namespace. Example: an `app-of-apps` Application that points at a directory containing all other Applications.
- **Sync** — The act of making the cluster match what Git says. Example: `argocd app sync my-app` pushes the live state to match the committed manifests.
- **OutOfSync** — ArgoCD's flag when the cluster state doesn't match Git. Example: someone ran `kubectl edit deployment` and changed a replica count — ArgoCD shows it as OutOfSync.
- **Health** — Whether the resources ArgoCD manages are actually running. A Deployment can be synced but still unhealthy if pods are crash-looping.
- **Project** — A logical grouping that restricts which repos, clusters, and namespaces an Application can target. Example: a `dev` project that only allows deploying to the `dev` namespace.
- **Server-side apply** — The `--server-side --force-conflicts` flag needed when applying large CRDs that exceed the client-side annotation size limit. Example: `kubectl apply -n argocd --server-side --force-conflicts -f install.yaml`.

## A tiny example

```bash
kubectl create namespace argocd
kubectl apply -n argocd --server-side --force-conflicts \
  -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

This installs ArgoCD into the `argocd` namespace. The `--server-side --force-conflicts` flag is mandatory — without it, the large CRDs silently fail to apply.

```bash
kubectl port-forward svc/argocd-server -n argocd 8080:443
```

ArgoCD isn't exposed outside the cluster by default, so I port-forward to reach the UI at `https://localhost:8080`.

## What I'll cover next

After this primer I want to install ArgoCD for real and log into the admin UI. I also want to deploy a sample app from a Git repo and see the sync cycle in action — watching a commit propagate to the cluster.
