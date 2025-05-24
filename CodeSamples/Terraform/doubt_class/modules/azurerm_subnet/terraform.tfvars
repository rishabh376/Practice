subnets = {
  snet1 = {
    name                 = "hrsubnet"
    resource_group_name  = "rg-chintu"
    virtual_network_name = "vnet-dhondhu1"
    address_prefixes     = ["192.168.1.0/24"]
  }
  snet2 = {
    name                 = "devopssubnet"
    resource_group_name  = "rg-dhondhu"
    virtual_network_name = "vnet-dhondhu2"
    address_prefixes     = ["192.169.1.0/24"]
  }
}
