module "virtual_network" {
  source     = "../modules/azurerm_virtual_network"

  virtual_network_name     = "vnet-lb"
  virtual_network_location = "centralindia"
  resource_group_name      = "rg-devopsinsiders"
  address_space            = ["10.0.0.0/16"]
}

module "frontend_subnet" {
  depends_on = [module.virtual_network]
  source     = "../modules/azurerm_subnet"

  resource_group_name  = "rg-devopsinsiders"
  virtual_network_name = "vnet-lb"
  subnet_name          = "frontend-subnet"
  address_prefixes     = ["10.0.1.0/24"]
}

module "chinki_vm" {
  source               = "../modules/azurerm_virtual_machine"
  depends_on           = [module.virtual_network, module.frontend_subnet]
  resource_group_name  = "rg-devopsinsiders"
  location             = "centralindia"
  vm_name              = "chinki-vm"
  vm_size              = "Standard_B1s"
  admin_username       = "devopsadmin"
  admin_password       = "P@ssw01rd@123"
  image_publisher      = "Canonical"
  image_offer          = "0001-com-ubuntu-server-focal"
  image_sku            = "20_04-lts"
  image_version        = "latest"
  nic_name             = "nic-chinki-vm"
  vnet_name            = "vnet-lb"
  frontend_subnet_name = "frontend-subnet"
}

module "pinki_vm" {
  source               = "../modules/azurerm_virtual_machine"
  depends_on           = [module.virtual_network, module.frontend_subnet]
  resource_group_name  = "rg-devopsinsiders"
  location             = "centralindia"
  vm_name              = "pinki-vm"
  vm_size              = "Standard_B1s"
  admin_username       = "devopsadmin"
  admin_password       = "P@ssw01rd@123"
  image_publisher      = "Canonical"
  image_offer          = "0001-com-ubuntu-server-focal"
  image_sku            = "20_04-lts"
  image_version        = "latest"
  nic_name             = "nic-pinki-vm"
  vnet_name            = "vnet-lb"
  frontend_subnet_name = "frontend-subnet"
}

module "public_ip_lb" {
  source              = "../modules/azurerm_public_ip"
  public_ip_name      = "loadbalancer_ip"
  resource_group_name = "rg-devopsinsiders"
  location            = "centralindia"
  allocation_method   = "Static"
}

module "lb" {
  depends_on = [module.public_ip_lb]
  source     = "../modules/azurerm_loadbalancer"
}
