---
last_verified: 2026-07-19
tool_version: n/a
---

# What I found in the terraform/ directory

I opened the terraform/ folder to document how I've been organizing my Terraform practice. Here's the structure I found:

- **`notes/`** — Learning journal entries. The primer (`0000-primer-terraform.md`) introduces Terraform concepts. Dated files like `2026-07-12-install-terraform-and-run-version.md` log each hands-on session — installing, running `version`, doing `init`, and what tripped me up along the way.
- **`configs/`** — HCL config files I wrote while learning. `local-provider.hcl` sets up the local provider. `2026-07-12-first-local-file-resource.hcl` creates a `local_file` resource — my first real Terraform resource.
- **`scripts/`** — So far just the install script (`2026-06-17-install-terraform.sh`) that downloads and extracts the Terraform binary.

I still need to explore `terraform validate`, `terraform plan`, and writing configs with variables and outputs. The configs/ folder will grow as I try those next.
