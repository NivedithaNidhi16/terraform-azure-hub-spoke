resource "azurerm_subnet" "nidhisubnet" {
  name                 = "${var.env}_nidhisubnet"
  resource_group_name  = azurerm_resource_group.nidhirg.name
  virtual_network_name = azurerm_virtual_network.nidhivnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_subnet" "azure_firewall_subnet" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = azurerm_resource_group.nidhirg.name
  virtual_network_name = azurerm_virtual_network.nidhivnet.name
  address_prefixes     = ["10.0.1.0/26"]
}

resource "azurerm_subnet" "azure_bastion_subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.nidhirg.name
  virtual_network_name = azurerm_virtual_network.nidhivnet.name
  address_prefixes     = ["10.0.1.64/26"]
}