variable "ami" {
  type    = string
  default = "ami-090252cbe067a9e58"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "port" {
  type    = number
  default = 0
}

variable "protocol" {
  type    = string
  default = "-1"
}

variable "cidr_blocks" {
  type    = list(string)
  default = []
}