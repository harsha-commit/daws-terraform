variable "tags" {
  default = {
    Name        = "web"
    Environment = "dev"
  }
}

variable "instance_type" {
  default = "t2.micro"
}

variable "port" {
  default = 22
}

variable "protocol" {
  default = "tcp"
}