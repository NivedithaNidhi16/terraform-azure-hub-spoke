resource "azurerm_role_assignment" "vm_key_vault_secrets_user" {
  scope                = azurerm_key_vault.nidhi_spoke_kv.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = azurerm_linux_virtual_machine.nidhi_spoke_vm.identity[0].principal_id
}

resource "azurerm_role_assignment" "vm_storage_blob_reader" {
  scope                = azurerm_storage_account.nidhi_spoke_storage.id
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = azurerm_linux_virtual_machine.nidhi_spoke_vm.identity[0].principal_id
}