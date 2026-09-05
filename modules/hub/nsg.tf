resource "azurerm_network_security_group" "nidhinsg" {
  name                = "${var.env}_nidhinsg"
  location            = var.location
  resource_group_name = azurerm_resource_group.nidhirg.name
}