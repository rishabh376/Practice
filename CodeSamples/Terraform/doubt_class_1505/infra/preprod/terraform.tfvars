rgs = {
  rg1 = {
    rg_name     = "abhinav-rg"
    rg_location = "East US"
  }
  rg2 = {
    rg_name     = "rg-abhinav2"
    rg_location = "Central India"
  }
}

storageaccounts = {
  stg1 = {
    storage_name                     = "dhondhustorage"
    storage_resource_group_name      = "rg-dhondhu"
    storage_location                 = "West Europe"
    storage_account_tier             = "Standard"
    storage_account_replication_type = "GRS"
  }
  stg2 = {
    storage_name                     = "dhondhustorage"
    storage_resource_group_name      = "rg-dhondhu"
    storage_location                 = "West Europe"
    storage_account_tier             = "Standard"
    storage_account_replication_type = "GRS"
  }
}
