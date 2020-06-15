variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = var.aws_region
}

resource "aws_vpc" "henchman-ci-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "henchman-ci-vpc"
  }
}

resource "aws_subnet" "henchman-ci-subnet" {
  vpc_id = "${aws_vpc.henchman-ci-vpc.id}"
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "henchman-ci-subnet-1"
  }
}

