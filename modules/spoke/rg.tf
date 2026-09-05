resource "azurerm_resource_group" "nidhi_spoke_rg" {
  name     = "${var.env}_nidhi_spoke"
  location = var.location
}