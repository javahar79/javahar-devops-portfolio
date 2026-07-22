# last_verified: 2026-07-22 · terraform n/a

terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
  }
}

variable "greeting" {
  description = "The greeting message written to the source file"
  type        = string
  default     = "hello from terraform"
}

variable "output_dir" {
  description = "Directory where terraform writes generated files"
  type        = string
  default     = path.module
}

resource "local_file" "source" {
  content  = var.greeting
  filename = "${var.output_dir}/source.txt"
}

# I used depends_on here even though terraform can infer the dependency
# from the interpolation — it makes the relationship explicit for anyone
# reading the config later and confirms derived waits for source
resource "local_file" "derived" {
  content  = "derived from: ${local_file.source.content}"
  filename = "${var.output_dir}/derived.txt"

  depends_on = [local_file.source]
}

output "source_path" {
  description = "Path to the generated source file"
  value       = local_file.source.filename
}

output "derived_path" {
  description = "Path to the generated derived file"
  value       = local_file.derived.filename
}
