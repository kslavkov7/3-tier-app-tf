resource "azurerm_public_ip" "pip" {
  name                = var.pip-name
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  allocation_method   = "Static"
}

resource "azurerm_linux_virtual_machine" "webvm" {
  name                  = var.web-vm-name
  resource_group_name   = azurerm_resource_group.main.name
  location              = azurerm_resource_group.main.location
  size                  = "Standard_D2s_v3"
  network_interface_ids = [azurerm_network_interface.nic.id]
  admin_username        = "adminuser"

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/3app-ssh.pub")
  }

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

  custom_data = filebase64("cloud-init.sh")
}
