---
last_verified: 2026-07-27
tool_version: n/a
---

# Terraform workspaces vs directory-per-env: comparing environment isolation approaches

> Comparing two common patterns for managing multiple Terraform environments — workspaces and separate directories — with notes on when each fits best.

## Purpose

Terraform does not prescribe a single way to manage multiple environments (dev, staging, prod). Two patterns dominate: **workspaces**, which store separate state files under a single configuration, and **directory-per-env**, which keeps a full copy of the configuration tree per environment. This doc compares the two approaches and outlines when each is appropriate.

## How workspaces work

Terraform workspaces allow multiple state files to coexist within a single configuration directory. Running `terraform workspace new dev` creates a workspace named `dev`, and subsequent `plan` or `apply` commands use that workspace's isolated state file. Resources in the configuration can reference the active workspace with `terraform.workspace`, enabling lightweight conditional logic for environment-specific values.

The key advantage is a single codebase with one `terraform.tf` layout. Environment differences are expressed through variables or workspace-aware expressions rather than through file duplication. Switching environments is a single command: `terraform workspace select prod`.

## How directory-per-env works

The directory-per-env pattern maintains a separate copy of the entire Terraform configuration for each environment, typically under a structure like:

```
environments/
  dev/
    main.tf
    variables.tf
  staging/
    main.tf
    variables.tf
  prod/
    main.tf
    variables.tf
```

Each directory has its own state file. Environment-specific values live in per-directory variable files or tfvars passed at runtime. Shared configuration can be factored into modules, but the root configuration is duplicated across directories.

## When to use workspaces

Workspaces fit when the configuration is genuinely shared across environments with only a few variable differences — such as instance size, subnet CIDR ranges, or tag values. They keep the drift between environments minimal because there is only one copy of the HCL to maintain. They are also useful for per-developer scratch environments where each developer gets their own workspace within the same backend.

Workspaces run into limitations when environments diverge significantly. Adding environment-specific resources or conditional blocks (`count = terraform.workspace == "prod" ? 1 : 0`) makes the configuration harder to read and increases the risk of accidentally deploying prod changes from a dev workspace. At that point, directory separation becomes cleaner.

## When to use directory-per-env

Directory-per-env is the better choice when environments have meaningfully different resource sets, networking needs, or access controls. Production may need stricter security groups, larger instance types, or additional monitoring resources that staging does not. Keeping each environment in its own directory makes those differences explicit and reduces the chance of misconfiguring production by carrying over a workspace-level conditional that was meant for staging.

This pattern also aligns well with code-review workflows: a pull request against `environments/prod/` only touches production configuration, making the review scope clear. Shared logic is kept in modules, so duplication is limited to the root configuration wrapping.

## Verify

To validate either approach, run `terraform plan` with the target workspace or directory and confirm that only the intended resources would be created. For workspaces, use `terraform workspace list` to verify the active workspace before applying. For directory-per-env, check that the correct `terraform.tfstate` file is referenced by inspecting the backend configuration in each directory.

## What I'd try next

- Combine the two patterns: use workspaces for lightweight dev/staging environments and a separate prod directory for stricter production controls
- Add a CI pipeline that runs `terraform plan` per workspace or per directory and posts results as status checks
- Study the Terraform Cloud/Enterprise remote-backend patterns for workspace management at scale
