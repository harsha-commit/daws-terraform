# EC2 Variables

variable "ami_id" {
  default = "ami-031d574cddc5bb371"
}

variable "instance_names" {
  type    = list(string)
  default = ["db", "backend", "frontend"]
}

variable "common_tags" {
  type = map(any)
  default = {
    Project   = "expense"
    Terraform = true
  }
}

# Security Group Variables

variable "sg_name" {
  default = "allow_all_ssh"
}

variable "sg_description" {
  default = "Allowing all connections via SSH"
}

variable "sg_port" {
  type = number
  # default = 22
}

variable "sg_protocol" {
  type    = string
  default = "tcp"
}
