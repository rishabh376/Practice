terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.20.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "dfgdfg"
}

resource "azurerm_resource_group" "rg-dhondhu" {
  name     = "rg-dhondhu"
  location = "West Europe"
}