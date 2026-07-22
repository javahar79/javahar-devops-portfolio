---
last_verified: 2026-07-22
tool_version: n/a
---

# Infrastructure as Code — quick primer

> First-day notes on Infrastructure as Code. What it is, why it matters, and the key ideas to know.

## What is it?

Infrastructure as Code (IaC) means defining servers, networks, and databases in machine-readable files instead of clicking through a UI or typing shell commands. It's like having a version-controlled blueprint for your infrastructure.

## Why does it matter for DevOps?

Without IaC, every environment drifts apart — someone ran a manual command months ago, and now staging can't talk to prod. IaC makes infrastructure repeatable, auditable, and reviewable in a PR just like application code.

## Key terminology

- **Declarative vs imperative** — Declarative says "I want three load balancers" and the tool figures out how. Imperative says "run this script then that script." Terraform HCL is declarative.
- **Idempotent** — Running the same config twice produces the same result. If the resource exists, the tool skips it.
- **State** — A snapshot of current infrastructure. Terraform compares your config against state to decide what to create, update, or delete.
- **Drift** — A manual change outside IaC (e.g., resizing an instance in the console). Tools detect and reconcile it.
- **Module** — A reusable group of resources I define once and reference in multiple projects.

## A concrete example

```hcl
resource "aws_s3_bucket" "data" {
  bucket = "my-iac-demo-bucket"
  acl    = "private"
}
```

`terraform apply` creates this bucket; `terraform destroy` removes it. Same file, same result, every run.

## How this connects to what's next

IaC is the foundation for Terraform, Pulumi, and OpenTofu. Next I'll learn remote state management and wiring IaC into a CI/CD pipeline.
