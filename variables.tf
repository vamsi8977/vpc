# ======================================================
# AWS
# ======================================================

variable "aws_region" {
  description = "provide the aws_region"
  type        = string
}

# ======================================================
# Tags
# ======================================================

variable "app_id" {
  description = "An App ID identifies your app in a provisioning profile"
  type        = string
}

variable "environment" {
  description = "provide some environment name"
  type        = string
}

variable "mail" {
  description = "provide an email to send mails"
  type        = string
}

variable "name" {
  description = "provide an email to send mails"
  type        = string
}

# ======================================================
# Module
# ======================================================

variable "vpc_cidr" {
  type        = string
  description = "CIDR value for VPC"
}

variable "azs" {
  type        = list(string)
  description = "Provide list of availability zones"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
}

variable "enable_nat_gateway" {
  type        = bool
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  default     = true
}

variable "enable_vpn_gateway" {
  type        = bool
  description = "Should be true if you want to create a new VPN Gateway resource and attach it to the VPC"
  default     = false
}

variable "enable_flow_log" {
  type        = bool
  description = "Whether or not to enable VPC Flow Logs"
  default     = true
}

variable "create_flow_log_cloudwatch_log_group" {
  type        = bool
  description = "Whether to create CloudWatch log group for VPC Flow Logs"
  default     = true
}

variable "create_flow_log_cloudwatch_iam_role" {
  type        = bool
  description = "Whether to create IAM role for VPC Flow Logs"
  default     = true
}

variable "flow_log_cloudwatch_log_group_retention_in_days" {
  type        = string
  description = "Specifies the number of days you want to retain log events in the specified log group for VPC flow logs"
  default     = "7"
}
