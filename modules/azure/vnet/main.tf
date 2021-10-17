
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  address_space       = var.address_space
  resource_group_name = var.resource_group_name
  dns_servers         = var.dns_servers
  tags                = var.tags
  # lifecycle {
  #   prevent_destroy = true
  # }
}

resource "azurerm_subnet" "subnet" {
  for_each                                       = var.subnets
  name                                           = each.key
  virtual_network_name                           = azurerm_virtual_network.vnet.name
  resource_group_name                            = var.resource_group_name
  address_prefixes                               = [each.value]
  # lifecycle {
  #   prevent_destroy = true
  # }
}
resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
  # lifecycle {
  #   prevent_destroy = true
  # }
}

resource "azurerm_subnet_network_security_group_association" "nsga" {
  for_each                  = var.subnets
  subnet_id                 = azurerm_subnet.subnet[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg.id
  # lifecycle {
  #   prevent_destroy = true
  # }  
}