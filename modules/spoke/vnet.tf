resource "azurerm_virtual_network" "nidhi_spoke_vnet" {
  name                = "${var.env}_nidhi_spoke_vnet"
  address_space       = ["10.1.0.0/23"]
  location            = var.location
  resource_group_name = azurerm_resource_group.nidhi_spoke_rg.name
}