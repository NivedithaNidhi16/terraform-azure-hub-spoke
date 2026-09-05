resource "azurerm_public_ip" "nidhi_bastion_pip" {
  name                = "${var.env}_nidhi_bastion_pip"
  location            = var.location
  resource_group_name = azurerm_resource_group.nidhirg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "nidhi_bastion" {
  name                = "${var.env}_nidhi_bastion"
  location            = var.location
  resource_group_name = azurerm_resource_group.nidhirg.name

  sku = "Basic"

  ip_configuration {
    name                 = "bastion_ip_config"
    subnet_id            = azurerm_subnet.azure_bastion_subnet.id
    public_ip_address_id = azurerm_public_ip.nidhi_bastion_pip.id
  }
}