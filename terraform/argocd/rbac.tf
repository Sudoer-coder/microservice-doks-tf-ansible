resource "kubernetes_config_map" "argocd_rbac" {
  metadata {
    name      = "argocd-rbac-cm"
    namespace = "argocd"
  }

  data = {
    "policy.default" = "role:readonly"
  }
}
