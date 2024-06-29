variable "s3_bucket_website_endpoint" {
  description = "The website endpoint of the S3 bucket"
  type        = string
}

variable "origin_id" {
  description = "The origin ID for the CloudFront distribution"
  type        = string
  default     = "s3-origin"
}

variable "default_root_object" {
  description = "The default root object for the CloudFront distribution"
  type        = string
  default     = "index.html"
}

variable "acm_certificate_arn" {
  description = "The ARN of the ACM certificate"
  type        = string
}
