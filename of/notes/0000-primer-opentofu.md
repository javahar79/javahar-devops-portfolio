---
last_verified: 2026-08-05
tool_version: n/a
---

# OpenTofu — quick primer

> First-day notes for someone who's never used OpenTofu. Personal voice, plain language.

## What is it?

OpenTofu is an infrastructure-as-code tool — it lets you describe your cloud resources (servers, databases, networks) in configuration files and then creates or updates them automatically. I think of it as the open-source cousin of Terraform; when Terraform changed its license a while back, the community forked it into OpenTofu so that everyone could keep using a fully open version. If you've ever set up a server by clicking through a web console and wished you could just write down what you wanted and have it appear, OpenTofu is that.

## What does it do?

It reads your configuration files, figures out what infrastructure already exists, and then makes the minimum changes needed to match what you described. I wrote a simple config that creates a local file on my machine, and OpenTofu planned the change, I approved it, and the file appeared — all from a few lines of declarative code.

## Why does it exist?

Before tools like OpenTofu, provisioning infrastructure meant clicking through cloud consoles or writing custom scripts that were hard to maintain. If two people both tried to create the same resource, you'd get conflicts. If something went wrong, there was no easy way to undo it. OpenTofu solves this by keeping a record of what it has created (state) and applying changes in a predictable, repeatable way. DevOps engineers and platform teams use it daily to manage everything from single VMs to complex multi-cloud setups.

## Key terminology

- **Provider** — A plugin that tells OpenTofu how to talk to a specific service. Example: the `local` provider lets OpenTofu create files on disk, while the `aws` provider manages EC2 instances.
- **Resource** — The basic building block — one piece of infrastructure you want to create. Example: `resource "local_file" "hello" { filename = "hello.txt" }` creates a file.
- **State** — OpenTofu's memory of what it has created. It lives in a file called `terraform.tfstate` and lets OpenTofu know what to update vs. what to leave alone.
- **Plan** — OpenTofu's preview of what changes it will make. Example: running `tofu plan` shows you a list of resources it will create, modify, or destroy before you apply anything.
- **Apply** — The command that actually makes the changes happen. Example: `tofu apply` creates the resources described in your config after you approve the plan.
- **Variable** — A placeholder value you can set when running OpenTofu, so the same config works in different environments. Example: `variable "region" { default = "us-east-1" }` lets you swap regions without editing the config.

## A tiny example

```hcl
resource "local_file" "greeting" {
  filename = "hello.txt"
  content  = "Hello from OpenTofu!"
}
```

Run `tofu init` to set up providers, then `tofu apply` to create the file.

## What I'll cover next

I plan to dig into variables and outputs so I can parameterize my configs, then try connecting to a real cloud provider like AWS. After that I want to explore how OpenTofu workspaces let me run the same config against different environments without duplicating code.