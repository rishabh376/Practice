terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.21.1"
    }
  }
}

provider "azurerm" {
  features{}
}

resource "azurerm_resource_group" "example" {
  name     = "chameli"
  location = "West Europe"
}