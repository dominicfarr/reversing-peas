variable "aws_region" {
  type = string
}

variable "domain_name" {
  type = string
}

provider "aws" {
  region = var.aws_region
  version = "~> 2.52"
}

terraform {
  backend "remote" {
    organization = "domfarr"

    workspaces {
      name = "reversing-peas"
    }
  }
}

module "website" {
  source = "./.deploy/terraform/static-site"
  domain_name = var.domain_name
}