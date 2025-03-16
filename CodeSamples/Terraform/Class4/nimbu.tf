provider "azurerm" {
  features {}
  subscription_id = "1075ec7a-b17a-4f37-bf3f-9d68c4506dc1"
}

resource "azurerm_resource_group" "rg2" {
  name     = "rg-nimbu"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  name                     = "storageaccountname"
  resource_group_name      = "rg-nimbu"
  location                 = "Central India"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.23.0"
    }
  }
}