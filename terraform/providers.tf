terraform {
required_version = ">= 1.4"
required_providers {
aws = {
source = "hashicorp/aws"
version = "~> 5.0"
}
}


# Optional: backend configuration for remote state (S3)
backend "s3" {
bucket = var.tf_state_bucket
key = var.tf_state_key
region = var.aws_region
 }
}


provider "aws" {
region = var.aws_region
}