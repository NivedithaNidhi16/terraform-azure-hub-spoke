resource "azurerm_public_ip" "nidhi_firewall_pip" {
  name                = "${var.env}_nidhi_firewall_pip"
  location            = var.location
  resource_group_name = azurerm_resource_group.nidhirg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_firewall" "nidhi_firewall" {
  name                = "${var.env}_nidhi_firewall"
  location            = var.location
  resource_group_name = azurerm_resource_group.nidhirg.name

  sku_name = "AZFW_VNet"
  sku_tier = "Standard"

  ip_configuration {
    name                 = "firewall_ip_config"
    subnet_id            = azurerm_subnet.azure_firewall_subnet.id
    public_ip_address_id = azurerm_public_ip.nidhi_firewall_pip.id
  }
}