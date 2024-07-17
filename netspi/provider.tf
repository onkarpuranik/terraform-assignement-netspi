
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.58.0"
    }
  }

  // To Maintain the state file
  backend "s3" {
    bucket         = "terraform-state-bucket"
    key            = "terraform/state"
    region         = var.region
    encrypt        = true
    dynamodb_table = "terraform-lock-table"
  }
}

// If you are using the secret key and access key for user
/*provider "aws" {

  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key

  region = var.region

  default_tags {
    tags = {
      Environment = "Dev"
      Name        = "ABC Team"
    }
  }

}*/


// If you are using the sts assume role
provider "aws" {
  assume_role {
    role_arn     = var.role_arn
    session_name = "Test_Session"
  }
  region = var.region

  default_tags {
    tags = {
      Environment = "Dev"
      Owner        = "ABC Team"
    }
  }
}


