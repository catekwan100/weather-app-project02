terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
   backend "s3" {
    bucket         = "testt132"
    key            = "terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "testt132"
    encrypt        = true
  }
}