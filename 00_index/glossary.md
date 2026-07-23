# Glossary

## Cloud Computing Fundamentals

- **IaaS** — Infrastructure as a Service; raw compute, storage, and networking rented from a provider. I manage the OS and app stack (e.g. AWS EC2, GCP Compute Engine).
- **PaaS** — Platform as a Service; the provider manages the OS and runtime, and I only deploy code (e.g. Heroku, AWS Elastic Beanstalk).
- **SaaS** — Software as a Service; fully managed application accessed over the web (e.g. Gmail, GitHub, Slack).
- **Region** — A geographic area with multiple data centres that a cloud provider exposes as a deployable parameter (e.g. `us-east-1`, `eu-west-1`). Latency and compliance rules usually dictate which region to pick.
- **Multi-cloud** — Using more than one cloud provider to avoid vendor lock-in or to pick the best service from each.

## Container Fundamentals

- **Image** — A read-only template for creating a container. Built from a Dockerfile, stored in a registry.
- **Container** — A runnable instance of an image. I can start, stop, move, or delete it.
- **Dockerfile** — A text file of instructions that builds an image. Each line is a layer.
- **Registry** — A server that stores and serves container images. `docker pull` downloads from a registry; `docker push` uploads to one. Example: Docker Hub, ACR, ECR.
- **Volume** — Persistent storage that survives container restarts. Without volumes, data written inside a container vanishes when the container stops.
- **Multi-stage build** — A Dockerfile technique that uses multiple FROM statements to keep the final image small by separating build and runtime dependencies.
- **Port mapping** — The `-p host:container` syntax that maps a port on the host to a port inside the container.
- **docker init** — An interactive command that generates a Dockerfile and compose.yml by detecting your project's language and dependencies.
- **Layer caching** — Docker caches each build layer and only rebuilds layers whose instructions or context have changed; ordering COPY statements to put infrequently-changing files first improves build speed.
- **Docker network** — A virtual network that allows containers to communicate. User-defined bridge networks enable service discovery by container name.
- **dangling image** — An image with no tag (`<none>`) that remains on disk after a newer image replaces the same repository and tag.
- **docker system prune** — Removes unused data (dangling images, stopped containers, unused networks, build cache) to reclaim disk space.
- **docker compose** — The modern CLI syntax (space, not hyphen) for running Docker Compose; replaces the legacy `docker-compose` command.
- **health check** — A Docker Compose or Dockerfile instruction (`HEALTHCHECK`) that defines how to test if a container is still working; used with `depends_on: condition: service_healthy` to control startup order.
- **depends_on** — A Docker Compose key that expresses service startup and shutdown dependencies; can be configured with `condition: service_healthy` or `condition: service_started`.
- **docker scout** — A Docker CLI command that analyzes container images for CVEs and generates SBOMs; available in recent Docker Desktop and Docker Engine versions.
- **Compose** — A tool for defining and running multi-container Docker applications using a YAML file.
- **Volume / bind mount** — A mechanism to mount a host directory into a container, enabling data persistence and live-reload during development.
- **Compose watch** — A Docker Compose feature that synchronises changed files into a running container without a full rebuild, available in Compose v2.23+.

## CI/CD

- **Pipeline** — An automated sequence of stages from commit to deploy. Example: a GitHub Actions workflow triggered on every push.
- **Trigger** — The event that starts a pipeline: a `push` to a branch, a `pull_request`, or a scheduled cron.
- **Runner/Agent** — The machine that executes a pipeline's jobs. Example: the `ubuntu-latest` hosted runner on GitHub Actions.
- **DORA metrics** — Deployment frequency, lead time for changes, change failure rate, and MTTR; used to gauge how healthy a team's CI/CD practice is.
- **Blue-green / canary** — Deployment strategies that reduce risk by shifting traffic gradually (canary) or switching between two identical environments (blue-green).

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
- **git reflog** — A Git command that shows a log of where HEAD and branch references have pointed, useful for recovering lost commits after rebase or reset.
- **interactive rebase** — `git rebase -i` lets you squash, reorder, or edit commits before they are applied onto another branch.
- **.gitignore** — A file that tells Git which files or patterns to ignore when tracking changes in a repository.

