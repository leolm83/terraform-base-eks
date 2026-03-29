terraform {
  backend "s3" {
    bucket       = "leolms-tfstate-files"
    key          = "cluster/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.region
  default_tags {
    tags = var.tags
  }
  assume_role {
    role_arn    = var.assume_role.role_arn
    external_id = var.assume_role.external_id
  }
}
