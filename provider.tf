provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_key_pair" "anand" {
  key_name   = "deployer-key"
  public_key = file("/Users/eabuhna/.ssh/id_rsa.pub")
}


terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}