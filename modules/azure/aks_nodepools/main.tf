resource "azurerm_kubernetes_cluster_node_pool" "pool" {
  name                  = var.name
  kubernetes_cluster_id = var.kubernetes_cluster_id
  vm_size               = var.vm_size
  node_count            = var.node_count
  node_taints           = var.node_taints
  os_disk_size_gb       = var.os_disk_size_gb
  availability_zones    = var.availability_zones
  max_pods              = var.max_pods
  max_count             = var.max_count
  min_count             = var.min_count
  enable_auto_scaling   = var.enable_auto_scaling
  enable_node_public_ip = var.enable_node_public_ip
  mode                  = var.mode
  os_type               = var.os_type
  priority              = var.priority
  vnet_subnet_id        = var.vnet_subnet_id
  tags                  = var.tags
  lifecycle {
    ignore_changes = [node_count]
  }
}