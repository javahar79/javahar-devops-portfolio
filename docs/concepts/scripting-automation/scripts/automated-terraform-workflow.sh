#!/usr/bin/env bash
# last_verified: 2026-08-11 · bash n/a
# Automated Terraform workflow — init, validate, plan, apply with error handling.
# Demonstrates combining Scripting & Automation with Infrastructure as Code.

set -euo pipefail

TF_DIR="${1:-.}"
ENV="${2:-dev}"

cd "$TF_DIR"

echo "==> Selecting workspace: $ENV"
terraform workspace select "$ENV" 2>/dev/null || terraform workspace new "$ENV"

echo "==> Initializing Terraform"
terraform init -input=false

echo "==> Validating configuration"
terraform validate

echo "==> Planning changes"
terraform plan -input=false -out=tfplan

echo "==> Applying plan"
terraform apply -input=false tfplan

echo "==> Refreshing state"
terraform refresh

echo "==> Done. Run 'terraform destroy' to tear down."
