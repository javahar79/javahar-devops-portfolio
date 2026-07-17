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
- **docker compose** — The modern CLI syntax (space, not hyphen) for running Docker Compose; replaces the legacy `docker-compose` command.
- **health check** — A Docker Compose or Dockerfile instruction (`HEALTHCHECK`) that defines how to test if a container is still working; used with `depends_on: condition: service_healthy` to control startup order.
- **depends_on** — A Docker Compose key that expresses service startup and shutdown dependencies; can be configured with `condition: service_healthy` or `condition: service_started`.
- **docker scout** — A Docker CLI command that analyzes container images for CVEs and generates SBOMs; available in recent Docker Desktop and Docker Engine versions.

## Git

- **Repository** — A storage location for a project's files and their revision history.
- **Commit** — A snapshot of changes in the repository at a given point in time.
- **Branch** — A movable pointer to a commit, used to isolate work on different features or fixes.
- **Remote** — A version of the repository hosted on a server (e.g. GitHub), used for collaboration.
- **git revert** — Creates a new commit that reverses the changes from a previous commit; safe for shared branches.
- **git restore --staged** — Unstages a file from the staging area without modifying the working copy.
- **git commit --amend** — Modifies the most recent commit, either to update the commit message or to include additional staged changes.
- **merge commit** — A commit created by `git merge` that combines two branches; it has two parent commits.
- **sandbox** — An isolated directory used for safe experimentation without affecting real repositories.

## GitHub Actions

- **Workflow** — An automated process defined in YAML that runs one or more jobs when triggered.
- **Job** — A set of steps that execute on the same runner.
- **Runner** — A server that runs workflows when they are triggered.
- **CI/CD** — Continuous Integration and Continuous Delivery, practices that automate building, testing, and deploying code.
- **checkout action** — The `uses: actions/checkout@v4` step that copies the repository code into the runner so subsequent steps can access it.
- **workflow_dispatch** — An event trigger that allows manual workflow runs from the GitHub Actions UI.
- **matrix build** — A strategy that runs the same job across multiple OS/runtime combinations in a single workflow.
- **needs** — The `needs:` keyword that declares job dependencies, making one job wait for another to complete.
- **runner image** — The operating system and toolchain image used by a GitHub Actions runner (e.g. `ubuntu-latest`, `windows-latest`).
- **exit code** — A numeric code returned by a process to indicate success (0) or failure (non-zero); used in workflow logs to identify which step failed.

## Kubernetes

- **Pod** — The smallest deployable unit in Kubernetes, representing one or more containers.
- **Deployment** — A resource that manages a set of identical pods and handles rolling updates.
- **Service** — An abstraction that exposes a set of pods as a network endpoint.
- **Cluster** — A set of nodes (machines) that run containerized applications managed by Kubernetes.
- **kubectl** — The command-line tool for interacting with a Kubernetes cluster.
- **kubectl describe** — Shows detailed information about a Kubernetes resource, including events at the bottom.
- **kubectl logs** — Dumps container stdout; `--previous` shows logs from the terminated container before restart.
- **kubectl get events** — Shows cluster events in the namespace, useful for debugging scheduling failures.
- **kind** — A tool for running local Kubernetes clusters using Docker containers as nodes.
- **ReplicaSet** — A Kubernetes resource that ensures a specified number of pod replicas are running at all times; managed by a Deployment.
- **NodePort** — A Service type that exposes a port on each node's IP address, making the service accessible from outside the cluster.
- **port-forward** — A `kubectl` command that forwards a local port to a port on a pod or service, used for debugging and direct access.
- **ContainerCreating** — A pod status indicating the container image is being pulled and the container is being started.
- **CrashLoopBackOff** — A pod status indicating the container is repeatedly crashing after start; Kubernetes waits between restarts with an increasing back-off delay.
- **ImagePullBackOff** — A pod status indicating Kubernetes cannot pull the container image from the registry, usually due to a missing tag, auth failure, or network issue.

