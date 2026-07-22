---
last_verified: 2026-07-21
tool_version: n/a
sources: []
---

# What I learned running `terraform validate` and `terraform plan`

I created a small Terraform config and ran `terraform validate` and `terraform plan` to see what happens before touching any real infrastructure.

## `terraform validate`

First I ran `terraform validate`. This checks the config for syntax and internal consistency — no cloud provider is contacted and no state file is needed. I had a typo in a provider block once and it pointed straight to the offending line, which was helpful.

## `terraform plan`

Then I ran `terraform plan`. This compares my config to the existing state file and shows what Terraform will create, change, or destroy. My config had a `local_file` resource, so the plan output showed a `+` next to `local_file.hello` — meaning it's a new resource that doesn't exist yet. If something already existed, it would show `~` for changes or `-` for deletions.

## What tripped me up

I tried running `terraform plan` before any `terraform init` and got a confusing error about missing providers. The fix was to run `init` first so the provider plugin exists locally. After that, plan ran cleanly.

## Next

Run `terraform apply` to actually create the file, then modify the config and run `plan` again to see the diff.
