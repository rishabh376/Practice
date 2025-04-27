resource "azurerm_resource_group" "resource_group" {
  count    = length(var.rg_names)
  name     = var.rg_names[count.index]
  location = "West Europe"
}

