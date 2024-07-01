provider "azurerm" {
  features {}
  // Azure credentials are managed via Azure DevOps pipeline
}

// Variables
variable "resource_group_name" {}
variable "location" {}
variable "key_vault_name" {}
variable "vnet_subnet_id" {}

// Module invocation
module "key_vault" {
  source = "./Modules/keyvault"

  // Pass variables to the key vault module
  key_vault_name        = var.key_vault_name
  resource_group_name   = var.resource_group_name
  location              = var.location
  vnet_subnet_id        = var.vnet_subnet_id
}

// Output variables
output "key_vault_id" {
  value = module.key_vault.key_vault_id
}

