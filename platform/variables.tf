variable "allowed_clients_cidrs" {}

variable "public_dns_zone" {}

variable "eks" {}

variable "region" {}

variable "account_id" {}

variable "cert-manager" {
  default = {
    chart_version   = "1.11.2"
    namespace       = "system"
    service_account = "cert-manager"
  }
}

variable "kube-cert-acm" {
  default = {
    enabled         = false
    chart_version   = "0.0.3"
    namespace       = "system"
    service_account = "kube-cert-acm"
    helm_repository = "https://mstiri.github.io/kube-cert-acm"
  }
}

variable "external-dns" {
  default = {
    chart_version   = "6.20.1"
    namespace       = "system"
    service_account = "external-dns"
  }
}

variable "ingress" {
  default = {
    namespace     = "system"
    chart_version = "4.6.1"
    timeout       = "600"
  }
}

variable "acme_email" {}
