---
last_verified: 2026-07-19
tool_version: n/a
sources: []
---

# First run: terraform version and terraform init

I installed Terraform and ran `terraform version` — it printed the version (1.9.x) and confirmed it was working. Then I made a directory, wrote a basic `main.tf` with a `local_file` resource, and ran `terraform init`.

`init` downloaded the `hashicorp/local` provider plugin into `.terraform/`. Took maybe 10 seconds. I noticed it also created a `.terraform.lock.hcl` file — I think that pins provider versions so everyone on the team uses the same one.

One thing that tripped me up: I forgot to create the `main.tf` file first, so `init` ran but had nothing to initialise. It didn't error, just said it was ready. Adding the file and re-running `init` picked it up fine.

Next I want to run `terraform plan` to see what it would create before actually applying it.
