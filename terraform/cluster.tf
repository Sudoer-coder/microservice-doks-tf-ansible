resource "digitalocean_kubernetes_cluster" "this" {
  name    = var.cluster_name
  region  = var.region
  version = var.k8s_version

  # Attach cluster to isolated VPC
  vpc_uuid = digitalocean_vpc.this.id

  # Enable automatic upgrades
  auto_upgrade  = true
  surge_upgrade = true

  # Highly recommended for production stability
  ha = false  # set true only if you want high availability control plane

  tags = [
    "env:${var.environment}",
    "managed-by:terraform",
    "project:doks"
  ]
}
