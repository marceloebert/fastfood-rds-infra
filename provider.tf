terraform {
  backend "s3" {
    bucket = "rds-fastfood-tf-state"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region
}


