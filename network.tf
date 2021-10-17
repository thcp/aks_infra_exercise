module "rg_vnet" {
  source   = "./modules/azure/resource_group"
  name     = format("vnet-%s-rg", terraform.workspace)
  location = var.region
  tags = merge(
    local.base_tags,
    {
      module_version = "local"
    }
  )
}

module "vnet" {
  source              = "./modules/azure/vnet"
  vnet_name           = format("vnet-%s", terraform.workspace)
  nsg_name            = format("nsg-%s", terraform.workspace)
  resource_group_name = module.rg_vnet.name
  location            = var.region
  address_space       = var.network.address_space
  subnets             = var.network.subnets
  tags = merge(
    local.base_tags,
    {
      module_version = "local"
    }
  )
}

module "nsg_rules" {
  for_each                    = var.network.network_security_rules
  source                      = "./modules/azure/network_security_rules"
  name                        = each.key
  priority                    = each.value["priority"]
  direction                   = each.value["direction"]
  access                      = each.value["access"]
  protocol                    = each.value["protocol"]
  source_port_range           = each.value["source_port_range"]
  destination_port_ranges     = each.value["destination_port_ranges"]
  source_address_prefixes     = each.value["source_address_prefixes"]
  destination_address_prefix  = each.value["destination_address_prefix"]
  resource_group_name         = module.rg_vnet.name
  network_security_group_name = format("nsg-%s", terraform.workspace)
  depends_on                  = [module.vnet]
}