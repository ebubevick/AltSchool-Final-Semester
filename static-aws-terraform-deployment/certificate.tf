resource "aws_acm_certificate" "this" {
  domain_name       = var.domain_name
  validation_method = "DNS"
}

resource "aws_route53_record" "certificate_validation" {
  name    = aws_acm_certificate.this.domain_validation_options[0].resource_record_name
  type    = aws_acm_certificate.this.domain_validation_options[0].resource_record_type
  zone_id = data.aws_route53_zone.primary.zone_id
  records = [aws_acm_certificate.this.domain_validation_options[0].resource_record_value]
  ttl     = 60
}
