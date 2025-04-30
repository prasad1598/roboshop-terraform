module "frontend" {
  source                     = "./component"
  ip_configuration_subnet_id = var.ip_configuration_subnet_id
  location                   = var.location
  network_security_group_id  = var.network_security_group_id
  name                       = "frontend"
  rg_name                    = var.rg_name
  storage_image_reference_id = var.storage_image_reference_id
  zone_name                  = var.zone_name
}

module "mongodb" {
  source                     = "./component"
  ip_configuration_subnet_id = var.ip_configuration_subnet_id
  location                   = var.location
  network_security_group_id  = var.network_security_group_id
  name                       = "mongodb"
  rg_name                    = var.rg_name
  storage_image_reference_id = var.storage_image_reference_id
  zone_name                  = var.zone_name
}

module "catalogue" {
  source                     = "./component"
  ip_configuration_subnet_id = var.ip_configuration_subnet_id
  location                   = var.location
  network_security_group_id  = var.network_security_group_id
  name                       = "catalogue"
  rg_name                    = var.rg_name
  storage_image_reference_id = var.storage_image_reference_id
  zone_name                  = var.zone_name
}

module "redis" {
  source                     = "./component"
  ip_configuration_subnet_id = var.ip_configuration_subnet_id
  location                   = var.location
  network_security_group_id  = var.network_security_group_id
  name                       = "redis"
  rg_name                    = var.rg_name
  storage_image_reference_id = var.storage_image_reference_id
  zone_name                  = var.zone_name
}

module "user" {
  source                     = "./component"
  ip_configuration_subnet_id = var.ip_configuration_subnet_id
  location                   = var.location
  network_security_group_id  = var.network_security_group_id
  name                       = "user"
  rg_name                    = var.rg_name
  storage_image_reference_id = var.storage_image_reference_id
  zone_name                  = var.zone_name
}

module "cart" {
  source                     = "./component"
  ip_configuration_subnet_id = var.ip_configuration_subnet_id
  location                   = var.location
  network_security_group_id  = var.network_security_group_id
  name                       = "cart"
  rg_name                    = var.rg_name
  storage_image_reference_id = var.storage_image_reference_id
  zone_name                  = var.zone_name
}


module "mysql" {
  source                     = "./component"
  ip_configuration_subnet_id = var.ip_configuration_subnet_id
  location                   = var.location
  network_security_group_id  = var.network_security_group_id
  name                       = "mysql"
  rg_name                    = var.rg_name
  storage_image_reference_id = var.storage_image_reference_id
  zone_name                  = var.zone_name
}

module "shipping" {
  source                     = "./component"
  ip_configuration_subnet_id = var.ip_configuration_subnet_id
  location                   = var.location
  network_security_group_id  = var.network_security_group_id
  name                       = "shipping"
  rg_name                    = var.rg_name
  storage_image_reference_id = var.storage_image_reference_id
  zone_name                  = var.zone_name
}

module "rabbitmq" {
  source                     = "./component"
  ip_configuration_subnet_id = var.ip_configuration_subnet_id
  location                   = var.location
  network_security_group_id  = var.network_security_group_id
  name                       = "rabbitmq"
  rg_name                    = var.rg_name
  storage_image_reference_id = var.storage_image_reference_id
  zone_name                  = var.zone_name
}

module "payment" {
  source                     = "./component"
  ip_configuration_subnet_id = var.ip_configuration_subnet_id
  location                   = var.location
  network_security_group_id  = var.network_security_group_id
  name                       = "payment"
  rg_name                    = var.rg_name
  storage_image_reference_id = var.storage_image_reference_id
  zone_name                  = var.zone_name
}

module "dispatch" {
  source                     = "./component"
  ip_configuration_subnet_id = var.ip_configuration_subnet_id
  location                   = var.location
  network_security_group_id  = var.network_security_group_id
  name                       = "dispatch"
  rg_name                    = var.rg_name
  storage_image_reference_id = var.storage_image_reference_id
  zone_name                  = var.zone_name
}