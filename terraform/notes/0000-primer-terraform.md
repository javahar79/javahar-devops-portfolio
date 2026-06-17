# Terraform — quick primer

> First-day notes for someone who's never used Terraform. Personal voice, plain language.

## What is it?

Terraform is an infrastructure-as-code tool from HashiCorp. You write config files declaring cloud resources (VMs, networks, DNS) and Terraform provisions them. It's like a blueprint for infra — you describe the end state, Terraform figures out the steps.

## What does it do?

Define resources in HCL files. Run `terraform plan` to preview changes, then `terraform apply` to execute. Terraform tracks what it created in a state file so it knows what to update or tear down.

## Why does it exist?

Before IaC, ops teams clicked through cloud consoles or wrote fragile shell scripts. Terraform makes infra repeatable, reviewable, and shareable — like version control for infrastructure.

## Key terminology

- **Provider** — A plugin for a platform (AWS, Azure, local). Example: `provider "local" {}`.
- **Resource** — A thing Terraform manages, like `local_file` or `aws_instance`.
- **State** — A JSON file (`terraform.tfstate`) tracking created resources. Terraform compares state to config to decide what changed.
- **Plan** — A dry-run showing what will be created, changed, or destroyed.
- **Apply** — Execute the plan and create resources.

## A tiny example

```hcl
terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "2.4.0"
    }
  }
}

resource "local_file" "hello" {
  content  = "Hello, Terraform!"
  filename = "${path.module}/hello.txt"
}
```

Save as `example.tf`, run `terraform init && terraform apply`. My first apply felt like magic.

## What I'll cover next

Install Terraform next, then build a real config with the local provider to experiment with state and variables.
