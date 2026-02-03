resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"

    labels = {
      "pod-security.kubernetes.io/enforce" = "baseline"
    }
  }
}
