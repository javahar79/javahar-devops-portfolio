# Kubernetes — quick primer

> First-day notes for someone who's never used Kubernetes. Personal voice, plain language.

## What is it?

Kubernetes (often shortened to K8s) is a platform for running and managing containers across multiple machines. If Docker is the tool that packages an app into a container, Kubernetes is the tool that decides which machine that container runs on, restarts it if it crashes, and scales it up when traffic spikes. It's like having a robot sysadmin for your containers.

## What does it do?

It lets me describe what my application should look like — "run 3 copies of my web server, expose it on port 80, and make sure they're always running" — and Kubernetes makes that happen across a cluster of machines. It handles deployment, scaling, networking, and self-healing automatically.

## Why does it exist?

Running containers with Docker on a single machine is fine for learning and small projects. But when I run containers across multiple machines, containers fail, traffic goes up and down, and I need to roll out updates without downtime. Before Kubernetes, teams built their own scripts to handle all that — and every team's scripts were different and fragile. Kubernetes provides a standard way to do it that works across any cloud or on-prem.

## Key terminology

- **Cluster** — A set of machines (nodes) that Kubernetes manages together. One is the control plane, the rest are workers. Example: a local minikube cluster with one node.
- **Pod** — The smallest unit Kubernetes runs. It wraps one or more containers. Example: a pod running an Nginx container.
- **Deployment** — Describes the desired state for a set of identical pods (how many replicas, which image to use). Kubernetes keeps it that way. Example: `kubectl create deployment myapp --image=nginx` creates a deployment with one pod running Nginx.
- **Service** — A stable network endpoint that points to one or more pods, even as pods come and go. Example: a Service of type LoadBalancer that exposes my web app on a fixed IP.
- **kubectl** — The CLI tool that talks to the Kubernetes API. It's how I send commands to my cluster. Example: `kubectl get pods` lists all pods.
- **Node** — A machine in the cluster (physical or virtual). Each node runs pods. Example: a worker VM in a cloud cluster.
- **Control Plane** — The brain of the cluster. Runs the API server, scheduler, and other components that manage the cluster. Example: in minikube, the control plane is on the same machine.

## A tiny example

```bash
minikube start
kubectl run hello-k8s --image=nginx --port=80
kubectl expose pod hello-k8s --type=NodePort --port=80
minikube service hello-k8s
```

This starts a local cluster, runs an Nginx pod, exposes it as a service, and opens the service in my browser.

## What I'll cover next

Now that I understand what Kubernetes is and the core vocabulary, I want to install a local cluster with minikube or kind, explore the kubectl CLI to see what commands are available, and then try deploying a real application.
