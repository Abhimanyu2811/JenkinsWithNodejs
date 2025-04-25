terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
  }
  required_version = ">=1.0.0"
}

provider "azurerm" {
  subscription_id = "61bd38d2-51fa-4243-9689-7f55df510fc1"
  tenant_id       = "b0b76d6e-14b7-4c08-8657-a19ef23b3b0b"
  features {}
}


variable "location" {
  default = "East US"
}

variable "resource_group_name" {
  default = "rg-storage-demo"
}

variable "storage_account_name" {
  default = "rathorestorageacct1"
}

variable "container_name" {
  default = "myblobcontainer"
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "dev"
  }
}
