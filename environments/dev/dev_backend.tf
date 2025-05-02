terraform {
  backend "azurerm" {
    use_cli              = true
    tenant_id            = "00000000-0000-0000-0000-000000000000"
    subscription_id      = "aa32da49-0603-4855-b55b-bfd4bcf7b16f"
    resource_group_name  = var.name_rg
    storage_account_name = var.storage_account
    container_name       = var.storage_container_name
    key                  = "dev.terraform.tfstate"
  }
}
