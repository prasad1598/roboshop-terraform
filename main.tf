# module "databases" {
#   for_each                   = var.databases
#   source                     = "./modules/vm"
#   ip_configuration_subnet_id = var.ip_configuration_subnet_id
#   # location                   = var.location
#   network_security_group_id  = var.network_security_group_id
#   name                       = each.key
#   rg_name                    = var.rg_name
#   storage_image_reference_id = var.storage_image_reference_id
#   zone_name                  = var.zone_name
# }
#
# module "application" {
#   depends_on                 = [module.databases]
#   for_each                   = var.applications
#   source                     = "./modules/vm"
#   ip_configuration_subnet_id = var.ip_configuration_subnet_id
#   # location                   = var.location
#   network_security_group_id  = var.network_security_group_id
#   name                       = each.key
#   rg_name                    = var.rg_name
#   storage_image_reference_id = var.storage_image_reference_id
#   zone_name                  = var.zone_name
# }

module "resource-group" {
  source   = "./modules/resource-group"
  name     = var.rg_name
  location = var.rg_location
}

# module "azurerm_storage" {
#   depends_on             = [module.resource-group]
#   source                 = "./modules/storage"
#   name                   = var.storage_account
#   rg_location            = var.rg_location
#   name_rg                = var.name_rg
#   storage_container_name = var.storage_container
# }