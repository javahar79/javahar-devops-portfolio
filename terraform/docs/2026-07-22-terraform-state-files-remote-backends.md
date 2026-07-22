---
last_verified: 2026-07-22
tool_version: n/a
---

# Terraform: state files, remote backends, and workspace isolation

> Lab notes from my second and third Terraform sessions. First-person, still figuring things out.

## The state file

I ran `terraform apply` several times before I understood what `terraform.tfstate` actually does. The `.tf` files in my editor are just the definition — Terraform uses the state file as the record of what exists in the cloud. When I run `plan`, it compares my `.tf` files against this state file, not against what the provider reports live. That's why the first run is the only one that creates resources: subsequent runs see the state and say "no changes."

Moving the state file to a remote backend (S3 in my case) was the first thing that made team collaboration work. Instead of each person having a local state, we share one S3 file. The moment two people ran `apply` with the same state, we stopped creating duplicate resources. I also added DynamoDB locking so two people can't run `apply` simultaneously — without it, the second person would corrupt the state mid-run.

## Remote backends

An S3 backend config looks like this:

```hcl
terraform {
  backend "s3" {
    bucket         = "my-terraform-state"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
```

I initially forgot `encrypt = true` and had to re-create the state file. The lesson: encryption isn't optional for state files that might contain secrets.

I also learned that backend config can't use variables — it has to be hard-coded or supplied via a partial config file. That tripped me up when I tried to parameterize the bucket name.

## Workspace isolation

Workspaces let me keep multiple state files inside the same backend. `terraform workspace new dev` creates a `dev` workspace, and every resource gets a `dev_` prefix. I created `dev` and `prod` workspaces and ran `apply` in each — they built separate resources with no overlap.

What workspaces don't give you is true team isolation. If two teams share the same workspace, they still collide on the same state file. The pattern I'm settling on is: separate S3 prefixes per environment or per team (e.g., `team-a/prod/terraform.tfstate`), and use workspaces only for lightweight per-developer scratch environments.

## What I'd try next

- Add S3 versioning and lifecycle rules to the state bucket so I can recover from accidental deletions
- Try a separate backend per team instead of one big backend with workspace prefixes
- Explore `terraform state list` and `terraform state mv` to untangle a messy state file once it's remote
