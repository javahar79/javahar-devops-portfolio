# last_verified: 2026-08-23 · terraform n/a

output "bucket_id" {
  description = "The ID of the created S3 bucket"
  value       = aws_s3_bucket.example.id
}

output "bucket_arn" {
  description = "The ARN of the created S3 bucket"
  value       = aws_s3_bucket.example.arn
}

output "bucket_region" {
  description = "The region of the created S3 bucket"
  value       = aws_s3_bucket.example.region
}
