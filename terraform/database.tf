resource "digitalocean_database_cluster" "mysql" {
  name       = var.db_name
  engine     = var.db_engine
  version    = var.db_version
  size       = var.db_size
  region     = var.region
  node_count = var.db_node_count

  private_network_uuid = digitalocean_vpc.this.id
}
