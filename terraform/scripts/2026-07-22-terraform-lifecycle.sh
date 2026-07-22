#!/bin/bash
# last_verified: 2026-07-22 · terraform n/a
# Run terraform init, validate, plan, and apply against the local config

TERRAFORM_DIR="terraform/configs"

echo "▶ init"
# I passed -input=false so terraform won't pause and ask me to confirm
# variable defaults interactively when running from a script
terraform init -input=false "$TERRAFORM_DIR"

echo "▶ validate"
# validate checks the config is syntactically valid before touching state
terraform validate "$TERRAFORM_DIR"

echo "▶ plan"
# I save the plan to a file so apply can pick it up without re-evaluating
terraform plan -out=tfplan "$TERRAFORM_DIR"

echo "▶ apply"
# -auto-approve skips the interactive approval step so the script runs end to end
terraform apply -auto-approve tfplan
