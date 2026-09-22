resource "azurerm_linux_virtual_machine" "nidhi_spoke_vm" {
  name                = "${var.env}-nidhi-spoke-vm"
  location            = var.location
  resource_group_name = azurerm_resource_group.nidhi_spoke_rg.name
  size                = "Standard_B1s"

  admin_username = var.vm_admin_username
  admin_password = var.vm_admin_password

  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.nidhi_spoke_nic.id
  ]
    identity {
    type = "SystemAssigned"
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
}