resource "azurerm_resource_group" "nidhirg" {
  name     = "${var.env}_nidhi"
  location = var.location
}