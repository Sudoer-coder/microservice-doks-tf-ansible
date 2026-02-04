resource "helm_release" "ingress_nginx_controller" { # Changed name slightly
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.11.3"

  namespace        = "ingress-nginx"
  create_namespace = true


  set {
    name  = "controller.service.type"
    value = "LoadBalancer"
  }

  # DO Specific: Use a descriptive name for the LB in your DO dashboard
  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/do-loadbalancer-name"
    value = "dd-k8s-ingress-lb"
  }
}