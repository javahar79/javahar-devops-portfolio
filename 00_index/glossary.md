# Glossary

## Cloud Computing Fundamentals

- **IaaS** — Infrastructure as a Service; raw compute, storage, and networking rented from a provider. I manage the OS and app stack (e.g. AWS EC2, GCP Compute Engine).
- **PaaS** — Platform as a Service; the provider manages the OS and runtime, and I only deploy code (e.g. Heroku, AWS Elastic Beanstalk).
- **SaaS** — Software as a Service; fully managed application accessed over the web (e.g. Gmail, GitHub, Slack).
- **Region** — A geographic area with multiple data centres that a cloud provider exposes as a deployable parameter (e.g. `us-east-1`, `eu-west-1`). Latency and compliance rules usually dictate which region to pick.
- **Multi-cloud** — Using more than one cloud provider to avoid vendor lock-in.

## CI/CD

- **Pipeline** — An automated sequence of stages from commit to deploy. Example: a GitHub Actions workflow triggered on every push.
- **Trigger** — The event that starts a pipeline: a `push` to a branch, a `pull_request`, or a scheduled cron.
- **Runner/Agent** — The machine that executes a pipeline's jobs. Example: the `ubuntu-latest` hosted runner on GitHub Actions.
- **DORA metrics** — Deployment frequency, lead time for changes, change failure rate, and MTTR; used to gauge how healthy a team's CI/CD practice is.
- **Blue-green / canary** — Deployment strategies that reduce risk by shifting traffic gradually (canary) or switching between two identical environments (blue-green).
- **red-black deployment** — A deployment strategy that keeps two full environments running and switches traffic between them for instant rollback (a cloud-flavoured variant of blue-green).
- **GitOps** — A declarative operational model where the desired cluster state is stored in Git and a controller (e.g. ArgoCD, Flux) continuously reconciles the cluster toward that state.
- **Observability** — The ability to understand a system's internal state from its outputs — metrics, logs, and traces. The three pillars used to debug live systems.
- **Approval gate** — A CI/CD stage that requires manual review before proceeding, typically used for production deployments.
- **Rollback** — Reverting a deployment to a previous known-good version after detecting a failure in the current release.
- **Blast radius** — The scope of impact if a change fails; in pipeline design, minimising blast radius means isolating infrastructure changes from application changes so one does not block or break the other.
- **state-aware pipeline** — A pipeline design that treats infrastructure changes and application changes as separate lifecycles, applying plan/approve/apply to IaC and rolling updates to apps so one does not block the other.
- **environment-as-code consistency** — The pattern of rendering every environment (dev/stage/prod) from the same IaC template so a promotion is "run the same apply against a different backend" rather than rebuilding prod by hand.

## Container Fundamentals

- **Container** — A runnable instance of an image. I can start, stop, move, or delete it.
- **Image** — A packaged application with its dependencies, code, and runtime. Built from a Dockerfile and stored in a registry.
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
- **BuildKit** — Docker's modern build engine that supports cache mounts, parallel builds, and secrets injection; enabled with `DOCKER_BUILDKIT=1`.
- **health check** — A Docker Compose or Dockerfile instruction (`HEALTHCHECK`) that defines how to test if a container is still working; used with `depends_on: condition: service_healthy` to control startup order.
- **depends_on** — A Docker Compose key that expresses service startup and shutdown dependencies; can be configured with `condition: service_healthy` or `condition: service_started`.
- **docker scout** — A Docker CLI command that analyzes container images for CVEs and generates SBOMs; available in recent Docker Desktop and Docker Engine versions.
- **daemon.json** — Docker Engine's configuration file (default `/etc/docker/daemon.json`). Options like `log-driver`/`log-opts` (rotation size and file count), `max-concurrent-downloads`, and `default-ulimits` are set here and take effect when the daemon restarts.
- **official apt repo** — Docker's own Debian/Ubuntu package repository (installs `docker-ce`, `docker-ce-cli`, `containerd.io`), as opposed to the distro's older `docker.io` package. Setup means adding Docker's GPG key under `/etc/apt/keyrings` and a `deb` line for your release codename.
- **Compose** — A tool for defining and running multi-container Docker applications using a YAML file.
- **Volume / bind mount** — A mechanism to mount a host directory into a container, enabling data persistence and live-reload during development.
- **Compose watch** — A Docker Compose feature that synchronises changed files into a running container without a full rebuild, available in Compose v2.23+.
- **Distroless image** — A Docker image that strips everything except the app binary and its runtime libraries; no shell, package manager, or standard utilities. Reduces attack surface at the cost of debuggability.
- **Alpine-based image** — A Docker image built on Alpine Linux; small footprint (~5 MB) but uses musl libc instead of glibc, which can cause compatibility issues with some binaries.
- **Smoke test** — A minimal validation that the app is alive and responding after deploy. Catches obvious breakage before running the full test suite.
- **detached mode** — `docker compose up -d` runs containers in the background and returns control to the shell; useful for CI and long-running stacks.
- **BuildKit secret** — A `--secret` mount passed at build time that injects sensitive data into a specific build stage without baking it into any image layer; the secret never appears in `docker history` or the final image.
- **sidecar** — A companion container (logger shipper, metrics exporter, config reloader) that rides alongside the main container and shares its lifecycle, keeping auxiliary concerns out of the application image.
- **service discovery** — Containers resolving each other by stable name rather than IP, so moving or scaling a container does not break its callers; the same idea orchestrators automate at cluster scale.

