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
    Component   = "frontend"
  }
}

### Bastion Instance Tags ###
variable "frontend_tags" {
  default = {}
}

variable "zone_name" {
  default = "harshadevops.site"
}
