# Project Variables

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

# VPC Variables

variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
  type    = bool
  default = true
}

variable "enable_dns_support" {
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

variable "availability_zones" {
  type = list(string)
}

variable "public_subnets" {
  type = list(any)
  validation {
    condition     = length(var.public_subnets) == 2
    error_message = "Please provide only 2 public subnets"
  }
}

variable "private_subnets" {
  type = list(any)
  validation {
    condition     = length(var.private_subnets) == 2
    error_message = "Please provide only 2 private subnets"
  }
}

variable "database_subnets" {
  type = list(any)
  validation {
    condition     = length(var.database_subnets) == 2
    error_message = "Please provide only 2 database subnets"
  }
}

variable "subnet_tags" {
  type    = map(any)
  default = {}
}

# NAT Variables

variable "nat_tags" {
  type    = map(any)
  default = {}
}

# EIP Variables

variable "eip_tags" {
  type    = map(any)
  default = {}
}

# RTB Variable

variable "rtb_tags" {
  type    = map(any)
  default = {}
}

# Peering Variables

variable "peering_tags" {
  type    = map(any)
  default = {}
}
