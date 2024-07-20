resource "aws_route53_record" "this" {
  zone_id  = data.aws_route53_zone.this.id
  for_each = aws_instance.this

  name = each.key == "frontend-prod" ? local.domain_name : "${each.key}.${local.domain_name}"
  type = "A"

  ttl     = 1
  records = [startswith(each.key, "frontend") ? each.value.public_ip : each.value.private_ip]
}
