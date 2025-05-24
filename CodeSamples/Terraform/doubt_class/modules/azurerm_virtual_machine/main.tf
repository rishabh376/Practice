resource "azurerm_network_interface" "vmfalanwa-nic" {
  name                = "vmfalanwa-nic"
  location            = "westus"
  resource_group_name = "rg-falanwa"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "/subscriptions/1075ec7a-b17a-4f37-bf3f-9d68c4506dc1/resourceGroups/rg-tinku-vm/providers/Microsoft.Network/virtualNetworks/vnet-tinkua/subnets/snet-frontend"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "falanwa" {
  name                = "vmfalanwa"
  resource_group_name = "rg-falanwa"
  location            = "westus"
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

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