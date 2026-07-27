# last_verified: 2026-07-27 · hcl n/a

# common-modular-versioned-configs.hcl
# I wrote this example to practice the patterns that make
# IaC configs reusable and easy to reason about.

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# locals keep computed values in one place so I don't
# repeat the same expressions across resources
locals {
  app_name  = "payment-service"
  env       = "staging"
  common_tags = {
    Service = local.app_name
    Env     = local.env
    Owner   = "platform"
  }
}

# variables make the same module usable in multiple
# environments without changing the internals
variable "instance_type" {
  type        = string
  default     = "t3.small"
  description = "Instance size for the app tier"
}

variable "min_size" {
  type        = number
  default     = 2
  description = "Minimum autoscaling group size"
}

output "module_example" {
  description = "Shows how one factored config can feed multiple environments"
  value = {
    app      = local.app_name
    env      = local.env
    instance = var.instance_type
    min      = var.min_size
    tags     = local.common_tags
  }
}
