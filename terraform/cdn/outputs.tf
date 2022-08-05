output "s3_website_url" {
  description = "The S3 Bucket website endpoint"
  value       = "http://${module.s3_bucket.s3_bucket_website_endpoint}"
}

output "cloudfront_url" {
  description = "The CloudFront distribution domain name"
  value       = "https://${module.cdn[0].cloudfront_distribution_domain_name}"
}
