resource "azurerm_route_table" "nidhirt" {
  name                = "${var.env}_nidhi_rt"
  location            = var.location
  resource_group_name = azurerm_resource_group.nidhirg.name
}

resource "azurerm_subnet_route_table_association" "nidhi_rt_association" {
  subnet_id      = azurerm_subnet.nidhisubnet.id
  route_table_id = azurerm_route_table.nidhirt.id
}