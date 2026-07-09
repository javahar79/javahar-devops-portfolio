# Glossary

## Docker

- **Container** — A lightweight, standalone, executable package that includes everything needed to run a piece of software.
- **Image** — A read-only template with instructions for creating a container. Built from a Dockerfile.
- **Dockerfile** — A text file with instructions to build a Docker image.
- **Multi-stage build** — A Dockerfile technique that uses multiple FROM statements to keep the final image small by separating build and runtime dependencies.
- **Compose** — A tool for defining and running multi-container Docker applications using a YAML file.
- **Volume / bind mount** — A mechanism to mount a host directory into a container, enabling data persistence and live-reload during development.
- **Port mapping** — The `-p host:container` syntax that maps a port on the host to a port inside the container.
- **docker init** — An interactive command that generates a Dockerfile and compose.yml by detecting your project's language and dependencies.
- **Compose watch** — A Docker Compose feature that synchronises changed files into a running container without a full rebuild, available in Compose v2.23+.
- **Layer caching** — Docker caches each build layer and only rebuilds layers whose instructions or context have changed; ordering `COPY` statements to put infrequently-changing files first improves build speed.
- **Docker network** — A virtual network that allows containers to communicate. User-defined bridge networks enable service discovery by container name.
- **dangling image** — An image with no tag (`<none>`) that remains on disk after a newer image replaces the same repository and tag.
- **docker system prune** — Removes unused data (dangling images, stopped containers, unused networks, build cache) to reclaim disk space.
- **`.dockerignore`** — A file that excludes paths from the Docker build context, keeping images small and builds fast by leaving out `.git`, `node_modules`, and other irrelevant files.
- **Pinned tag** — An explicit image tag (e.g. `python:3.11-slim`) rather than `latest`, so the base image doesn't change unexpectedly between builds.

## Git

- **Repository** — A storage location for a project's files and their revision history.
- **Commit** — A snapshot of changes in the repository at a given point in time.
- **Branch** — A movable pointer to a commit, used to isolate work on different features or fixes.
- **Remote** — A version of the repository hosted on a server (e.g. GitHub), used for collaboration.
- **git revert** — Creates a new commit that reverses the changes from a previous commit; safe for shared branches.
- **git restore --staged** — Unstages a file from the staging area without modifying the working copy.
- **git commit --amend** — Modifies the most recent commit, either to update the commit message or to include additional staged changes.

## GitHub Actions

- **Workflow** — An automated process defined in YAML that runs one or more jobs when triggered.
- **Job** — A set of steps that execute on the same runner.
- **Runner** — A server that runs workflows when they are triggered.
- **CI/CD** — Continuous Integration and Continuous Delivery, practices that automate building, testing, and deploying code.

## Kubernetes

- **Pod** — The smallest deployable unit in Kubernetes, representing one or more containers.
- **Deployment** — A resource that manages a set of identical pods and handles rolling updates.
- **Service** — An abstraction that exposes a set of pods as a network endpoint.
- **Cluster** — A set of nodes (machines) that run containerized applications managed by Kubernetes.
- **kubectl** — The command-line tool for interacting with a Kubernetes cluster.
- **kind** — A tool for running local Kubernetes clusters using Docker containers as nodes.

## Terraform

- **Infrastructure as Code (IaC)** — Managing infrastructure through configuration files rather than manual processes.
- **Provider** — A plugin that Terraform uses to interact with a cloud or service API.
- **Resource** — A block in a Terraform config that describes a piece of infrastructure.
- **HCL** — HashiCorp Configuration Language, the language used to write Terraform configurations.
