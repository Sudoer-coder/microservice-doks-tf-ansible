resource "time_sleep" "wait_for_cert_manager_crds" {
  depends_on = [
    helm_release.cert_manager
  ]

  create_duration = "30s"
}
