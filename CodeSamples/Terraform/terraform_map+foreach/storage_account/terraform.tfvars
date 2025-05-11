storageAccounts = {
  "sa1" = {
    name                     = "tutustorage"
    resource_group_name      = "rg-tutu"
    location                 = "West Europe"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
  "sa2" = {
    name                     = "lulustorage"
    resource_group_name      = "rg-lulu"
    location                 = "Central India"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
  "sa3" = {
    name                     = "kukustorage"
    resource_group_name      = "rg-kuku"
    location                 = "Central India"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}
