resource "helm_release" "nginx_ingress" {
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  namespace  = kubernetes_namespace.ingress.metadata[0].name
  version    = "4.10.1"

  create_namespace = false

  values = [
    <<-EOF
controller:
  service:
    type: LoadBalancer
  admissionWebhooks:
    enabled: true
EOF
  ]

  wait    = true
  timeout = 600

  depends_on = [
    kubernetes_namespace.ingress
  ]
}
