terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta2"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {

    bucket = "npdbucket02"
    key = "network/terraform.tfstate"
    region = "us-east-2"
    
  }
}