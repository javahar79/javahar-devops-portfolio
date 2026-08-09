# last_verified: 2026-08-09 · terraform n/a

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_ecr_repository" "web" {
  name = "${var.app_name}-web"
}

resource "aws_ecr_repository" "api" {
  name = "${var.app_name}-api"
}
