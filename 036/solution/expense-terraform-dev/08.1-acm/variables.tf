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

### Bastion Instance Tags ###
variable "backend_tags" {
  default = {}
}

variable "zone_name" {
  default = "harshadevops.site"
}
