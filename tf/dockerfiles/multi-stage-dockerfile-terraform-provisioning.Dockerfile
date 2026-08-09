# last_verified: 2026-08-09 · terraform n/a
# Multi-stage Dockerfile for Terraform provisioning workflows.
# Pin the base Terraform image to a specific stable version in production.
# Stage 1 initializes the working directory and pre-caches provider plugins.
# Stage 2 produces a minimal runtime image for plan and apply.

FROM hashicorp/terraform AS tf-init
WORKDIR /app
COPY main.tf variables.tf backend.hcl ./
RUN terraform init -backend-config=backend.hcl

FROM alpine
RUN apk add --no-cache ca-certificates bash
COPY --from=tf-init /usr/local/bin/terraform /usr/local/bin/
COPY --from=tf-init /app/.terraform /app/.terraform
COPY --from=tf-init /app/*.tf /app/
COPY --from=tf-init /app/.terraform.lock.hcl /app/
WORKDIR /app
CMD ["terraform", "plan"]
