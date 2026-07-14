---
last_verified: 2026-07-14
tool_version: n/a
---

# Running `terraform version` and `terraform init` for the first time

I already had Terraform installed from earlier. First thing I did was check the version — it printed the usual version and platform string. Worked fine.

## Setting up a project dir

I made a fresh directory and dropped in a minimal config so `init` would have something to work with.

```hcl
# main.tf
terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

resource "local_file" "hello" {
  content  = "hello from init"
  filename = "${path.module}/hello.txt"
}
```

## Running `terraform init`

```
$ terraform init

Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/local versions matching "~> 2.4"...
- Installing hashicorp/local...
- Installed hashicorp/local (signed by HashiCorp)

Terraform has been successfully initialized!
```

Three things happened:
1. It initialized the backend (`.terraform/` directory appeared).
2. It downloaded the `local` provider plugin.
3. It printed "successfully initialized" — no errors.

I noticed a `.terraform.lock.hcl` file got created too. That locks the provider version so future runs use the same one.

## What tripped me up

I ran `init` before writing any `.tf` file and got "No configuration files". Makes sense — `init` needs at least one config to know which providers to download. I added an empty `main.tf` with just the `required_providers` block and it worked.

## Next

Run `terraform plan` and `terraform apply` to actually create the local file.
