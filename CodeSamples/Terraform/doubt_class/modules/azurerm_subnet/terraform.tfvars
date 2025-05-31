subnets = {
  snet1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "rg-ghatak"
    virtual_network_name = "vnet-ghatak"
    address_prefixes     = ["192.168.1.0/24"]
  }
  snet2 = {
    name                 = "backend-subnet"
    resource_group_name  = "rg-ghatak"
    virtual_network_name = "vnet-ghatak"
    address_prefixes     = ["192.168.2.0/24"]
  }
}
