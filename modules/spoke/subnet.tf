resource "azurerm_subnet" "nidhi_spoke_subnet" {
  name                 = "${var.env}_nidhi_spoke_subnet"
  resource_group_name  = azurerm_resource_group.nidhi_spoke_rg.name
  virtual_network_name = azurerm_virtual_network.nidhi_spoke_vnet.name
  address_prefixes     = ["10.1.0.0/24"]
}