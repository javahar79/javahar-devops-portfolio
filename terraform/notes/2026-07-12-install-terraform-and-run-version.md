---
last_verified: 2026-07-12
tool_version: n/a
---

# Installing Terraform and running `terraform version`

I installed Terraform to see what version my system has and make sure everything works.

## What I did

Downloaded the Linux AMD64 binary from the HashiCorp releases page, unzipped it, and moved it into my `~/bin` directory. Then ran:

```
$ terraform version
Terraform v1.8.5
on linux_amd64
```

It printed the version and platform. The install took about a minute — just a single binary, no dependencies.

## What tripped me up

I downloaded the wrong architecture file first (arm64 instead of amd64) and got a "cannot execute binary file" error. Checked my architecture with `uname -m` and grabbed the right zip.

Also, at first I forgot to make the binary executable — but the zip extracts with the right permissions already, so that wasn't actually an issue. Just a note for next time.

## Next

Run `terraform init` in a project directory and create my first config.
