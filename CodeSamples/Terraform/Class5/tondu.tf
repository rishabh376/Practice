terraform {
  backend "azurerm" {
    resource_group_name = "rg-storage"
    storage_account_name = "merapehlapyaaar"
    container_name       = "pandit-ram"
    key                  = "dhondhu.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.24.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "1075ec7a-b17a-4f37-bf3f-9d68c4506dc1"
}

resource "azurerm_resource_group" "tommy" {
  name     = "rg-tommy"
  location = "West Europe"
}

resource "azurerm_resource_group" "snow" {
  name     = "rg-snow2"
  location = "West Europe"
}

resource "azurerm_resource_group" "dhondhu" {
  name     = "rg-snow"
  location = "West Europe"
}

resource "azurerm_resource_group" "dhondhu1" {
  name     = "rg-dhondhu123"
  location = "West Europe"
}

resource "azurerm_resource_group" "dhondhu12" {
  name     = "rg-snow1"
  location = "West Europe"
}
