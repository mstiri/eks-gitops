
# Create random password for ArgoCD admin user
resource "random_password" "argocd" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

# The password should be bcrypt for ArgoCD.
resource "bcrypt_hash" "argo" {
  cleartext = random_password.argocd.result
}

# Store the admin password in Secret Manager
resource "aws_secretsmanager_secret" "argocd" {
  name                    = "argocd"
  recovery_window_in_days = 0
}
resource "aws_secretsmanager_secret_version" "argocd" {
  secret_id     = aws_secretsmanager_secret.argocd.id
  secret_string = random_password.argocd.result
}

# Create the Helm Release
resource "helm_release" "argocd" {
  name             = try(var.argocd["helm_release_name"], "argocd")
  namespace        = try(var.argocd["namespace"], "argocd")
  repository       = var.argocd["repository"]
  chart            = var.argocd["chart"]
  version          = var.argocd["version"]
  create_namespace = try(var.argocd["create_namespace"], true)
  values           = [file("${path.module}/argocd-values.yaml")]

  set_sensitive {
    name = "configs.secret.argocdServerAdminPassword"
    value = bcrypt_hash.argo.id
  }
}
