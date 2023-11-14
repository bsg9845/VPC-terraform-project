terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.25.0"
    }
  }
  backend "s3" {
    bucket = "terraformproject0108"
    key    = "dev"
    region = "ap-sowth-1"
  }
}

provider "aws" {
 region = "ap-south-1"
}
