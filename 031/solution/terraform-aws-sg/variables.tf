# Project Variables

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

# VPC Variables

variable "vpc_id" {
  type = string
}

# Security Group Variables

variable "sg_name" {
  type = string
}

variable "sg_description" {
  type = string
}
