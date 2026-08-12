---
last_verified: 2026-08-11
tool_version: n/a
sources: []
---

# OpenTofu — log my first command

> Scratch notes from my first `tofu` session. Plain language, no gloss.

## What I did

I installed OpenTofu via the official install script, then ran `tofu` from the terminal. The help text printed, which confirmed the binary is on my PATH.

Next I tried the standard sequence:

```bash
tofu init
tofu plan
tofu apply
```

`tofu init` downloaded provider plugins and set up the working directory. `tofu plan` showed what would be created. `tofu apply` actually created the resources.

## What tripped me up

The backend prompt during `init` caught me off guard — I did not expect OpenTofu to ask about remote state storage before I had written any resources. Passing `-backend=false` skips that and keeps state local, which is what I wanted for a first run.

`.terraform.lock.hcl` was also generated during `init`. I was not sure whether to commit it. The docs say yes — commit the lock file so teammates get the same provider versions.

## What I'll try next

I want to try a remote backend (S3 + DynamoDB locking), then provision a real AWS resource like an S3 bucket. After that I'll compare the OpenTofu workflow to Terraform's to see where they differ in practice.
