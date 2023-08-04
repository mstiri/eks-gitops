variable "vpc_cidr" {
  description = "IPv4 CIDR block for the VPC"
  type        = string
  default     = "172.16.0.0/16"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "region" {
  description = "Target AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "cluster_version" {
  description = "The Kubernetes version to be used for the EKS cluster"
  type        = string
  default     = "1.25"
}

variable "kubeapi_allowed_cidrs" {
  description = "A list of IPv4 CIDRs to allow for the Kube API"
  type        = list(string)
  default     = []
}

variable "allowed_clients_cidrs" {
  description = "A list of IPv4 CIDRs to allow to access services (Ingress Controller)"
  type        = list(string)
  default     = []
}

variable "public_dns_zone" {
  description = "The public DNS domain name to use to deploy services"
  type        = string
}

variable "gitlab_base_url" {
  description = "The base URL of your GitLab instance"
  type        = string
  default     = "https://gitlab.com"
}

variable "gitlab_token" {
  description = "The GitLab Token for provider configuration"
  type        = string
}

variable "argo_app_repo_path" {
  description = "The path to the Argo Apps on the GitLab instance"
  type        = string
  default     = "infrastructure/eks-argo-apps"
}
