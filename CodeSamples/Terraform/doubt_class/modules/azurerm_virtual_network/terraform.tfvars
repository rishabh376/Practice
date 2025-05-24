vnets = {
  vnet1 = {
    name                = "vnet-dhondhu1"
    location            = "centralindia"
    resource_group_name = "rg-chintu"
    address_space       = ["192.168.0.0/16"]
  }
  vnet2 = {
    name                = "vnet-dhondhu2"
    location            = "westus"
    resource_group_name = "rg-dhondhu"
    address_space       = ["192.169.0.0/16"]
  }
}
