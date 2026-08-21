# last_verified: 2026-08-21 · Terraform n/a

variable "project" {
  description = "Project name used as prefix for all resource names and tags"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"

  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0))
    error_message = "vpc_cidr must be a valid CIDR block."
  }
}

variable "az_count" {
  description = "Number of availability zones to span (ignored if availability_zones is set)"
  type        = number
  default     = 2

  validation {
    condition     = var.az_count >= 1 && var.az_count <= 6
    error_message = "az_count must be between 1 and 6."
  }
}

variable "availability_zones" {
  description = "Explicit list of AZs; overrides az_count"
  type        = list(string)
  default     = []
}

variable "public_subnet_count" {
  description = "Number of public subnets to create"
  type        = number
  default     = 2
}

variable "private_subnet_count" {
  description = "Number of private subnets to create"
  type        = number
  default     = 2
}

variable "subnet_bits" {
  description = "Additional bits to extend the VPC CIDR for subnets"
  type        = number
  default     = 8
}

variable "single_nat_gateway" {
  description = "Use a single NAT gateway instead of one per AZ (cost savings for non-HA)"
  type        = bool
  default     = false
}

variable "app_port" {
  description = "Port the application listens on (used in app security group)"
  type        = number
  default     = 8080
}

variable "db_port" {
  description = "Port the database listens on (used in database security group)"
  type        = number
  default     = 5432
}

variable "tags" {
  description = "Additional tags to apply to all resources"
  type        = map(string)
  default     = {}
}
