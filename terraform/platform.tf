module "ingress_nginx" {
  source = "./ingress-nginx"
}

module "argocd" {
  source = "./argocd"

  depends_on = [
    module.ingress_nginx
  ]
}
