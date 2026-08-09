# last_verified: 2026-08-09 · terraform n/a

variable "app_name" {
  description = "Base name for provisioned resources"
  type        = string
  default     = "my-app"
}

variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}
