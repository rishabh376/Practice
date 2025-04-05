terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.26.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-terraformstate"
    storage_account_name = "devops2189"               
    container_name       = "tfstate"                
    key                  = "dhondhu.terraform.tfstate" 
  }
}

provider "azurerm" {
  features {}
  subscription_id = "1075ec7a-b17a-4f37-bf3f-9d68c4506dc1"
}

resource "azurerm_resource_group" "rg1" {
  name     = "dhondhu-rg"
  location = "West Europe"
}

resource "azurerm_storage_account" "stg1" {
  name                     = "dhondhustg765"
  resource_group_name      = azurerm_resource_group.rg1.name
  location                 = azurerm_resource_group.rg1.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_resource_group" "rg2" {
  name     = "tondu-rg"
  location = "West Europe"
}

resource "azurerm_storage_account" "stg2" {
  name                     = "dhondhustg766"
  resource_group_name      = azurerm_resource_group.rg2.name
  location                 = azurerm_resource_group.rg2.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_account" "stg3" {
  name                     = "dhondhustg767"
  resource_group_name      = azurerm_resource_group.rg2.name
  location                 = azurerm_resource_group.rg2.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_account" "stg4" {
  name                     = "dhondhustg768"
  resource_group_name      = azurerm_resource_group.rg2.name
  location                 = azurerm_resource_group.rg2.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}