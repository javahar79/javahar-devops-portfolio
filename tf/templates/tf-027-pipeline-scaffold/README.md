---
last_verified: 2026-08-23
tool_version: n/a
sources: []
---

# Terraform + GitHub Actions Pipeline Scaffold

> A reusable project scaffold combining Terraform infrastructure code with a GitHub Actions CI/CD pipeline that runs `plan` on every PR and gates `apply` behind manual approval.

## Purpose

This template provides a starting point for teams adopting infrastructure-as-code with Terraform and wanting automated plan/apply cycles through GitHub Actions. The pipeline posts a `terraform plan` comment on every pull request so reviewers see the infrastructure diff before approving, then requires an explicit approval step before any `terraform apply` runs on the main branch.

## When to use

- Starting a new Terraform-managed project that needs CI/CD from day one.
- Replacing manual `terraform apply` runs with an auditable, approval-gated workflow.
- Standardizing the Terraform + GitHub Actions pattern across multiple repositories.

## Prerequisites

- Terraform installed locally (version ≥ 1.0 recommended).
- A GitHub repository with Actions enabled.
- An S3 bucket (or equivalent) configured for remote state storage.
- GitHub environment protection rules configured for the `production` environment.

## Structure

```
.
├── main.tf                  # Root module — provider config, backend, example resource
├── variables.tf             # Input variables
├── outputs.tf               # Exported values
├── backend.tf               # Remote state backend configuration
├── terraform.tfvars.example # Example variable values (copy to terraform.tfvars)
└── .github/
    └── workflows/
        ├── terraform-plan.yml   # Runs on every PR — posts plan output as comment
        ├── terraform-apply.yml  # Runs on merge to main — requires environment approval
        └── terraform-destroy.yml # Manual trigger for teardown
```

## Setup

1. Copy this scaffold into your repository root.
2. Edit `backend.tf` to point at your real S3 bucket and DynamoDB table.
3. Edit `main.tf` to replace the example `aws_s3_bucket` with your actual infrastructure.
4. Create a GitHub environment named `production` with required reviewers.
5. Add your cloud credentials as repository secrets (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`).
6. Push to a branch, open a PR, and verify the plan comment appears.

## Verify

- Open a pull request that changes a resource in `main.tf`.
- Confirm the `terraform-plan` workflow runs and posts a comment with the plan diff.
- Merge the PR and confirm the `terraform-apply` workflow triggers, pauses for approval, and applies after manual approval.

## Common errors

- **`Error: Backend configuration changed`** — The S3 bucket or DynamoDB table in `backend.tf` does not match the existing state. Ensure `backend.tf` matches the bucket used during `terraform init`.
- **`Error: Missing required key`** — A `terraform.tfvars` file is missing or incomplete. Copy `terraform.tfvars.example` and fill in the values.
- **Plan comment not posted** — The GitHub Actions token (`GITHUB_TOKEN`) lacks `pull-requests: write` permission. Check the workflow's `permissions` block.
- **Apply skips approval** — The `production` environment lacks required reviewers. Configure protection rules in Settings → Environments.
