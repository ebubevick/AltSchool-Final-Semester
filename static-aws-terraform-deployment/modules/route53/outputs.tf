output "zone_id" {
  value = aws_route53_zone.this.zone_id
}

output "www_record_fqdn" {
  value = aws_route53_record.www.fqdn
}

output "root_record_fqdn" {
  value = aws_route53_record.root.fqdn
}
