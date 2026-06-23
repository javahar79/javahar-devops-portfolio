# Glossary

## Docker

- **Container** — A lightweight, standalone, executable package that includes everything needed to run a piece of software.
- **Image** — A read-only template with instructions for creating a container. Built from a Dockerfile.
- **Dockerfile** — A text file with instructions to build a Docker image.
- **Multi-stage build** — A Dockerfile technique that uses multiple FROM statements to keep the final image small by separating build and runtime dependencies.
- **Compose** — A tool for defining and running multi-container Docker applications using a YAML file.

## Git

- **Repository** — A storage location for a project's files and their revision history.
- **Commit** — A snapshot of changes in the repository at a given point in time.
- **Branch** — A movable pointer to a commit, used to isolate work on different features or fixes.
- **Remote** — A version of the repository hosted on a server (e.g. GitHub), used for collaboration.

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
