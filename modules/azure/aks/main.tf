resource "azurerm_kubernetes_cluster" "k8" {
  name                            = var.name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  dns_prefix                      = var.dns_prefix
  kubernetes_version              = var.k8s_version
  node_resource_group             = var.node_resource_group_name
  api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges

  identity {
    type = "SystemAssigned"
  }

  dynamic "default_node_pool" {
    for_each = var.agent_pools
    content {
      name                = default_node_pool.value.name
      vm_size             = default_node_pool.value.vm_size
      os_disk_size_gb     = default_node_pool.value.os_disk_size_gb
      type                = "VirtualMachineScaleSets"
      availability_zones  = default_node_pool.value.availability_zones
      enable_auto_scaling = default_node_pool.value.enable_auto_scaling
      node_count          = default_node_pool.value.count
      min_count           = default_node_pool.value.min_count
      max_count           = default_node_pool.value.max_count
      max_pods            = default_node_pool.value.max_pods
      vnet_subnet_id      = var.vnet_subnet_id
    }
  }

  sku_tier = var.sku_tier

  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "Standard"
  }

  private_cluster_enabled = var.private_cluster_enabled

  tags = var.tags

  # lifecycle {
  #   prevent_destroy = true
  # }
}