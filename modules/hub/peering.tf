resource "azurerm_virtual_network_peering" "hub_to_spoke" {
  name                      = "${var.env}-hub-to-spoke"
  resource_group_name       = azurerm_resource_group.nidhirg.name
  virtual_network_name      = azurerm_virtual_network.nidhivnet.name
  remote_virtual_network_id = var.spoke_vnet_id

  allow_virtual_network_access = true
}