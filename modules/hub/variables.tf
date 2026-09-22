variable "env" {
  type        = string
  description = "Environment name"
  default     = "dev"
}

variable "location" {
  type        = string
  description = "Azure region"
  default     = "Australia East"
}

variable "subscription" {
  type        = string
  description = "Azure subscription ID"
}

variable "tenant" {
  type        = string
  description = "Azure tenant ID"
}

variable "spoke_vnet_id" {
  type        = string
  description = "Resource ID of the Spoke VNet"
}

variable "spoke_vm_private_ip" {
  type        = string
  description = "Private IP address of the Spoke VM"
}