variable "region" {
  default     = "eu-west-1"
  description = "AWS region"
}

variable "env_name" {
  default     = "nc-demo"
  description = "Environment name"
}

variable "client" {
  default     = "nordcloud"
  description = "Client"
}

data "aws_availability_zones" "available" {}
data "aws_caller_identity" "current" {}

resource "random_string" "suffix" {
  length      = 6
  upper       = false
  special     = false
}

locals {
  resource_name = "${var.env_name}-${random_string.suffix.result}"
  labels        = {
    env         = var.env_name
    client      = var.client
  }
}

variable "cidr" {
  description = "CIDR to use for the VPC"
  default     = "10.0.0.0/16"
}

variable "private_subnets_cidr" {
  description = "CIDR used for private subnets"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets_cidr" {
  description = "CIDR used for private subnets"
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

//variable "k8s_cluster_name" {
//  default = "eks-k8s-demo-dev-cluster"
//}
//
//variable "repository_name" {
//  default = "eks-k8s-demo-app"
//}
