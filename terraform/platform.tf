# Platform Bootstrap Modules
# Order:
# 1. ingress-nginx
# 2. cert-manager
# 3. argocd

module "ingress_nginx" {
  source = "./ingress-nginx"

  # Optional: if ingress module needs cluster info later
  # depends_on = []
}

module "cert_manager" {
  source = "./cert-manager"

  letsencrypt_email = var.letsencrypt_email

  depends_on = [
    module.ingress_nginx
  ]
}

module "argocd" {
  source = "./argocd"

  depends_on = [
    module.cert_manager
  ]
}