## GitHub Actions

- **Workflow** — An automated process defined in YAML that runs one or more jobs when triggered.
- **Job** — A set of steps that execute on the same runner.
- **Runner** — A server that runs workflows when they are triggered.
- **checkout action** — The `uses: actions/checkout@v4` step that copies the repository code into the runner so subsequent steps can access it.
- **workflow_dispatch** — An event trigger that allows manual workflow runs from the GitHub Actions UI.
- **matrix build** — A strategy that runs the same job across multiple OS/runtime combinations in a single workflow.
- **needs** — The `needs:` keyword that declares job dependencies, making one job wait for another to complete.
- **runner image** — The operating system and toolchain image used by a GitHub Actions runner (e.g. `ubuntu-latest`, `windows-latest`).
- **exit code** — A numeric code returned by a process to indicate success (0) or failure (non-zero); used in workflow logs to identify which step failed.
- **gh CLI** — The GitHub CLI tool that lets you interact with GitHub from the command line, including triggering and validating workflows.
- **run-name** — A workflow-level key that sets a custom name for a workflow run, often using expressions like `${{ github.event_name }}`.

## Infrastructure as Code

- **Declarative vs imperative** — Declarative says "I want three load balancers" and the tool figures out how. Imperative says "run this script then that script." Terraform HCL is declarative.
- **Idempotent** — Running the same config twice produces the same result. If the resource exists, the tool skips it.
- **State** — A snapshot of current infrastructure. Terraform compares your config against state to decide what to create, update, or delete.
- **Drift** — A manual change outside IaC (e.g. resizing an instance in the console). Tools detect and reconcile it.
- **Module** — A reusable group of resources I define once and reference in multiple projects.

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

## Linux OS Fundamentals

- **Filesystem hierarchy** — The standard `/` tree layout (e.g. `/etc`, `/var`, `/home`) that organises files and configuration on a Linux system.
- **Process** — A running instance of a program, identified by a PID, that the kernel schedules and tracks.
- **Permissions** — The read/write/execute bits (and owner/group) that control who can access a file or directory.
- **Package manager** — A tool (`apt`, `dnf`, `apk`) that installs, upgrades, and removes software and its dependencies.

## Networking Basics

- **IP address** — A numeric label that identifies a host on a network (IPv4 or IPv6).
- **Port** — A numbered endpoint (0–65535) on a host that a service listens on, used alongside an IP to route traffic to the right process.
- **DNS** — The Domain Name System that maps human-readable hostnames to IP addresses.
- **CIDR** — Classless Inter-Domain Routing notation (e.g. `10.0.0.0/24`) that expresses an IP range and its subnet mask.
- **NAT** — Network Address Translation, which maps private internal addresses to a public one so hosts can share an outbound connection.

## Scripting & Automation

- **Script** — A short program written in a scripting language like Bash or Python, used to automate repetitive tasks.
- **Shell** — The command-line interpreter that executes scripts (e.g. `bash` or `zsh`).
- **Cron** — A scheduler that runs scripts at fixed times or intervals.
- **Idempotency** — Running the same script or command multiple times produces the same result without side effects.
- **Conditional** — A control structure that runs different code based on a test (e.g. `if`, `case`).

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
- **remote backend** — A backend that stores state in a remote service (like S3) instead of locally, enabling team collaboration on the same state.
- **workspace** — A Terraform feature that lets you manage multiple state files within a single backend by creating isolated environments.
- **DynamoDB locking** — A DynamoDB table used as a distributed lock for Terraform state, preventing concurrent `apply` runs from corrupting state.
- **S3 versioning** — Versioning enabled on an S3 bucket used as a Terraform backend, allowing recovery from accidental state-file deletions.
