---
last_verified: 2026-08-08
tool_version: n/a
---

# Install kubectl and explore the cluster

> First-day notes for installing kubectl and looking at what's running in a cluster. Personal voice, plain language.

## What is it?
kubectl is the command-line tool for talking to a Kubernetes cluster. It's my remote control — I use it to deploy applications, inspect resources, and check cluster health.

## What does it do?
It sends commands to the Kubernetes API server. I can list pods, check node status, apply manifests, and watch events. Basically anything I'd do in a web UI, I can do faster from the terminal.

## Why does it exist?
Kubernetes clusters are often remote. kubectl is the standard interface everyone uses because it's pre-installed on almost every cluster admin's machine and it works the same way regardless of which cloud provider hosts the cluster.

## Key terminology
- **Pod** — The smallest deployable unit. Example: a single running container wrapped with network and storage.
- **Node** — A worker machine (VM or physical) in the cluster. Example: `kubectl get nodes` shows all available workers.
- **Namespace** — A virtual cluster inside the real cluster. Example: `kubectl get pods -n kube-system` shows system pods.
- **Deployment** — Manages a set of identical pods. Example: `kubectl create deployment nginx --image=nginx` makes 1 replica by default.
- **Service** — A stable network endpoint for a set of pods. Example: `kubectl expose deployment nginx --port=80` creates a Service.

## A tiny example
```bash
kubectl version --client
kubectl cluster-info
kubectl get nodes
kubectl get pods --all-namespaces
```

## What I'll cover next
I want to deploy a simple application to the cluster and watch its pods come up.
