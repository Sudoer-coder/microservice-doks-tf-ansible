resource "helm_release" "cert_manager" {
  name       = "cert-manager"
  namespace  = kubernetes_namespace.cert_manager.metadata[0].name
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = "v1.14.4"

  create_namespace = false

  set {
    name  = "installCRDs"
    value = "true"
  }

  wait    = true
  atomic = true
  timeout = 600

  depends_on = [
    kubernetes_namespace.cert_manager
  ]
}
