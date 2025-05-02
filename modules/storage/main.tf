resource "azurerm_storage_account" "tfstate" {
  name                     = var.name
  resource_group_name      = var.name_rg
  location                 = var.rg_location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "tfstate" {
  name                  = var.storage_container_name
  storage_account_id    = azurerm_storage_account.tfstate.id
  container_access_type = "private"
}


# prasaddevopstfstate
# terraformtfstate