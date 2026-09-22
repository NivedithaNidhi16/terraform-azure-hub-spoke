resource "random_string" "storage_suffix" {
  length  = 6
  special = false
  upper   = false
  numeric = true
}

resource "azurerm_storage_account" "nidhi_spoke_storage" {
  name                     = "${var.env}nidhistorage${random_string.storage_suffix.result}"
  resource_group_name      = azurerm_resource_group.nidhi_spoke_rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  public_network_access_enabled = false
}