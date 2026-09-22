module "hub" {
  source              = "../../modules/hub"
  env                 = var.env
  location            = var.location
  subscription        = var.subscription
  tenant              = var.tenant
  spoke_vnet_id       = module.spoke.vnet_id
  spoke_vm_private_ip = module.spoke.vm_private_ip
}

module "spoke" {
  source                        = "../../modules/spoke"
  env                           = var.env
  location                      = var.location
  subscription                  = var.subscription
  tenant                        = var.tenant
  vm_admin_username             = var.vm_admin_username
  vm_admin_password             = var.vm_admin_password
  hub_vnet_id                   = module.hub.vnet_id
  firewall_private_ip           = module.hub.firewall_private_ip
  key_vault_private_dns_zone_id = module.hub.key_vault_private_dns_zone_id
  blob_private_dns_zone_id      = module.hub.blob_private_dns_zone_id
}