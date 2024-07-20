# Project Variables
variable "project_name" {
  type = string
}

variable "environment" {
  type    = string
  default = "dev"
}

# VPC Variables

variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "enable_dns_support" {
  type    = bool
  default = true
}

variable "enable_dns_hostnames" {
  type    = bool
  default = true
}

variable "vpc_tags" {
  type    = map(any)
  default = {}
}

# IGW Variables

variable "igw_tags" {
  type    = map(any)
  default = {}
}

# Subnet Variables

variable "public_subnets" {
  type = list(any)
  validation {
    condition     = length(var.public_subnets) == 2
    error_message = "Please provide exactly 2 public subnet CIDRs"
  }
}

variable "private_subnets" {
  type = list(any)
  validation {
    condition     = length(var.private_subnets) == 2
    error_message = "Please provide exactly 2 private subnet CIDRs"
  }
}

variable "database_subnets" {
  type = list(any)
  validation {
    condition     = length(var.database_subnets) == 2
    error_message = "Please provide exactly 2 database subnet CIDRs"
  }
}

variable "subnet_tags" {
  type    = map(any)
  default = {}
}
