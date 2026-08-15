---
last_verified: 2026-08-14
tool_version: "n/a"
---

# Docker + Terraform integration patterns for infrastructure provisioning

## Purpose

This note covers three practical ways to combine Docker and Terraform when the goal is to provision infrastructure consistently. Terraform manages the desired state of resources; Docker packages the software that runs on those resources. The integration points are where the two tools hand off to each other.

## When to use

- You want Terraform to create the host or network and then start containers on it without manual follow-up steps.
- You need Docker images built and pushed as part of the same workflow that provisions the infrastructure to run them.
- You are exploring a single-tool way to describe both infrastructure and container configuration in one state file.

## Prerequisites

- Terraform installed and a working cloud or local provider configured.
- Docker Engine running on the target host (local or remote).
- Basic familiarity with Terraform resource blocks and Dockerfile syntax.

## Pattern 1: Terraform Docker provider

The Docker provider lets Terraform treat containers, images, networks, and volumes as first-class resources. Instead of shelling out to Docker, Terraform reads and writes Docker state directly.

```hcl
provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "app" {
  name = "myapp:latest"
  build {
    context    = "."
    dockerfile = "Dockerfile"
  }
}

resource "docker_container" "app" {
  name  = "myapp"
  image = docker_image.app.latest
  ports {
    internal = 8080
    external = 80
  }
}
```

This pattern keeps container lifecycle in Terraform state. `terraform apply` creates the image and starts the container; `terraform destroy` tears them down. The trade-off is that complex Docker Compose stacks become verbose in pure HCL.

## Pattern 2: Provisioner-based Docker commands

When the Docker provider feels limiting, `null_resource` with `local-exec` or `remote-exec` can run arbitrary Docker commands during Terraform provision. This is useful for one-off setup that the provider does not expose cleanly.

```hcl
resource "null_resource" "docker_compose_up" {
  triggers = {
    compose_hash = filemd5("docker-compose.yml")
  }

  provisioner "local-exec" {
    command = "docker compose up -d"
  }
}
```

The `triggers` block forces a re-run only when the compose file changes, avoiding unnecessary restarts on every apply. This pattern is pragmatic, but it pushes container state outside Terraform's direct management, so `terraform destroy` does not automatically clean up containers.

## Pattern 3: Image build as a dependency

For CI/CD pipelines, Terraform can orchestrate image builds before provisioning infrastructure that depends on them. A common approach is to build and push the image, then reference the digest in a downstream resource.

```hcl
resource "null_resource" "build_image" {
  provisioner "local-exec" {
    command = "docker build -t registry.example.com/myapp:${terraform.workspace} . && docker push registry.example.com/myapp:${terraform.workspace}"
  }
}

resource "aws_instance" "app" {
  # ... instance config ...
  provisioner "remote-exec" {
    inline = [
      "docker pull registry.example.com/myapp:${terraform.workspace}",
      "docker run -d -p 80:8080 registry.example.com/myapp:${terraform.workspace}"
    ]
  }

  depends_on = [null_resource.build_image]
}
```

This keeps the build and deploy steps in one dependency graph, but the commands are stringly-typed and harder to validate than native provider resources.

## Verify

After `terraform apply`, confirm the container is running:

```bash
docker ps --filter name=myapp
```

If Terraform manages the image, check that the expected tag or digest is present:

```bash
docker images | grep myapp
```

For Pattern 2 and 3, inspect the Terraform state to see whether the null_resource ran:

```bash
terraform show
```

## Common errors

- **`docker: command not found`** on the remote host: the remote-exec provisioner runs inside the guest, so Docker must be installed there. A missing engine produces this error before any container starts.
- **Stale containers after `terraform destroy`**: null_resource does not register Docker containers as Terraform-managed resources. Orphaned containers keep running unless you add a destroy-time provisioner or manage them with the Docker provider instead.
- **Image drift**: if the image is rebuilt outside Terraform, the state file can lose track of the actual digest. Pinning image digests rather than mutable tags reduces this risk.
- **Socket permission errors**: on local Docker hosts, the user running Terraform must have read access to the Docker socket. A common fix is to add the user to the docker group, though that grants broad host access and is worth reviewing in shared environments.
