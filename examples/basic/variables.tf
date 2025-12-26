variable "region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "allowed_cidrs" {
  description = "CIDRs allowed to reach EKS public endpoint"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
