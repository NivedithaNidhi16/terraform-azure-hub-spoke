variable "env" {
  type        = string
  description = "Environment name"
}

variable "location" {
  type        = string
  description = "Azure region for resources"
  default     = "Australia East"
}

variable "vm_admin_password" {
  type        = string
  description = "Password for the VM admin user"
}

variable "vm_admin_username" {
  type        = string
  description = "Username for the VM admin user"
}

variable "subscription" {
  type        = string
  description = "Azure subscription ID"
}
variable "tenant" {
  type        = string
  description = "Azure tenant ID"
}

variable "hub_vnet_id" {
  type        = string
  description = "Resource ID of the Hub VNet"
}

variable "firewall_private_ip" {
  type        = string
  description = "Private IP address of the hub Azure Firewall"
}

variable "key_vault_private_dns_zone_id" {
  type        = string
  description = "Resource ID of the Key Vault Private DNS zone"
}

variable "blob_private_dns_zone_id" {
  type        = string
  description = "Resource ID of the Blob Storage Private DNS zone"
}