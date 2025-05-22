module "resource-group" {
  for_each = var.rg_name
  source   = "./modules/resource-group"
  name     = "${each.key}-${var.env}"
  location = each.value["location"]
}

module "databases" {
  for_each                   = var.databases
  source                     = "./modules/vm"
  name                       = each.key
  rg_location                = module.resource-group[each.value["rgname"]].location
  ip_configuration_subnet_id = var.ip_configuration_subnet_id
  network_security_group_id  = var.network_security_group_id
  rg_name                    = module.resource-group[each.value["rgname"]].name
  storage_image_reference_id = var.storage_image_reference_id
  zone_name                  = var.zone_name
  dns_record_rg_name         = var.dns_record_rg_name
  token                      = var.token
}

module "application" {
  depends_on                 = [module.databases]
  for_each                   = var.applications
  source                     = "./modules/vm"
  name                       = each.key
  rg_location                = module.resource-group[each.value["rgname"]].location
  network_security_group_id  = var.network_security_group_id
  ip_configuration_subnet_id = var.ip_configuration_subnet_id
  rg_name                    = module.resource-group[each.value["rgname"]].name
  storage_image_reference_id = var.storage_image_reference_id
  zone_name                  = var.zone_name
  dns_record_rg_name         = var.dns_record_rg_name
  token                      = var.token
}



# module "azurerm_storage" {
#   depends_on             = [module.resource-group]
#   source                 = "./modules/storage"
#   name                   = var.storage_account
#   rg_location            = var.rg_location
#   name_rg                = var.name_rg
#   storage_container_name = var.storage_container
# }