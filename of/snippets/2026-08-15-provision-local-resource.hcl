# last_verified: 2026-08-15 · OpenTofu

# Minimal OpenTofu program: describe one local resource and let OpenTofu create it.
# This is my "hello world" — a single file, no variables yet, smallest thing that runs.

terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
  }
}

resource "local_file" "hello" {
  filename = "hello.txt"
  content  = "hello from OpenTofu"
}

output "created_file" {
  value = local_file.hello.filename
}