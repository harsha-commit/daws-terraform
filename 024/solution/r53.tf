resource "aws_route53_record" "this" {
  for_each        = aws_instance.this
  zone_id         = data.aws_route53_zone.this.id
  name            = each.key == "frontend" ? local.domain_name : "${each.key}.${local.domain_name}"
  type            = "A"
  ttl             = 1
  records         = [each.key == "frontend" ? each.value.public_ip : each.value.private_ip]
  allow_overwrite = true
}
