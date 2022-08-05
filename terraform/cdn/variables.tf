variable "enable_cloudfront" {
  description = "Feature toggle for the cloudfront distribution"
  type        = bool
  default     = false
}

variable "demo_domain_name" {
  description = "Route53 domain name registered for the demo"
  type        = string
  default     = null
}
