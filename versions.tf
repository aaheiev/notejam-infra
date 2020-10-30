terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  version = "~> 3.12.0"
  region  = "eu-west-1"
}

provider "random" {
  version = "~> 3.0.0"
}

provider "local" {
 version = "~> 2.0.0"
}

provider "null" {
  version = "~> 3.0.0"
}

provider "template" {
  version = "~> 2.2.0"
}
