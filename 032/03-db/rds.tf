module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = "${var.project_name}-${var.environment}-db"

  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t3.micro"
  allocated_storage = 5

  db_name  = "transactions"
  username = "root"
  port     = "3306"

  vpc_security_group_ids = [data.aws_ssm_parameter.db_sg_id.value]

  tags = {
    Project     = var.project_name
    Environment = var.environment
  }

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = split(",", data.aws_ssm_parameter.database_subnets_ids.value)

  # DB parameter group
  family = "mysql8.0"

  # DB option group
  major_engine_version = "8.0"

  # Practice Specific
  manage_master_user_password = false
  password                    = "ExpenseApp1"
  skip_final_snapshot         = true

  parameters = [
    {
      name  = "character_set_client"
      value = "utf8mb4"
    },
    {
      name  = "character_set_server"
      value = "utf8mb4"
    }
  ]

  options = [
    {
      option_name = "MARIADB_AUDIT_PLUGIN"

      option_settings = [
        {
          name  = "SERVER_AUDIT_EVENTS"
          value = "CONNECT"
        },
        {
          name  = "SERVER_AUDIT_FILE_ROTATIONS"
          value = "37"
        },
      ]
    },
  ]
}
