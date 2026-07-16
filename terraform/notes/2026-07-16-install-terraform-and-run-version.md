---
last_verified: 2026-07-16
tool_version: n/a
---

# Installing Terraform and running `terraform version`

Went through the Terraform install today. Grabbed the Linux AMD64 zip from releases.hashicorp.com, unzipped it, and moved the binary into `~/bin`.

```
$ terraform version
Terraform v1.9.5
on linux_amd64
```

Worked first try. The binary is self-contained — no library dependencies or package manager needed.

## What tripped me up

Downloaded the wrong arch initially (grabbed arm64 by accident because I wasn't paying attention). `uname -m` showed `x86_64` so I grabbed the amd64 zip and it ran fine.

## Next

Create a project directory and run `terraform init` to see how provider downloads work.
