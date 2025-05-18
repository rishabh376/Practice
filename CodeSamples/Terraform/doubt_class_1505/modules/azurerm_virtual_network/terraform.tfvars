virtual_networks = {
  vnet1 = {
    name                = "vnet1"
    location            = "West Europe"
    resource_group_name = "rg-dhondhu"
    address_space       = ["10.0.0.0/16"]
  }
  vnet2 = {
    name                = "vnet2"
    location            = "East US"
    resource_group_name = "rg-tondu"
    address_space       = ["10.1.0.0/16"]
  }
}
