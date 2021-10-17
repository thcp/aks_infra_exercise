output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "vnet_location" {
  value = azurerm_virtual_network.vnet.location
}

output "vnet_address_space" {
  value = azurerm_virtual_network.vnet.address_space
}

output "subnet_id" {
  value = { for k, v in azurerm_subnet.subnet : k => v.id }
}

output "subnet_name" {
  value = { for k, v in azurerm_subnet.subnet : k => v.name }
}