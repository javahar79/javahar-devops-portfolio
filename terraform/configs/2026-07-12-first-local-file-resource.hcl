# last_verified: 2026-07-12 · Terraform n/a

terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

resource "local_file" "first" {
  content  = "my first terraform resource"
  filename = "${path.module}/first.txt"
}