## Terraform

- **Infrastructure as Code (IaC)** — Managing infrastructure through configuration files rather than manual processes.
- **Provider** — A plugin that Terraform uses to interact with a cloud or service API.
- **Resource** — A block in a Terraform config that describes a piece of infrastructure.
- **HCL** — HashiCorp Configuration Language, the language used to write Terraform configurations.
- **init** — `terraform init` initializes a working directory by downloading required providers and modules and setting up the backend.
- **terraform version** — Displays the installed Terraform version and platform; a useful smoke test after installation.
- **plan** — `terraform plan` shows what changes Terraform will make without applying them, used to review before deployment.
- **apply** — `terraform apply` executes the changes described in the plan to create, update, or destroy resources.
- **state file** — `terraform.tfstate` records the current state of managed infrastructure; Terraform uses it to determine what to create, update, or delete.
- **.terraform.lock.hcl** — A lock file created by `terraform init` that pins provider versions so all team members and CI use the same versions.
- **backend** — The storage backend (local or remote) that Terraform uses to persist its state data; configured in the `terraform {}` block and initialized during `terraform init`.
- **required_providers** — A block within `terraform {}` that declares which provider plugins and version constraints a configuration needs before it can be initialized.

## Linux & OS Fundamentals

- **Filesystem hierarchy** — The standard directory layout (/, /home, /etc, /var) that organises system files, configs, logs, and user data.
- **Permissions (chmod/chown)** — Controls who can read, write, or execute a file; `chmod` changes mode bits, `chown` changes ownership.
- **Process** — A running instance of a program, identified by a PID and managed by the kernel.
- **Service** — A long-running background process managed by systemd, started and stopped with `systemctl`.
- **Package manager** — Tool to install and update software (e.g. `apt` on Debian, `yum` on RHEL, `brew` on macOS).
- **Environment variable** — A dynamic key-value pair that configures program behaviour; set with `export` and read as `$VAR`.
- **Shell** — The command-line interpreter that reads and runs commands (e.g. `bash`, `zsh`, `fish`).
- **Root vs regular user** — Root has unrestricted access (`uid 0`); regular users have limits. `sudo` temporarily elevates privileges.

## Networking Basics

- **IP address** — A device's unique identifier on a network, used to route packets to the correct destination.
- **Port** — A number identifying a specific service on a device (e.g. 80 for HTTP, 443 for HTTPS, 22 for SSH).
- **DNS** — Translates human-readable domain names to IP addresses so devices can find each other.
- **Firewall** — Controls which traffic is allowed or blocked, typically via rules on ports, protocols, or source/destination addresses.
- **Load balancer** — Distributes incoming traffic across multiple servers to improve availability and throughput.
- **Subnet** — A segmented portion of a larger network, identified by a CIDR prefix (e.g. `10.0.1.0/24`).
- **NAT** — Maps private IP addresses to a public one, allowing many devices to share a single public address.
- **TCP vs UDP** — TCP guarantees ordered, lossless delivery; UDP is faster but can drop packets. TCP suits SSH and HTTP; UDP suits DNS queries and streaming.

## CI/CD Concepts

- **Pipeline** — An automated sequence from commit to deploy, typically defined in a CI tool's YAML config.
- **Stage** — A grouping of related jobs (build, test, deploy) that run in sequence or parallel.
- **Job** — A single unit of work that executes on a runner; contains one or more steps.
- **Runner/Agent** — The machine or environment that executes a CI/CD job (e.g. `ubuntu-latest`).
- **Artifact** — A file produced by one step and passed downstream, such as a compiled binary or test report.
- **Trigger** — The event that starts a pipeline run, such as a `push`, `pull_request`, or scheduled cron.
- **CI vs CD** — CI (Continuous Integration) verifies code before merge with automated builds and tests; CD (Continuous Delivery/Deployment) handles releasing code to users, either manually or automatically.