## Git

- **Repository** — A storage location for a project's files and their revision history.
- **Commit** — A snapshot of changes in the repository at a given point in time.
- **Branch** — A movable pointer to a commit, used to isolate work on different features or fixes.
- **Remote** — A version of the repository hosted on a server (e.g. GitHub), used for collaboration.
- **Clone** — Copying a remote repository to my local machine so I can work on it. Example: `git clone https://github.com/org/repo.git`.
- **Pull** — Fetching changes from a remote and merging them into my local branch. Example: `git pull origin main` before starting new work.
- **Push** — Sending my local commits to a remote repository. Example: `git push origin feature/add-auth`.
- **Staging area** — A place to prepare changes before committing them. Example: `git add file.txt` stages it for the next commit.
- **Merge** — Combining changes from one branch into another. Example: merging `feature/add-auth` into `main` after review.
- **Conflict** — When two people change the same part of a file and Git can't auto-merge. Example: I edit line 10 while a teammate deletes it.
- **git revert** — Creates a new commit that reverses the changes from a previous commit; safe for shared branches.
- **git restore --staged** — Unstages a file from the staging area without modifying the working copy.
- **git commit --amend** — Modifies the most recent commit, either to update the commit message or to include additional staged changes.
- **merge commit** — A commit created by `git merge` that combines two branches; it has two parent commits.
- **sandbox** — An isolated directory used for safe experimentation without affecting real repositories.
- **git reflog** — A Git command that shows a log of where HEAD and branch references have pointed, useful for recovering lost commits after rebase or reset.
- **interactive rebase** — `git rebase -i` lets you squash, reorder, or edit commits before they are applied onto another branch.
- **git reset --soft** — Moves HEAD to the given ref and leaves all changes staged; preserves the working diff while undoing commits.
- **git reset --mixed** — Moves HEAD to the given ref and unstages changes but keeps them in the working tree; the default `git reset` behaviour.
- **.gitignore** — A file that tells Git which files or patterns to ignore when tracking changes in a repository.
- **git bisect** — A Git command that performs a binary search through commit history to find the first commit that introduced a bug. Given a test script, `git bisect run` automates the process.
- **git rebase** — A Git command that replays commits from one branch on top of another, producing a linear history. Unlike merge, it rewrites commit hashes, so it should only be used on private branches.
- **git push --force-with-lease** — A safer force-push that only overwrites the remote if no one else has pushed since you last fetched, preventing accidental loss of others' work.
- **.gitattributes** — A file that controls Git's handling of text conversion, merge strategies, and diff rendering for specific file types.
- **trunk-based development** — A branch strategy where everyone works on short-lived feature branches and merges straight to a single long-lived trunk (`main`). The trunk is kept releasable at all times, so CI runs on every merge and a broken build blocks the line immediately.
- **GitFlow** — A heavier branch model with long-lived `develop` and `release/*` branches on top of `main`. Feature branches feed `develop`, a `release/x.y.z` branch stabilizes a version before merging to both `main` and `develop`, and hotfixes skip straight in. Each branch type gets its own CI trigger and validation.
- **hotfix** — In GitFlow, a short-lived branch cut directly from `main`/production to fix a release-blocker quickly, skipping the normal feature-branch flow.
- **annotated tag** — `git tag -a` creates a tag with a message, author, and date, so `git describe` and release workflows can treat it as an attributable release point (vs a lightweight tag that is just a pointer).
- **worktree** — A separate working directory linked to the same repository, letting several branches be checked out at once without stashing and switching. `git worktree add` creates one; each branch can be checked out in only one worktree at a time.
- **cherry-pick** — A Git command that replays the changes from an existing commit (or a range) onto the current branch as a brand-new commit. It copies the change without recording a branch relationship, making it the standard way to port a single fix from `main` onto a release branch.
- **git cherry-pick --continue / --abort** — After resolving a conflicted cherry-pick, `--continue` records the resolved pick; `--abort` discards it and returns to the pre-pick state.
- **pre-commit hook** — A client-side script in `.git/hooks/pre-commit` that Git runs before recording a commit. If it exits non-zero the commit is blocked, so it can reject commits on protected branches or enforce branch-naming conventions before anything reaches the remote.
- **sparse-checkout** — A Git feature that limits the working tree to a subset of paths, so you only check out the directories you need in a large monorepo. Enabled with `git sparse-checkout set <paths>` or via `core.sparseCheckout` in `.gitconfig`.
- **partial clone** — A Git clone mode (`--filter=blob:none` or similar) that omits file contents from the initial download, fetching blobs on demand when checked out. Reduces clone size and time for large repositories.
- **conditional includes** — A Git config feature (`[includeIf "gitdir:..."]`) that automatically loads path-specific settings based on the repository location. Useful for applying different identities, hooks, or merge tools per project without manual `git config` swaps.
- **feature branch** — A short-lived branch cut from the main line to hold one discrete piece of work (a feature or fix). It is merged back, usually through a pull request, and deleted once the work lands.
- **upstream** — In a fork workflow, the remote that a fork was created from. Adding it (`git remote add upstream <url>`) lets you fast-forward your fork so it matches the original repository.
- **git branch prune** — Removing stale branch references: `git remote prune origin` drops remote-tracking refs for branches deleted on the remote, and `git branch -d` deletes local branches whose work is already merged into the base branch.

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
- **approval gate** — A workflow job that targets a GitHub `environment:` with required reviewers; the job stays pending until a reviewer clicks Approve in the UI, creating a manual gate before production deploy.
- **reusable workflow** — A GitHub Actions workflow defined in a separate repository or the same repository that can be called from another workflow using `uses:`. Inputs and outputs can be passed between the calling and called workflows, enabling modular pipeline composition.

