terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source            = "./modules/vpc"
  vpc_cidr          = "10.0.0.0/16"
  subnet_cidr       = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

module "ec2" {
  source        = "./modules/ec2"
  ami_id        = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  subnet_id     = module.vpc.subnet_id
  vpc_id        = module.vpc.vpc_id
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = "terraform-project-${random_id.bucket.hex}"
}

resource "random_id" "bucket" {
  byte_length = 4
}
