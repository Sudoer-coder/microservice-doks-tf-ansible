resource "digitalocean_kubernetes_cluster" "this" {
  name    = var.cluster_name
  region  = var.region
  version = var.k8s_version

  vpc_uuid = digitalocean_vpc.this.id

  auto_upgrade  = true
  surge_upgrade = true
  ha            = false

  # Default node pool (small intial + autoscaling)
  node_pool {
    name       = "small-pool"
    size       = var.nodepool_size

    auto_scale = true
    min_nodes  = var.small_nodepool_count_min
    max_nodes  = var.small_nodepool_count_max

     labels = {
      pool  = "small"
      phase = "initial"
      role  = "workload"
    }

    taint {
      key    = "workload"
      value  = "small"
      effect = "NoSchedule"
    }

    tags = [
      "pool:small",
      "phase:initial",
      "env:${var.environment}"
    ]
  }

  tags = [
    "env:${var.environment}",
    "managed-by:terraform",
    "project:dd-doks"
  ]

  lifecycle {
    prevent_destroy = true
  }
}
