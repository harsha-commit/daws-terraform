
output "vpc_id" {
  value = module.vpc-test.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc-test.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc-test.private_subnet_ids
}

output "database_subnet_ids" {
  value = module.vpc-test.database_subnet_ids
}

output "database_subnet_group_id" {
  value = module.vpc-test.database_subnet_group_id
}
