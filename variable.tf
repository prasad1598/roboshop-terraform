variable "rg_name" {
  default = "Project_RG"
}

variable "ip_configuration_subnet_id" {
  default = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Network/virtualNetworks/Project_VN/subnets/default"
}

variable "network_security_group_id" {
  default = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Network/networkSecurityGroups/Project_NSG"
}

variable "storage_image_reference_id" {
  default = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Compute/images/test-devops-practice"
}

variable "zone_name" {
  default = "prasaddevops.shop"
}

variable "location" {
  default = "UK West"
}

variable "databases" {
  default = {
    mongodb = {}
    rabbitmq = {}
    mysql = {}
    redis = {}
  }
}

variable "applications" {
  default = {
    catalogue = {}
    user = {}
    cart = {}
    payment = {}
    shipping = {}
    dispatch = {}
    frontend = {}
  }
}