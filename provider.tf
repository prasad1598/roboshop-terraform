provider "azurerm" {
  features {}
  subscription_id = "aa32da49-0603-4855-b55b-bfd4bcf7b16f"
}

terraform {
  backend "azurerm" {}
}

provider "vault" {
  address = "http://vault-int.prasaddevops.shop:8200"
  token   = var.token
}