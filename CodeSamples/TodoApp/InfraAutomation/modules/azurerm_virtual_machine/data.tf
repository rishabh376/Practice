data "azurerm_public_ip" "kuch_bhi_ip" {
  name                = var.frontend_ip_name
  resource_group_name = var.resource_group_name
}

data "azurerm_subnet" "frontend_subnet" {
  name                 = var.frontend_subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = "rg-todoapp"
}

data "azurerm_key_vault" "kv" {
  name                = "devopskitijori"
  resource_group_name = "rg-keyvault"
}

data "azurerm_key_vault_secret" "vm-username" {
  name         = "vm-username"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "vm-password" {
  name         = "vm-password"
  key_vault_id = data.azurerm_key_vault.kv.id
}