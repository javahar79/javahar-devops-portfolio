---
last_verified: 2026-07-19
tool_version: n/a
---

# Kubernetes quickstart — what tripped me up

I went through the Kubernetes.io quickstart with kind on my laptop. Here's where I got stuck and what I'd do differently.

## The setup

Already had kind installed from a previous session. `kind create cluster` worked — one control-plane node running in Docker. `kubectl get nodes` showed the node as `Ready`.

So far so good.

## Where I got stuck

### Creating the first deployment

The quickstart uses `kubectl create deployment hello-node --image=registry.k8s.io/e2e-test-images/agnhost:2.39 -- /agnhost serve-hostname`. I typed it verbatim and the image pulled but the pod stayed `Init:0/1` for almost a minute. Turned out the agnhost image is larger than I expected and kind was still downloading it on a single-node cluster.

On my second attempt I used `--image=nginx:alpine` which is much smaller — pods were `Running` in under 10 seconds.

### Services and port access

The quickstart shows `kubectl expose deployment hello-node --type=LoadBalancer --port=8080`. I ran it, `kubectl get svc` showed `pending` for the external IP. On kind, LoadBalancer doesn't work without MetalLB or port mappings in the kind config. I switched to `--type=NodePort` and used `kubectl port-forward svc/hello-node 8080:8080` to reach it from my browser.

The quickstart doesn't mention that kind needs extra setup for LoadBalancer — it assumes minikube or a cloud cluster.

### Labels matter more than I thought

I created a second deployment and accidentally gave it the same app label as the first. The Service started routing to both. `kubectl describe svc` showed endpoints from both deployments. I had to delete and recreate with unique labels.

## What I'd try next

- Write manifests in YAML instead of using only CLI commands — more repeatable
- Test `kubectl scale` and watch pods come up
- Delete a pod from a deployment and confirm it recreates automatically
