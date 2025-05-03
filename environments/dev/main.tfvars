env = "dev"

dns_record_rg_name = "project_rg"
ip_configuration_subnet_id = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Network/virtualNetworks/Project_VN/subnets/default"
network_security_group_id = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Network/networkSecurityGroups/Project_NSG"
storage_image_reference_id = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Compute/images/test-devops-practice"
zone_name = "prasaddevops.shop"

databases = {
  mongodb = {
    rgname = "ukwest"
  }
  rabbitmq = {
    rgname = "ukwest"
  }
  mysql = {
    rgname = "ukwest"
  }
  redis = {
    rgname = "ukwest"
  }
}

applications = {
  catalogue = {
    rgname = "ukwest"
  }
  user = {
    rgname = "ukwest"
  }
  cart = {
    rgname = "ukwest"
  }
  payment = {
    rgname = "ukwest"
  }
  shipping = {
    rgname = "ukwest"
  }
  dispatch = {
    rgname = "ukwest"
  }
  frontend = {
    rgname = "ukwest"
  }
}

rg_name = {
  ukwest = {
    location = "UK West"
  }
}