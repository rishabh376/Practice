variable "rg_name" {}
variable "rg_location" {}

resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.rg_location
}

output "chintu_name" {
  value = azurerm_resource_group.rg.name
}

output "chintu_location" {
  value = azurerm_resource_group.rg.location
}