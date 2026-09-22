output "vnet_id" {
  value = azurerm_virtual_network.nidhi_spoke_vnet.id
}

output "vm_private_ip" {
  value = azurerm_network_interface.nidhi_spoke_nic.private_ip_address
}

output "vm_nic_id"{
  value = azurerm_network_interface.nidhi_spoke_nic.id
}