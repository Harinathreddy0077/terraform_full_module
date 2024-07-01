variable "key_vault_name" {
  description = "Name of the Azure Key Vault"
}

variable "resource_group_name" {
  description = "Name of the resource group where Key Vault will be deployed"
}

variable "location" {
  description = "Azure region where the Key Vault will be deployed"
}

variable "vnet_subnet_id" {
  description = "ID of the subnet within a VNet where Key Vault will be integrated"
}

