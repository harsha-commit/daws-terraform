terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "harshadevops-practice"
    key            = "assignment-32.1-sg"
    region         = "us-east-1"
    dynamodb_table = "harshadevops"
  }
}

provider "aws" {
  region = "us-east-1"
}
