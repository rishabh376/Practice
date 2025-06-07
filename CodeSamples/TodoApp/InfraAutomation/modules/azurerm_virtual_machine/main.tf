resource "azurerm_public_ip" "pip" {
  name                = "pip-tintuvm"
  resource_group_name = "rg-tinku"
  location            = "centralindia"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "nic" {
  name                = "tinku-nic"
  location            = "centralindia"
  resource_group_name = "rg-tinku"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "/subscriptions/1075ec7a-b17a-4f37-bf3f-9d68c4506dc1/resourceGroups/rg-chintu/providers/Microsoft.Network/virtualNetworks/demovm-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "tinkuvm"
  resource_group_name = "rg-tinku"
  location            = "centralindia"
  size                = "Standard_F2"
  admin_username      = "tinkuadmin"
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  # HW -  Find how to use admin password instead of SSH key
  # admin_ssh_key {
  #   username   = "adminuser"
  #   public_key = file("~/.ssh/id_rsa.pub")
  # }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}