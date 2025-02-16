terraform {
  backend "s3" {
    bucket = "rds-fastfood-state"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region
}


