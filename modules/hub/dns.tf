resource "azurerm_private_dns_zone" "nidhi_dns" {
  name                = "nidhi.internal"
  resource_group_name = azurerm_resource_group.nidhirg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "nidhi_dns_link" {
  name                  = "${var.env}_nidhi_dns_link"
  resource_group_name   = azurerm_resource_group.nidhirg.name
  private_dns_zone_name = azurerm_private_dns_zone.nidhi_dns.name
  virtual_network_id    = azurerm_virtual_network.nidhivnet.id
}