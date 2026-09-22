resource "azurerm_key_vault" "nidhi_spoke_kv" {
  name                = "${var.env}-nidhi-kv"
  location            = var.location
  resource_group_name = azurerm_resource_group.nidhi_spoke_rg.name
  tenant_id           = var.tenant

  sku_name = "standard"
  enable_rbac_authorization       = true
  public_network_access_enabled   = false
}