
### VPC ###

module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  version              = "5.1.1"
  name                 = "vpc_${var.environment}"
  cidr                 = var.vpc_cidr
  azs                  = local.azs
  private_subnets      = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 4, k)]      // up to 4091 IPs per private subnet
  public_subnets       = [for k, v in local.azs : cidrsubnet(var.vpc_cidr, 8, k + 48)] // up to 251 IPs per public subnet
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  public_subnet_tags = {
    "kubernetes.io/role/elb" = "1"
  }
  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = "1"
  }

  tags = local.tags


}
