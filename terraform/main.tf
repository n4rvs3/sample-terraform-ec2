## Variables ##
# variable "aws_access_key" {}
# variable "aws_secret_key" {}
variable "aws_region" {
  type    = string
  default = "ap-northeast-1"
}
variable "aws_profile" {
}

variable "amis" {
  type = map(string)
  default = {
    us-east-1      = "ami-0dc185deadd3ac449"
    us-west-2      = "ami-014612c2d9afaf1ac"
    ap-northeast-1 = "ami-01748a72bed07727c"
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 1.2.0"
    }
  }
}

## Provider ##
provider "aws" {
  # access_key = var.aws_access_key
  # secret_key = var.aws_secret_key
  region  = var.aws_region
  profile = var.aws_profile
}

## Main ##
resource "aws_instance" "example" {
  ami           = lookup(var.amis, var.aws_region)
  instance_type = "t2.micro"
  tags = {
    terraform = "true"
  }
}
