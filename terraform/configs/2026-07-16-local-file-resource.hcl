# last_verified: 2026-07-16 · Terraform n/a

terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

resource "local_file" "hello" {
  content  = "hello from terraform"
  filename = "${path.module}/hello.txt"
}
