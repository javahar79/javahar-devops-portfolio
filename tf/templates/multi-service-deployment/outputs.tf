# last_verified: 2026-08-09 · terraform n/a

output "registry_urls" {
  description = "Map of service names to ECR repository URLs"
  value = {
    web = aws_ecr_repository.web.repository_url
    api = aws_ecr_repository.api.repository_url
  }
}

output "web_registry_url" {
  description = "ECR repository URL for the web service"
  value       = aws_ecr_repository.web.repository_url
}

output "api_registry_url" {
  description = "ECR repository URL for the api service"
  value       = aws_ecr_repository.api.repository_url
}