## Infrastructure as Code

- **Declarative vs imperative** — Declarative says "I want three load balancers" and the tool figures out how. Imperative says "run this script then that script." Terraform HCL is declarative.
- **structural parity** — A drift check that every environment (dev/stage/prod) declares the same set of components, so the diff between environments is configuration-only and never structural.
- **Idempotent** — Running the same config twice produces the same result. If the resource exists, the tool skips it.
- **State** — A snapshot of current infrastructure. Terraform compares your config against state to decide what to create, update, or delete.
- **Drift** — A manual change outside IaC (e.g. resizing an instance in the console). Tools detect and reconcile it.
- **Module** — A reusable group of resources I define once and reference in multiple projects.
- **locals** — A Terraform block that defines values computed from other variables or expressions, used to avoid repetition across resources.
- **terraform.tfvars** — A file that stores variable values for a Terraform configuration, used to separate secrets and environment-specific values from the main configuration.
- **path.module** — A Terraform expression that returns the filesystem path of the module where the variable is declared; useful for constructing file paths relative to the current module.
- **Docker provider** — The Terraform `docker` provider that manages containers, images, networks, and volumes as first-class resources, so their lifecycle lives in Terraform state (`terraform apply`/`destroy`) instead of ad-hoc CLI commands.

## Ansible

- **Playbook** — A YAML file that defines a set of tasks to run on target machines. Example: `ansible-playbook site.yml` runs all the steps in that file.
- **Play** — A single section of a playbook that targets one group of hosts and applies a set of tasks to them.
- **Task** — The smallest unit of work in a playbook. Each task calls an Ansible module to do one thing, like install a package or start a service.
- **Module** — A reusable unit of code that Ansible calls to perform an action. Example: the `apt` module installs packages on Debian systems.
- **Inventory** — A list of the machines Ansible manages, grouped however I want. Example: I can group servers by role like `webservers` or `databases`.
- **Handler** — A special task that only runs when another task notifies it, usually to restart a service after a configuration change.

## Jenkins

