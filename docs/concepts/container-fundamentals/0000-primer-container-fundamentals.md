---
last_verified: 2026-07-22
tool_version: n/a
---

# Container Fundamentals — quick primer

> First-day notes on Containers. What they are, why they matter, and the key ideas to know.

## What is it?

A container bundles an application with its runtime and dependencies into a lightweight, portable package. The app behaves the same whether it's on my laptop, a teammate's machine, or a remote server. Containers share the host kernel via Linux namespaces and cgroups, so they start faster and use fewer resources than virtual machines.

## Why does it matter for DevOps?

"It works on my machine" disappears. If it runs in a container on my dev box, it runs the same way in CI, staging, and prod. Deployments become atomic — I ship an image, not a zip of files with manual steps.

## Key terminology

- **Image** — A read-only template for creating a container. Built from a Dockerfile, stored in a registry.
- **Container** — A runnable instance of an image. I can start, stop, move, or delete it.
- **Dockerfile** — A text file of instructions that builds an image. Each line is a layer.
- **Registry** — A server that stores images. `docker pull` downloads; `docker push` uploads.
- **Volume** — Persistent storage that survives container restarts. Without volumes, data written inside a container vanishes when the container stops.

## A concrete example

```bash
docker run --rm python:3.11-slim python -c "print('hello from a container')"
```

This pulls the `python:3.11-slim` image, starts a container, runs the command, prints output, and removes the container (`--rm`). No Python installation needed on the host.

## How this connects to what's next

Containers are the prerequisite for Docker (build and run), Kubernetes (orchestrate at scale), and Trivy (vulnerability scanning). Understanding images and volumes now makes the orchestration layer easier later.
