variable "project_name" {
  default = "expense"
}

variable "environment" {
  default = "dev"
}

variable "common_tags" {
  default = {
    Project     = "expense"
    Environment = "dev"
    Terraform   = true
  }
}

## Database Security Group Variables ###
variable "sg_name" {
  default = "db"
}

variable "sg_description" {
  default = "Security Group for Database Instance/s"
}