- **Jenkinsfile** — A text file that defines a Jenkins pipeline as code, typically checked into the repository alongside the application code.
- **JVM** — Java Virtual Machine; Jenkins runs on the JVM, so a Java runtime is required before Jenkins can be installed and started.
- **Stage** — A logical grouping of steps within a Jenkins pipeline, representing a phase such as build, test, or deploy.
- **Job** — A single unit of work Jenkins runs. Example: a Jenkins job that runs `npm test` on every push.

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
- **ConfigMap** — A Kubernetes object that stores non-sensitive configuration data as key-value pairs, which can be consumed as environment variables or mounted as files in pods.
- **Secret** — A Kubernetes object that stores sensitive data (passwords, tokens, certificates) as base64-encoded key-value pairs, with tighter access controls than ConfigMaps.
- **StatefulSet** — A Kubernetes workload resource for managing stateful applications, providing stable network identities, ordered deployment, and persistent storage via volumeClaimTemplates.
- **PersistentVolumeClaim (PVC)** — A request for storage by a pod, specifying access mode and capacity; Kubernetes binds it to a suitable PersistentVolume.
- **RollingUpdate** — A Kubernetes Deployment strategy that replaces old pods with new ones incrementally, ensuring availability during updates.
- **readiness probe** — A Kubernetes container probe that signals when a pod is ready to serve traffic; until it passes, the pod is not added to the service's endpoints.
- **kubectl rollout** — A kubectl subcommand for managing and inspecting Deployment rollouts, including restart, status, history, and undo.
- **PodDisruptionBudget (PDB)** — A Kubernetes policy object that limits how many pods can be voluntarily evicted at once during node maintenance, ensuring a minimum number of available replicas for critical workloads.

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
- **getent hosts** — A command that resolves a hostname through the system resolver (`/etc/hosts` and DNS in `nsswitch.conf` order), the same lookup path most CLI tools take.
- **dig +short** — A terse DNS query that prints just the answers; `dig -x <ip>` does a reverse lookup to find what name sits behind an IP (useful for spotting a proxy or CDN).
- **ss** — A socket-status utility that lists what is listening and connected on a host (`ss -tlnp` shows listening TCP ports plus the owning process). The modern replacement for `netstat -a`, and the go-to first check when a port "should" be open but nothing connects.

## OpenTofu

- **OpenTofu** — An open-source Terraform-compatible infrastructure as code tool. Same HCL syntax and provider ecosystem, maintained by the community.
- **Resource** — A block in an OpenTofu config that describes a piece of infrastructure.
- **Provider** — A plugin that OpenTofu uses to interact with a cloud or service API.

## Scripting & Automation

- **Script** — A short program written in a scripting language like Bash or Python, used to automate repetitive tasks.
- **Shell** — The command-line interpreter that executes scripts (e.g. `bash` or `zsh`).
- **Cron** — A scheduler that runs scripts at fixed times or intervals.
- **Idempotency** — Running the same script or command multiple times produces the same result without side effects.
- **Conditional** — A control structure that runs different code based on a test (e.g. `if`, `case`).

## Pulumi

- **Pulumi** — An Infrastructure as Code tool that provisions cloud resources using a real programming language (Python, TypeScript, Go, YAML) instead of a dedicated config language like HCL.
- **Stack** — A named deployment target in Pulumi, such as "dev" or "prod"; each stack has its own config and state. Example: `pulumi stack init dev`.
- **Program** — The code (in a real language) that describes the resources you want, e.g. an S3 bucket or a Kubernetes namespace.
- **Config** — Key-value settings per stack that let the same program behave differently across environments without code changes.
- **pulumi up** — The command that computes a diff against state and provisions the changes described by the program.

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
- **Variable** — A placeholder value in a Terraform or OpenTofu configuration that can be set differently per environment, allowing the same config to work across dev, staging, and production.
- **Output** — A block in a Terraform or OpenTofu configuration that exposes a computed value after apply, such as a resource ID or endpoint URL.

## Trivy

- **Vulnerability** — A weakness in software that an attacker can exploit, such as an outdated OpenSSL package with a known remote-code-execution flaw. Trivy detects vulnerabilities by comparing installed packages against a database of known CVEs.
- **Misconfiguration** — A setting that weakens security without involving a code bug, such as a container that mounts the host filesystem read-write. Trivy flags misconfigurations in Dockerfiles and Kubernetes manifests.
- **SBOM** — Software Bill of Materials, a complete inventory of every component inside an image. Trivy can generate an SBOM so compliance teams know exactly what shipped in a build.
- **Severity** — The risk level assigned to a Trivy finding, typically CRITICAL, HIGH, MEDIUM, LOW, or UNKNOWN. Filtering by severity (e.g. `--severity HIGH,CRITICAL`) keeps scan output actionable.
- **Scanner** — A tool that inspects software artifacts for security issues. Trivy is an open-source scanner by Aqua Security that checks container images, filesystems, and Git repositories against vulnerability databases.
