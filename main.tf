terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.3.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
    
  }
  resource_provider_registrations = "none"
subscription_id = "11dfb2d9-c232-45c8-8d38-c05b4bd35e77"
}


resource "azurerm_resource_group" "example" {
  name     = "terraform-rg-dbcc"
  location = "Australia Southeast"
}

resource "azurerm_storage_account" "example" {
  name                     = "mystorage04db"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}