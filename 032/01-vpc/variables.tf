# Project Variables

variable "project_name" {
  default = "expense"
}

variable "environment" {
  default = "dev"
}

# VPC Variables

variable "availability_zones" {
  default = ["us-east-1a", "us-east-1d"]
}

variable "public_subnets" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  default = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "database_subnets" {
  default = ["10.0.21.0/24", "10.0.22.0/24"]
}
