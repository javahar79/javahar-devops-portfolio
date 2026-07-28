#!/bin/bash
# last_verified: 2026-07-28 · terraform n/a
# Demonstrates Terraform remote state management with S3 backend, migration, and DynamoDB locking

set -euo pipefail

TERRAFORM_DIR="${1:-.}"
STATE_BUCKET="${STATE_BUCKET:?STATE_BUCKET must be set}"
STATE_KEY="${STATE_KEY:-terraform.tfstate}"
AWS_REGION="${AWS_REGION:-us-east-1}"
DYNAMODB_TABLE="${DYNAMODB_TABLE:-}"

echo "Purpose: Initialize Terraform with S3 backend, migrate local state, and enable DynamoDB locking."

echo "▶ Step 1 — Initialize backend configuration"
terraform init \
  -reconfigure \
  -backend-config=bucket="$STATE_BUCKET" \
  -backend-config=key="$STATE_KEY" \
  -backend-config=region="$AWS_REGION" \
  "$TERRAFORM_DIR"

if [ -n "$DYNAMODB_TABLE" ]; then
  echo "▶ Step 1b — Adding DynamoDB table for state locking"
  terraform init \
    -reconfigure \
    -backend-config=bucket="$STATE_BUCKET" \
    -backend-config=key="$STATE_KEY" \
    -backend-config=region="$AWS_REGION" \
    -backend-config=dynamodb_table="$DYNAMODB_TABLE" \
    "$TERRAFORM_DIR"
fi

echo "▶ Step 2 — Migrate existing local state to S3"
terraform init \
  -migrate-state \
  -backend-config=bucket="$STATE_BUCKET" \
  -backend-config=key="$STATE_KEY" \
  -backend-config=region="$AWS_REGION" \
  "$TERRAFORM_DIR"

echo "▶ Verify — Confirm state is managed by S3 backend"
terraform state list "$TERRAFORM_DIR" | head -5

echo "▶ Done — state is now stored in s3://$STATE_BUCKET/$STATE_KEY with locking via ${DYNAMODB_TABLE:-none}"