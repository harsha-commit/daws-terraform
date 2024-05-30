### Project Variables ###

variable "project_name" {
  type = string
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "common_tags" {
  type = map(any)
}

### VPC Variables ###

variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "instance_tenancy" {
  type    = string
  default = "default"
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

### Public Subnet Variables ###

variable "public_cidr_blocks" {
  type = list(string)
  validation {
    condition     = length(var.public_cidr_blocks) == 2
    error_message = "Please provide only 2 Public Subnets"
  }
}

variable "map_public_ip_on_launch" {
  type    = bool
  default = true
}

variable "public_subnet_tags" {
  type    = map(any)
  default = {}
}

### Private Subnet Variables ###

variable "private_cidr_blocks" {
  type = list(string)
  validation {
    condition     = length(var.private_cidr_blocks) == 2
    error_message = "Please provide only 2 Private Subnets"
  }
}

variable "private_subnet_tags" {
  type    = map(any)
  default = {}
}

### Database Subnet Variables ###

variable "database_cidr_blocks" {
  type = list(string)
  validation {
    condition     = length(var.database_cidr_blocks) == 2
    error_message = "Please provide only 2 Database Subnets"
  }
}

variable "database_subnet_tags" {
  type    = map(any)
  default = {}
}

### IGW Variables ###

variable "igw_tags" {
  type    = map(any)
  default = {}
}

### EIP Variables ###

variable "eip_tags" {
  type    = map(any)
  default = {}
}

### NAT Variables ###

variable "nat_tags" {
  type    = map(any)
  default = {}
}

### Public Route Table Variables ###

variable "public_rtb_tags" {
  type    = map(any)
  default = {}
}

### Private Route Table Variables ###

variable "private_rtb_tags" {
  type    = map(any)
  default = {}
}

### Database Route Table Variables ###

variable "database_rtb_tags" {
  type    = map(any)
  default = {}
}

### Peering Variables ###

variable "is_peering_required" {
  type    = bool
  default = false
}

variable "peer_vpc_id" {
  type    = string
  default = ""
}