---
last_verified: 2026-07-21
tool_version: n/a
sources: []
---

# What tripped me up running the Terraform quickstart

I followed the basic Terraform quickstart — install, init a project, write a config, plan, and apply — and kept notes on where I got stuck along the way.

## The flow

1. Downloaded the binary and verified `terraform version`.
2. Made a project directory and wrote a config with a `local_file` resource.
3. Ran `terraform init` to download the provider plugin.
4. Ran `terraform plan` to preview the change.
5. Ran `terraform apply` to actually create the file.
6. Ran `terraform destroy` to clean it up.

Overall that works. The tool is straightforward once the pieces are in order.

## Where I got stuck

- **Running commands in the wrong directory.** I ran `terraform init` outside a project folder once and got "No configuration files". The tool needs a `.tf` file in the current directory to know what providers to download.
- **Skipping `plan` and jumping to `apply`.** Once I applied before planning, which did exactly what I wanted, but I didn't read the plan output first and missed that another resource was also queued for creation. Planning first gives you a chance to catch unintended changes.
- **Forgetting to re-run `init` after adding a new provider block.** I added an `aws` provider to a config that only had `local` and tried to `plan`. The error mentioned GPG signatures and mirror URLs, which made no sense until I realized I just needed to re-run `init` after updating the config.

## What I'd do next

I want to try variables and outputs next so the same config can be reused with different values. Then I'll try a remote backend instead of local state, though I don't know much about that yet.
