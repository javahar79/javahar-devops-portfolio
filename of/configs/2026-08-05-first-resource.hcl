# last_verified: 2026-08-05 · OpenTofu

variable "message" {
  description = "The message to write to the file"
  type        = string
  default     = "Hello from OpenTofu!"
}

resource "local_file" "greeting" {
  filename = "hello.txt"
  content  = var.message
}

output "file_path" {
  description = "The path of the created file"
  value       = local_file.greeting.filename
}