resource "digitalocean_kubernetes_cluster" "this" {
  name    = var.cluster_name
  region  = var.region
  version = var.k8s_version

  # Attach cluster to isolated VPC
  vpc_uuid = digitalocean_vpc.this.id

  # Production-grade upgrade settings
  auto_upgrade  = true
  surge_upgrade = true

  tags = [
    "env:${var.environment}",
    "managed-by:terraform",
    "project:doks"
  ]
}
