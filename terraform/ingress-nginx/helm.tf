resource "helm_release" "nginx_ingress" {
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  namespace  = kubernetes_namespace.ingress.metadata[0].name

  values = [<<EOF
controller:
  service:
    type: LoadBalancer
  admissionWebhooks:
    enabled: true
EOF
  ]

  depends_on = [
    kubernetes_namespace.ingress
  ]
}
