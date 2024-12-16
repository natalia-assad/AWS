terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  profile = "user_terraform"
}
# RESOURCE
resource "aws_s3_bucket" "example" {
  bucket = "bucket-create-by-terraform-new-name"
    tags = {
    CreatedAt = "2024-12-12"
    ManagedBy = "Terraform"
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.example.id #aqui referencio o bucket que quero criar o versionamento
  versioning_configuration {
    status = "Enabled"
  }
}