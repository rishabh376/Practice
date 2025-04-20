resource "azurerm_resource_group" "rg-dingdong1" {
  count    = 5
  name     = "shahid_kapoor"
  location = "West Europe"
}

