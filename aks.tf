module "rg_aks" {
  source   = "./modules/azure/resource_group"
  name     = format("aks-%s-rg", terraform.workspace)
  location = var.region
  tags = merge(
    local.base_tags,
    {
      module_version = "local"
    }
  )
}

locals {
  roles_general = {
    aks_subnet = {
      principal_id         = module.aks.principal_id
      role_definition_name = "Network Contributor"
      scope                = module.rg_vnet.id
    }
  }
}
module "aks" {
  name                            = format("aks-%s", terraform.workspace)
  source                          = "./modules/azure/aks"
  resource_group_name             = module.rg_aks.name
  location                        = module.rg_aks.location
  node_resource_group_name        = format("aks-nodes-%s-rg", terraform.workspace)
  dns_prefix                      = format("aks-%s", terraform.workspace)
  admin_user                      = var.aks.admin_user
  agent_pools                     = var.aks.system_pool
  k8s_version                     = var.aks.version
  sku_tier                        = var.aks.sku_tier
  vnet_subnet_id                  = module.vnet.subnet_id[var.aks.system_pool_subnet]
  private_cluster_enabled         = var.aks.private_cluster_enabled
  api_server_authorized_ip_ranges = var.aks.api_server_authorized_ip_ranges
  tags = merge(
    local.base_tags,
    {
      module_version = "local"
    }
  )
}

module "aks_nodepool" {
  source                = "./modules/azure/aks_nodepools"
  for_each              = var.aks["user_pools"]
  kubernetes_cluster_id = module.aks.id
  name                  = each.key
  vm_size               = each.value.vm_size
  node_count            = each.value.node_count
  os_disk_size_gb       = each.value.os_disk_size_gb
  availability_zones    = each.value.availability_zones
  max_pods              = each.value.max_pods
  enable_auto_scaling   = each.value.enable_auto_scaling
  max_count             = each.value.max_count
  min_count             = each.value.min_count
  enable_node_public_ip = each.value.enable_node_public_ip
  vnet_subnet_id        = module.vnet.subnet_id[each.value.subnet]
  tags = merge(
    local.base_tags,
    {
      module_version = "local"
    }
  )
  depends_on = [module.aks]
}