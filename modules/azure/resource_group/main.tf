resource "azurerm_resource_group" "rg" {
  name     = var.name
  location = var.location
  tags     = var.tags
  # lifecycle {
  #   prevent_destroy = true
  # }
}

# resource "azurerm_management_lock" "rg" {
#   name       = var.lock_name
#   scope      = azurerm_resource_group.rg.id
#   lock_level = var.lock_level
#   notes      = var.notes
# }

