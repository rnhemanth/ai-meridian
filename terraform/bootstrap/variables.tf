# terraform/bootstrap/variables.tf - Bootstrap Focus
variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "eu-west-2"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "ai-infra"
}

variable "github_org" {
  description = "GitHub organization or username"
  type        = string
  default = "rnhemanth"
}

variable "github_repo" {
  description = "GitHub repository name"
  type        = string
  default     = "ai-infra-project"
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"

  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0))
    error_message = "VPC CIDR must be a valid IPv4 CIDR block."
  }
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["eu-west-2a", "eu-west-2b"]

  validation {
    condition     = length(var.availability_zones) >= 2
    error_message = "Must specify at least 2 availability zones for high availability."
  }
}

variable "owner" {
  description = "Owner of the resources (for tagging)"
  type        = string
  default     = "devops-team"
}

variable "cost_center" {
  description = "Cost center for billing (for tagging)"
  type        = string
  default     = "engineering"
}

# Security-related variables
variable "enable_vpc_flow_logs" {
  description = "Enable VPC Flow Logs for security monitoring"
  type        = bool
  default     = true
}

variable "vpc_flow_log_retention_days" {
  description = "Number of days to retain VPC Flow Logs"
  type        = number
  default     = 7

  validation {
    condition     = var.vpc_flow_log_retention_days >= 1 && var.vpc_flow_log_retention_days <= 365
    error_message = "VPC Flow Log retention must be between 1 and 365 days."
  }
}
