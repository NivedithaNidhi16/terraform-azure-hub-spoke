resource "azurerm_virtual_network" "nidhivnet" {
  name                = "${var.env}_nidhivnet"
  address_space       = ["10.0.0.0/23"]
  location            = var.location
  resource_group_name = azurerm_resource_group.nidhirg.name
}
