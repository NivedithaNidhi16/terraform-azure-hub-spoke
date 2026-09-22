resource "azurerm_network_interface" "nidhi_spoke_nic" {
  name                = "${var.env}_nidhi_spoke_nic"
  location            = var.location
  resource_group_name = azurerm_resource_group.nidhi_spoke_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.nidhi_spoke_subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.1.0.4"
  }
}