---
last_verified: 2026-08-09
tool_version: n/a
sources:
  - https://clankercloud.ai/blog/iac-kubernetes-practical-patterns-2026
---

# Project scaffold: Terraform + Docker for multi-service deployment

## Purpose

A reference scaffold that pairs Terraform infrastructure provisioning with Docker multi-service application definitions. Terraform provisions a container registry and IAM user for CI/CD image pushes, while Docker Compose defines a three-service local stack (web, api, database) for development and integration testing.

## When to use

Use this scaffold when starting a project that separates cloud infrastructure (managed through Terraform) from local application development (managed through Docker Compose). It is suitable for teams that want a single repository to hold both the provisioning layer and the container definitions before promoting images to a production cluster.

## Prerequisites

- Terraform installed locally and cloud provider credentials configured
- Docker Engine and Docker Compose v2
- Cloud provider permissions to create container registries and IAM users

## Steps

1. Copy the scaffold directory into the project root.
2. Create a `terraform.tfvars` from `terraform.tfvars.example` with cloud-specific values.
3. Initialize Terraform: `terraform init`
4. Review planned changes: `terraform plan`
5. Apply the infrastructure: `terraform apply`
6. Build and start services: `docker compose up --build -d`
7. Verify each service on its exposed port.

## Verify

1. Confirm the registry URL: `terraform output registry_urls`
2. Check service health: `docker compose ps`
3. Verify the web service responds on its health endpoint.
4. Verify the API service responds on its health endpoint.
5. Confirm the database is ready: `docker compose exec db pg_isready -U appuser`

## Common errors

- **Backend block is empty**: Terraform fails during `init` if the S3 backend configuration is not populated. Use local state for initial testing, then migrate to remote state after the bucket exists.
- **Image not found after push**: The container image was not pushed to the registry. Build and push after `terraform apply` succeeds.
- **Port already in use**: A local process occupies one of the Compose ports. Stop the conflicting process or remap the port in `docker-compose.yml`.

## References

- [IaC + Kubernetes practical patterns — clankercloud.ai](https://clankercloud.ai/blog/iac-kubernetes-practical-patterns-2026)
