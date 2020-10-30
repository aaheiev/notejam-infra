module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  version              = "2.63.0"
  name                 = local.resource_name
  cidr                 = var.cidr
  azs                  = data.aws_availability_zones.available.names
  private_subnets      = var.private_subnets_cidr
  public_subnets       = var.public_subnets_cidr
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  tags                 = {
    env                = var.env_name
    client             = var.client
    "kubernetes.io/cluster/${local.resource_name}" = "shared"
  }
  public_subnet_tags   = {
    "kubernetes.io/cluster/${local.resource_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }
  private_subnet_tags  = {
    "kubernetes.io/cluster/${local.resource_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }
}
