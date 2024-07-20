terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.55.0"
    }
  }
  backend "s3" {
    bucket         = "harshadevops-practice"
    key            = "assignment-31-sg"
    region         = "us-east-1"
    dynamodb_table = "harshadevops"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}
