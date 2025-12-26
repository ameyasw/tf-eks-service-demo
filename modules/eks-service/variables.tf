variable "name" {
  description = "Base name for resources"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "tags" {
  description = "Tags to apply to AWS resources"
  type        = map(string)
  default     = {}
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
  default     = "10.0.0.0/16"
}

variable "kubernetes_version" {
  description = "EKS Kubernetes version"
  type        = string
  default     = "1.29"
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "CIDRs allowed to access the EKS public endpoint"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "node_instance_types" {
  description = "Managed node group instance types"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "min_size" {
  type    = number
  default = 1
}

variable "max_size" {
  type    = number
  default = 3
}

variable "desired_size" {
  type    = number
  default = 2
}

variable "service_namespace" {
  description = "Kubernetes namespace to deploy into"
  type        = string
  default     = "demo"
}

variable "service_name" {
  description = "Kubernetes app name (deployment/service)"
  type        = string
  default     = "web"
}

variable "image" {
  description = "Public container image"
  type        = string
  default     = "nginx:1.27"
}

variable "container_port" {
  description = "Container port"
  type        = number
  default     = 80
}

variable "replicas" {
  description = "Deployment replicas"
  type        = number
  default     = 2
}

variable "service_port" {
  description = "Kubernetes Service port"
  type        = number
  default     = 80
}
