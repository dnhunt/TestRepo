terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"

    }
  }

  backend "s3" {
    bucket         = "ecs-terraform-remote-state-s3"
    key            = "vpc.tfstate"
    region         = "ca-central-1"
    encrypt        = "true"
    dynamodb_table = "ecs-terraform-remote-state-dynamodb"
  }
}

provider "aws" {
  region     = var.aws_region
}

