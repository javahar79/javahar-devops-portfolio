---
last_verified: 2026-07-16
tool_version: n/a
---

# Running `terraform version` and `terraform init`

Checked my Terraform version first:

```
$ terraform version
Terraform v1.9.5
on linux_amd64
```

Made a clean project directory and wrote a minimal config so init had something to work with.

```hcl
terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}
```

Ran `terraform init`:

```
$ terraform init

Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/local versions matching "~> 2.4"...
- Installing hashicorp/local v2.5.2...
- Installed hashicorp/local v2.5.2 (signed by HashiCorp)

Terraform has been successfully initialized!
```

Created a `.terraform/` directory and a `.terraform.lock.hcl` file. The lock file pins provider versions — nice touch.

## What tripped me up

Tried running `init` without any `.tf` file in the directory. Got "No configuration files found". Added the provider block above and it worked.

## Next

Write a `local_file` resource and run `terraform apply`.
