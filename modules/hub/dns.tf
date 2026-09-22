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

resource "azurerm_private_dns_zone_virtual_network_link" "nidhi_dns_spoke_link" {
  name                  = "${var.env}_nidhi_dns_spoke_link"
  resource_group_name   = azurerm_resource_group.nidhirg.name
  private_dns_zone_name = azurerm_private_dns_zone.nidhi_dns.name
  virtual_network_id    = var.spoke_vnet_id
}

resource "azurerm_private_dns_a_record" "spoke_vm" {
  name                = "spoke-vm"
  zone_name           = azurerm_private_dns_zone.nidhi_dns.name
  resource_group_name = azurerm_resource_group.nidhirg.name
  ttl                 = 300
  records             = [var.spoke_vm_private_ip]
}


resource "azurerm_private_dns_zone" "key_vault" {
  name                = "privatelink.vaultcore.azure.net"
  resource_group_name = azurerm_resource_group.nidhirg.name
}

resource "azurerm_private_dns_zone" "blob_storage" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = azurerm_resource_group.nidhirg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "key_vault_hub_link" {
  name                  = "${var.env}_key_vault_hub_link"
  resource_group_name   = azurerm_resource_group.nidhirg.name
  private_dns_zone_name = azurerm_private_dns_zone.key_vault.name
  virtual_network_id    = azurerm_virtual_network.nidhivnet.id
}

resource "azurerm_private_dns_zone_virtual_network_link" "key_vault_spoke_link" {
  name                  = "${var.env}_key_vault_spoke_link"
  resource_group_name   = azurerm_resource_group.nidhirg.name
  private_dns_zone_name = azurerm_private_dns_zone.key_vault.name
  virtual_network_id    = var.spoke_vnet_id
}

resource "azurerm_private_dns_zone_virtual_network_link" "blob_storage_hub_link" {
  name                  = "${var.env}_blob_storage_hub_link"
  resource_group_name   = azurerm_resource_group.nidhirg.name
  private_dns_zone_name = azurerm_private_dns_zone.blob_storage.name
  virtual_network_id    = azurerm_virtual_network.nidhivnet.id
}

resource "azurerm_private_dns_zone_virtual_network_link" "blob_storage_spoke_link" {
  name                  = "${var.env}_blob_storage_spoke_link"
  resource_group_name   = azurerm_resource_group.nidhirg.name
  private_dns_zone_name = azurerm_private_dns_zone.blob_storage.name
  virtual_network_id    = var.spoke_vnet_id
}