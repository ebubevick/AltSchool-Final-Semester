output "s3_bucket_id" {
  value = module.s3_bucket.bucket_id
}

output "cloudfront_distribution_id" {
  value = module.cloudfront.cloudfront_distribution_id
}

output "cloudfront_domain_name" {
  value = module.cloudfront.cloudfront_distribution_domain_name
}

output "route53_zone_id" {
  value = module.route53.zone_id
}