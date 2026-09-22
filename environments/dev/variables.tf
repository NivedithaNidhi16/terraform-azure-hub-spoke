variable "env" {
  type = string
}

variable "location" {
  type = string
}

variable "subscription" {
  type = string
}

variable "tenant" {
  type = string
}

variable "vm_admin_username" {
  type = string
}
variable "vm_admin_password" {
  type = string
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