### Project Level Variables ###

variable "project_name" {
  type = string
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "common_tags" {
  type    = map(any)
  default = {}
}

### Security Group Variables ###

variable "vpc_id" {
  type = string
}

variable "sg_name" {
  type = string
}

variable "sg_description" {
  type = string
}

variable "inbound_rules" {
  type    = list(any)
  default = []
}

variable "outbound_rules" {
  type = list(any)
  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "sg_tags" {
  type    = map(any)
  default = {}
}
