---
last_verified: 2026-07-19
tool_version: n/a
---

# Installing Terraform and running `terraform version`

I followed the HashiCorp install guide to get Terraform on my machine.

## What I did

Downloaded the Linux amd64 zip from the releases page, unzipped it into `/usr/local/bin`, and verified the binary was on my PATH.

```bash
unzip terraform_*.zip
sudo mv terraform /usr/local/bin/
terraform version
```

## What I saw

The terminal printed the Terraform version string with the Go version it was built with. No errors — that felt good.

## What tripped me up

I almost forgot to unzip before moving. Also had to `chmod +x` once because the download permissions were weird.

Next I'll try `terraform init` in a real directory.
