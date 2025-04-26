# ======================================================
# VPC
# ======================================================

module "vpc" {
  source                                          = "terraform-aws-modules/vpc/aws"
  version                                         = "5.21.0"
  name                                            = "${var.aws_region}-${var.environment}-vpc"
  azs                                             = var.azs
  cidr                                            = var.vpc_cidr
  private_subnets                                 = var.private_subnet_cidrs
  public_subnets                                  = var.public_subnet_cidrs
  enable_nat_gateway                              = var.enable_nat_gateway
  enable_vpn_gateway                              = var.enable_vpn_gateway
  enable_flow_log                                 = var.enable_flow_log
  create_flow_log_cloudwatch_log_group            = var.create_flow_log_cloudwatch_log_group
  create_flow_log_cloudwatch_iam_role             = var.create_flow_log_cloudwatch_iam_role
  flow_log_cloudwatch_log_group_retention_in_days = var.flow_log_cloudwatch_log_group_retention_in_days
  tags = {
    "kubernetes.io/role/internal-elb"                                = "1"
    "kubernetes.io/cluster/${var.aws_region}-${var.environment}-eks" = "owned"
  }
}

resource "aws_security_group" "vpc" {
  name        = "${var.aws_region}-${var.environment}-private-nat"
  description = "Allow outbound Lambda traffic through NAT gateway"
  vpc_id      = module.vpc.vpc_id
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_network_acl" "vpc" {
  vpc_id = module.vpc.vpc_id
  tags = {
    name = "${var.aws_region}-${var.environment}-vpc-nacl"
  }
}
