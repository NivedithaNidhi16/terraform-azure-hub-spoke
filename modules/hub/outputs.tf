output "vnet_id" {
  value = azurerm_virtual_network.nidhivnet.id
}

output "firewall_private_ip" {
  value = azurerm_firewall.nidhi_firewall.ip_configuration[0].private_ip_address
}

output "key_vault_private_dns_zone_id" {
  value = azurerm_private_dns_zone.key_vault.id
}

output "blob_private_dns_zone_id" {
  value = azurerm_private_dns_zone.blob_storage.id
}