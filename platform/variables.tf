variable "allowed_clients_cidrs" {}

variable "public_dns_zone" {}

variable "eks" {}

variable "region" {}

variable "account_id" {}

variable "argocd" {
  default = {
    name             = "argocd"
    chart            = "argo-cd"
    repository       = "https://argoproj.github.io/argo-helm"
    version          = "5.13.8"
    namespace        = "argocd"
    create_namespace = true
  }

}
