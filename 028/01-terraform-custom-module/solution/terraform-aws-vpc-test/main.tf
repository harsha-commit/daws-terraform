module "vpc-test" {
  source = "../terraform-aws-vpc"

  project_name = "expense"
  environment  = "dev"

  availability_zones = ["us-east-1a", "us-east-1c"]

  public_subnets   = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets  = ["10.0.11.0/24", "10.0.12.0/24"]
  database_subnets = ["10.0.21.0/24", "10.0.22.0/24"]
}
