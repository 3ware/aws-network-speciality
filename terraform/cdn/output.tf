output "s3_website_url" {
  description = "The S3 Bucket website endpoint"
  value       = "http://${module.s3_bucket.s3_bucket_website_endpoint}"
}
