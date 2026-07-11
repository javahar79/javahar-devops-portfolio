---
last_verified: 2026-07-10
tool_version: n/a
---

# Kubernetes quickstart — what tripped me up

I followed the official Kubernetes quickstart and here's what I ran into.

## The setup

I already had kind installed from a previous session. Started a cluster with `kind create cluster` and waited for the control plane to be ready.

First command from the quickstart: `kubectl get nodes`. Worked immediately — showed one node (the kind container).

## Where it broke

### 1. `kubectl run` vs `kubectl create deployment`

The quickstart shows `kubectl create deployment kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1` to create a pod. I tried `kubectl run kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1` instead — that also worked but creates a standalone pod, not a deployment with a ReplicaSet behind it. Took me a minute to realize `run` and `create deployment` are different. The pod from `run` won't self-heal if deleted; the deployment will recreate its pod.

### 2. Pods show `ContainerCreating` for a long time

After creating the deployment, `kubectl get pods` showed `ContainerCreating` for about 30 seconds. I thought something was wrong. Turns out kind has to pull the image first, and on a single-node cluster that takes a while on the first run. The quickstart should mention this delay so beginners don't panic.

### 3. `kubectl expose` didn't work the way I expected

I ran `kubectl expose deployment kubernetes-bootcamp --type=NodePort --port=8080`. The service got created but I couldn't reach it at `localhost:8080`. I had to use `kubectl port-forward service/kubernetes-bootcamp 8080:8080` to access it. In kind, services of type NodePort aren't accessible on localhost unless you set up extra port mappings in the kind config. The quickstart assumes minikube which handles this transparently.

### 4. Probes and readiness

The quickstart mentions liveness and readiness probes in passing. I skipped them initially and the pod showed as `Running` even though the app inside was returning 500s. Adding a simple readiness probe made the pod stay `NotReady` until the app was actually serving traffic.

## What I'd try next

- Write a proper YAML manifest instead of using only CLI commands — `kubectl apply -f` feels more repeatable
- Try scaling with `kubectl scale deployment` and see how new pods come up
- Test what happens when I delete a pod from a deployment — confirm it recreates
