resource "azurerm_storage_account" "tfstate" {
  name                     = "prasaddevopstfstate"
  resource_group_name      = var.rg_name
  location                 = var.rg_location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "terraformtfstate"
  storage_account_id    = azurerm_storage_account.tfstate.id
  container_access_type = "private"
}