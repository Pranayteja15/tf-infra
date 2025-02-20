terraform {
    backend "s3" {
    bucket         = "pt-tf-jenkins"
    key    = "terraform/jenkins/statefile.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-lock"

  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = "~> 1.5"
}

provider "aws" {
  default_tags {
    tags = {
      Environment = "training"
    }
  }
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "pt-tf-bucket-training"
  tags = {
    CreadtedBy = "pranay teja"
  }
}