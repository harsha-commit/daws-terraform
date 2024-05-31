module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"

  zone_name = var.zone_name

  records = [
    {
      name = "db" # db.zone_name
      type = "CNAME"
      ttl  = 1
      records = [
        module.db.db_instance_address
      ]
    },
  ]

}
