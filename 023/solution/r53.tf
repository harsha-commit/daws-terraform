resource "aws_route53_record" "this" {
  count           = length(var.instance_names)
  zone_id         = data.aws_route53_zone.this.id
  name            = var.instance_names[count.index] == "frontend" ? local.domain_name : "${var.instance_names[count.index]}.${local.domain_name}"
  type            = "A"
  ttl             = 1
  records         = [var.instance_names[count.index] == "frontend" ? aws_instance.this[count.index].public_ip : aws_instance.this[count.index].private_ip]
  allow_overwrite = true
}
