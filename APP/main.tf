terraform {
  backend "s3" {
    bucket       = "sctp-tfstate-ce13"
    key          = "astra_app/terraform.tfstate"
    region       = "us-east-1"
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
   region = "us-east-1"
}