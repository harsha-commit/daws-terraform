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

### DB Tags ###
variable "db_tags" {
  default = {}
}

variable "zone_name" {
  default = "harshadevops.site"
}
