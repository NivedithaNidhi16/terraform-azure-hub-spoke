resource "azurerm_route_table" "nidhi_spoke_rt" {
  name                = "${var.env}_nidhi_spoke_rt"
  location            = var.location
  resource_group_name = azurerm_resource_group.nidhi_spoke_rg.name
}

resource "azurerm_subnet_route_table_association" "nidhi_spoke_rt_association" {
  subnet_id      = azurerm_subnet.nidhi_spoke_subnet.id
  route_table_id = azurerm_route_table.nidhi_spoke_rt.id
}