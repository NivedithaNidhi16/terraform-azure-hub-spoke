resource "azurerm_virtual_network_peering" "spoke_to_hub" {
  name                      = "${var.env}-spoke-to-hub"
  resource_group_name       = azurerm_resource_group.nidhi_spoke_rg.name
  virtual_network_name      = azurerm_virtual_network.nidhi_spoke_vnet.name
  remote_virtual_network_id = var.hub_vnet_id

  allow_virtual_network_access = true
}