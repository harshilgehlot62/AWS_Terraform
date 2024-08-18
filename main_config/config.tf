terraform {
  required_version = "~> 1.8.5"
  backend "s3" {
    bucket         = "my-bucket123"
    key            = "awslb.tfstate"
    region         =  "var.region"
    dynamodb_table = "terraform-state-locking"
  }
  required_providers {
     aws = {
      source  = "hashicorp/aws"
      version = "~> 4.9.0"
    }
  }
}


provider "aws" {
   alias  = "remote"
   region = var.region
}