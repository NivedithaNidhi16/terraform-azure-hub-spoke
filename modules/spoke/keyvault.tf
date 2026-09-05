resource "azurerm_key_vault" "nidhi_spoke_kv" {
  name                = "${var.env}-nidhi-kv"
  location            = var.location
  resource_group_name = azurerm_resource_group.nidhi_spoke_rg.name
  tenant_id           = var.tenant

  sku_name = "standard"
}