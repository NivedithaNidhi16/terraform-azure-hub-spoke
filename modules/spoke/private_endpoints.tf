resource "azurerm_private_endpoint" "key_vault" {
  name                = "${var.env}_key_vault_private_endpoint"
  location            = var.location
  resource_group_name = azurerm_resource_group.nidhi_spoke_rg.name
  subnet_id           = azurerm_subnet.private_endpoints.id

  private_service_connection {
    name                           = "${var.env}_key_vault_private_connection"
    private_connection_resource_id = azurerm_key_vault.nidhi_spoke_kv.id
    is_manual_connection           = false
    subresource_names              = ["vault"]
  }

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [var.key_vault_private_dns_zone_id]
  }
}

resource "azurerm_private_endpoint" "blob_storage" {
  name                = "${var.env}_blob_storage_private_endpoint"
  location            = var.location
  resource_group_name = azurerm_resource_group.nidhi_spoke_rg.name
  subnet_id           = azurerm_subnet.private_endpoints.id

  private_service_connection {
    name                           = "${var.env}_blob_storage_private_connection"
    private_connection_resource_id = azurerm_storage_account.nidhi_spoke_storage.id
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [var.blob_private_dns_zone_id]
  }
}