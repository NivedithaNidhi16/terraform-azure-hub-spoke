resource "azurerm_network_security_group" "nidhi_spoke_nsg" {
  name                = "${var.env}_nidhi_spoke_nsg"
  location            = var.location
  resource_group_name = azurerm_resource_group.nidhi_spoke_rg.name
}

resource "azurerm_subnet_network_security_group_association" "nidhi_spoke_nsg_association" {
  subnet_id                 = azurerm_subnet.nidhi_spoke_subnet.id
  network_security_group_id = azurerm_network_security_group.nidhi_spoke_nsg.id
}