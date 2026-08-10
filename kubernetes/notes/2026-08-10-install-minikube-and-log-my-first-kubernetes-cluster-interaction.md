---
last_verified: 2026-08-10
tool_version: n/a
---

# Install minikube and log my first Kubernetes cluster interaction

> First-day notes on getting minikube running and poking at my first local cluster.

## What I did

I installed minikube and started a local single-node cluster. First I ran the install command for my platform, then `minikube start` to bring up the cluster. The first start took a couple of minutes because it pulled the base node image and initialized the container runtime inside the VM.

## What worked

Once `minikube start` finished, `kubectl get nodes` showed the single node as Ready. I created a test deployment with `kubectl create deployment hello-node --image=nginx:latest` and exposed it via NodePort. The service came up and I could reach it using `minikube service hello-node`.

## What tripped me up

The metrics-server addon wasn't enabled by default, so the dashboard showed no resource metrics until I ran `minikube addons enable metrics-server`. I also didn't expect `minikube` to show up as a container in `docker ps` when using the Docker driver — it's just how the driver works, but that wasn't obvious at first.

## What I'll try next

I want to try a StatefulSet with a PVC next and see how storage behaves on a local cluster.
