resource "azurerm_resource_group" "resource_group" {
  for_each = toset(var.rg_names)
  name     = each.key
  location = "West Europe"
}