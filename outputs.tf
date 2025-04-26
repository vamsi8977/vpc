output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_arn" {
  description = "The ARN of the VPC"
  value       = module.vpc.vpc_arn
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

output "nat_gateway_ids" {
  description = "List of NAT Gateway IDs"
  value       = module.vpc.natgw_ids
}

output "igw_id" {
  description = "Internet Gateway ID"
  value       = module.vpc.igw_id
}

output "default_security_group_id" {
  description = "The ID of the default security group created in the VPC"
  value       = module.vpc.default_security_group_id
}

output "public_route_table_ids" {
  description = "List of public route table IDs"
  value       = module.vpc.public_route_table_ids
}

output "private_route_table_ids" {
  description = "List of private route table IDs"
  value       = module.vpc.private_route_table_ids
}

output "vpc_flow_log_id" {
  description = "ID of the VPC flow log"
  value       = module.vpc.vpc_flow_log_id
}

output "vpc_flow_log_cloudwatch_iam_role_arn" {
  description = "The ARN of the IAM role used for VPC flow logs to CloudWatch"
  value       = module.vpc.vpc_flow_log_cloudwatch_iam_role_arn
}
