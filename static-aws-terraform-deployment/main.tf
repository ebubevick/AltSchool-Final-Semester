module "s3_bucket" {
  source          = "./modules/s3"
  bucket_name     = var.bucket_name
  index_document  = "index.html"
  error_document  = "error.html"
  website_content_dir = var.website_content_dir
}

module "cloudfront" {
  source                     = "./modules/cloudfront"
  s3_bucket_website_endpoint = module.s3_bucket.bucket_website_endpoint
  acm_certificate_arn        = var.acm_certificate_arn
  default_root_object        = "index.html"
}

module "route53" {
  source                    = "./modules/route53"
  domain_name               = var.domain_name
  cloudfront_domain_name    = module.cloudfront.cloudfront_distribution_domain_name
  cloudfront_hosted_zone_id = "Z2FDTNDATAQYW2" # CloudFront hosted zone ID
}
