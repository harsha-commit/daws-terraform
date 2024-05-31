module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"

  zone_name = var.zone_name

  records = [
    {
      name = "backend"
      type = "A"
      ttl  = 1
      records = [
        module.backend.private_ip
      ]
    },
    {
      name = "frontend"
      type = "A"
      ttl  = 1
      records = [
        module.frontend.private_ip
      ]
    },
    {
      name = ""
      type = "A"
      ttl  = 1
      records = [
        module.frontend.public_ip
      ]
    },
  ]
}
