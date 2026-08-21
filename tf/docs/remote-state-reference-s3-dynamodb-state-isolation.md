---
last_verified: 2026-08-20
tool_version: n/a
---

# Remote state reference: S3 backend, DynamoDB locking, and state-isolation strategies

## Purpose

Terraform records everything it manages in a state file. With a single user working locally, that file lives next to the configuration as `terraform.tfstate`. The moment a second person runs `terraform apply`, that local-file model breaks: either each engineer keeps a private copy that drifts, or two applies race against the same file. Remote state moves the file to shared storage so every operator reads and writes the same source of truth. This reference covers the S3 backend as the shared store, DynamoDB as the locking mechanism that serializes applies, and the isolation strategies that keep separate environments from stepping on each other.

## When to use

Use remote state whenever more than one person runs Terraform against the same infrastructure, or whenever automation (CI/CD) applies changes. Use it from the start of a project rather than retrofitting later, because migrating existing local state is an extra, risky step. Choose S3 + DynamoDB for teams already on AWS, or any bucket/table pair your cloud offers; the concepts — shared store, locking, per-environment keys — transfer to every backend that supports them.

## Prerequisites

- Terraform initialized in the working directory (`terraform init`).
- Read/write access to the S3 bucket that holds state.
- A DynamoDB table that will serve as the lock table.
- An IAM policy that allows the caller to read/write the bucket objects and to get/put items in the lock table.

## Steps

### 1. Create the lock table

DynamoDB locking works because Terraform writes a lock item into the table before an operation and removes it after. The table needs a primary key named `LockID` of type string; no other schema is required.

### 2. Declare the S3 backend

The backend block sits inside the `terraform` block of the configuration:

```hcl
terraform {
  backend "s3" {
    bucket         = "my-org-terraform-state"
    key            = "prod/network/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}
```

The `key` is the object path inside the bucket and is the primary lever for state isolation (see below).

### 3. Initialize against the backend

`terraform init` detects the backend block, asks to migrate the local state file, and wires the working directory to remote state. Subsequent `plan` and `apply` operations read and write the bucket rather than the local file.

### 4. Verify locking is active

Run `terraform apply` in two terminals pointed at the same configuration and key. The second operation should fail with a message reporting that the state is currently locked, and it should name the lock holder. After the first apply finishes, the second can proceed.

### 5. Choose an isolation strategy

State isolation decides which configurations share a bucket object and which get their own. The three common patterns:

- **Key per environment** — one bucket, distinct keys such as `dev/network/terraform.tfstate` and `prod/network/terraform.tfstate`. Same bucket, disjoint objects, no interference.
- **Separate backends per environment** — distinct buckets (or accounts) per environment, so even a misconfigured key cannot cross environments.
- **Workspaces** — multiple state files inside a single backend, selected with `terraform workspace select`. Convenient for quick environments but easy to collide on when two teams share a workspace.

The isolation point to remember: two configurations using the same bucket + key are the same state, regardless of other differences. Isolation is defined by the bucket and key pair, not by naming resources differently.

## Verify

- `terraform plan` after the migration shows no unexpected resource changes, proving local and remote state agree.
- A second `apply` while the first runs fails with a lock error, proving locking is on.
- Inspect the bucket object to confirm the expected key path and that encryption is set.
- Confirm a `dev` and a `prod` key exist as separate objects after applying each.

## Common errors

- **Forgotten encrypt flag** — state may contain sensitive values; enabling bucket-side encryption for the state bucket addresses this.
- **Lock-not-found on plan** — reads do not need the lock table; only writes do. A plan running while an apply is in flight is expected and harmless.
- **Backend can't use variables** — the backend block cannot reference variables or locals; values are hard-coded or supplied via a partial-config file with `-backend-config` during `terraform init`.
- **Leftover lock after a crash** — if an operation dies mid-write the lock item may remain. `terraform force-unlock <lock-id>` clears it; the lock ID is printed by the error message.

## Rollback

There is no automated "undo" for remote state. The recovery path is a state file, not the live resources: restore the previous state object (from bucket versioning or a backup), then run `terraform plan` and review the diff before applying. With state in S3, enabling bucket versioning on the state bucket is the practical way to make this recovery possible at all.