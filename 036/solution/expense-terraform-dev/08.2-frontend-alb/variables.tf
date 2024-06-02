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

variable "frontend_alb_tags" {
  default = {}
}

variable "zone_name" {
  default = "harshadevops.site"
}
