provider "azurerm" {
  features {}
}

// Input variables
variable "key_vault_name" {}
variable "resource_group_name" {}
variable "location" {}
variable "vnet_subnet_id" {}

// Create resource group if it doesn't exist (optional)
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

// Create key vault
resource "azurerm_key_vault" "kv" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = azurerm_resource_group.rg.name
  sku_name                    = "standard"
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  enabled_for_deployment      = true
  enabled_for_disk_encryption = true
  enabled_for_template_deployment = true

  // Network ACLs
  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    virtual_network_subnet_ids = [var.vnet_subnet_id]
  }
}

// Output variables
output "key_vault_id" {
  value = azurerm_key_vault.kv.id
}

