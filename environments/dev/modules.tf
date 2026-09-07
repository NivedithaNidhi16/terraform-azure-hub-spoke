module "hub" {
  source        = "../../modules/hub"
  env           = var.env
  location      = var.location
  subscription  = var.subscription
  tenant        = var.tenant
  spoke_vnet_id = module.spoke.vnet_id
}

module "spoke" {
  source = "../../modules/spoke"

  env               = var.env
  location          = var.location
  subscription      = var.subscription
  tenant            = var.tenant
  vm_admin_username = var.vm_admin_username
  vm_admin_password = var.vm_admin_password
  hub_vnet_id       = module.hub.vnet_id
}