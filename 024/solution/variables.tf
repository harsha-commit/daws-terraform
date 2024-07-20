# EC2 Variables

variable "instance_names" {
  # default = ["backend", "db", "frontend"]
  default = {
    "db" : "t2.small",
    "backend" : "t2.micro",
    "frontend" : "t2.micro"
  }
}

variable "common_tags" {
  default = {
    Project   = "Expense"
    Terraform = true
  }
}

# Security Group Variables

variable "sg_name" {
  default = "allow_ssh"
}

variable "sg_description" {
  default = "Allows all SSH incoming and outgoing connections"
}

variable "sg_port" {
  default = 22
}

variable "sg_protocol" {
  default = "tcp"
}

variable "sg_cidr_blocks" {
  default = ["0.0.0.0/0"]
}

variable "inbound_rules" {
  default = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}
