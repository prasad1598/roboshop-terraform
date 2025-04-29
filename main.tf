provider "azurerm" {
  features {}
  subscription_id = "aa32da49-0603-4855-b55b-bfd4bcf7b16f"
}

resource "azurerm_public_ip" "frontend" {
  name                = "frontend-ip"
  resource_group_name = "Project_RG"
  location            = "UK West"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "frontend" {
  name                = "frontend-nic"
  location            = "UK West"
  resource_group_name = "Project_RG"

  ip_configuration {
    name                          = "frontend-nic"
    subnet_id                     = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Network/virtualNetworks/Project_VN/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.frontend.id
  }
}

resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.frontend.id
  network_security_group_id = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Network/networkSecurityGroups/Project_NSG"
}

resource "azurerm_virtual_machine" "frontend" {
  name                = "frontend"
  location            = "UK West"
  resource_group_name = "Project_RG"
  network_interface_ids = [azurerm_network_interface.frontend.id]
  vm_size = "Standard_B1ms"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    id = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Compute/images/test-devops-practice"
  }
  storage_os_disk {
    name              = "frontend-vm-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "frontend-vm"
    admin_username = "azuser"
    admin_password = "Muniprasad@123"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "frontend" {
  name                = "frontend-dev"
  zone_name           = "prasaddevops.shop"
  resource_group_name = "Project_RG"
  ttl                 = 3
  records             = [azurerm_network_interface.frontend.private_ip_address]
}


resource "azurerm_public_ip" "mongodb" {
  name                = "mongodb-ip"
  resource_group_name = "Project_RG"
  location            = "UK West"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "mongodb" {
  name                = "mongodb-nic"
  location            = "UK West"
  resource_group_name = "Project_RG"

  ip_configuration {
    name                          = "mongodb-nic"
    subnet_id                     = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Network/virtualNetworks/Project_VN/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.mongodb.id
  }
}

resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.mongodb.id
  network_security_group_id = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Network/networkSecurityGroups/Project_NSG"
}

resource "azurerm_virtual_machine" "mongodb" {
  name                = "mongodb"
  location            = "UK West"
  resource_group_name = "Project_RG"
  network_interface_ids = [azurerm_network_interface.mongodb.id]
  vm_size = "Standard_B1ms"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    id = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Compute/images/test-devops-practice"
  }
  storage_os_disk {
    name              = "mongodb-vm-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "mongodb-vm"
    admin_username = "azuser"
    admin_password = "Muniprasad@123"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "mongodb" {
  name                = "mongodb-dev"
  zone_name           = "prasaddevops.shop"
  resource_group_name = "Project_RG"
  ttl                 = 3
  records             = [azurerm_network_interface.mongodb.private_ip_address]
}


resource "azurerm_public_ip" "catalogue" {
  name                = "catalogue-ip"
  resource_group_name = "Project_RG"
  location            = "UK West"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "catalogue" {
  name                = "catalogue-nic"
  location            = "UK West"
  resource_group_name = "Project_RG"

  ip_configuration {
    name                          = "catalogue-nic"
    subnet_id                     = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Network/virtualNetworks/Project_VN/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.catalogue.id
  }
}

resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.catalogue.id
  network_security_group_id = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Network/networkSecurityGroups/Project_NSG"
}

resource "azurerm_virtual_machine" "catalogue" {
  name                = "catalogue"
  location            = "UK West"
  resource_group_name = "Project_RG"
  network_interface_ids = [azurerm_network_interface.catalogue.id]
  vm_size = "Standard_B1ms"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    id = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Compute/images/test-devops-practice"
  }
  storage_os_disk {
    name              = "catalogue-vm-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "catalogue-vm"
    admin_username = "azuser"
    admin_password = "Muniprasad@123"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "catalogue" {
  name                = "catalogue-dev"
  zone_name           = "prasaddevops.shop"
  resource_group_name = "Project_RG"
  ttl                 = 3
  records             = [azurerm_network_interface.catalogue.private_ip_address]
}



resource "azurerm_public_ip" "Redis" {
  name                = "Redis-ip"
  resource_group_name = "Project_RG"
  location            = "UK West"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "Redis" {
  name                = "Redis-nic"
  location            = "UK West"
  resource_group_name = "Project_RG"

  ip_configuration {
    name                          = "Redis-nic"
    subnet_id                     = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Network/virtualNetworks/Project_VN/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.Redis.id
  }
}

resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.Redis.id
  network_security_group_id = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Network/networkSecurityGroups/Project_NSG"
}

resource "azurerm_virtual_machine" "Redis" {
  name                = "Redis"
  location            = "UK West"
  resource_group_name = "Project_RG"
  network_interface_ids = [azurerm_network_interface.Redis.id]
  vm_size = "Standard_B1ms"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    id = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Compute/images/test-devops-practice"
  }
  storage_os_disk {
    name              = "Redis-vm-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "Redis-vm"
    admin_username = "azuser"
    admin_password = "Muniprasad@123"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "Redis" {
  name                = "Redis-dev"
  zone_name           = "prasaddevops.shop"
  resource_group_name = "Project_RG"
  ttl                 = 3
  records             = [azurerm_network_interface.Redis.private_ip_address]
}



resource "azurerm_public_ip" "user" {
  name                = "user-ip"
  resource_group_name = "Project_RG"
  location            = "UK West"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "user" {
  name                = "user-nic"
  location            = "UK West"
  resource_group_name = "Project_RG"

  ip_configuration {
    name                          = "user-nic"
    subnet_id                     = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Network/virtualNetworks/Project_VN/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.user.id
  }
}

resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.user.id
  network_security_group_id = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Network/networkSecurityGroups/Project_NSG"
}

resource "azurerm_virtual_machine" "user" {
  name                = "user"
  location            = "UK West"
  resource_group_name = "Project_RG"
  network_interface_ids = [azurerm_network_interface.user.id]
  vm_size = "Standard_B1ms"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    id = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Compute/images/test-devops-practice"
  }
  storage_os_disk {
    name              = "user-vm-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "user-vm"
    admin_username = "azuser"
    admin_password = "Muniprasad@123"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "user" {
  name                = "user-dev"
  zone_name           = "prasaddevops.shop"
  resource_group_name = "Project_RG"
  ttl                 = 3
  records             = [azurerm_network_interface.user.private_ip_address]
}




resource "azurerm_public_ip" "cart" {
  name                = "cart-ip"
  resource_group_name = "Project_RG"
  location            = "UK West"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "cart" {
  name                = "cart-nic"
  location            = "UK West"
  resource_group_name = "Project_RG"

  ip_configuration {
    name                          = "cart-nic"
    subnet_id                     = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Network/virtualNetworks/Project_VN/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.cart.id
  }
}

resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.cart.id
  network_security_group_id = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Network/networkSecurityGroups/Project_NSG"
}

resource "azurerm_virtual_machine" "cart" {
  name                = "cart"
  location            = "UK West"
  resource_group_name = "Project_RG"
  network_interface_ids = [azurerm_network_interface.cart.id]
  vm_size = "Standard_B1ms"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    id = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Compute/images/test-devops-practice"
  }
  storage_os_disk {
    name              = "cart-vm-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "cart-vm"
    admin_username = "azuser"
    admin_password = "Muniprasad@123"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "cart" {
  name                = "cart-dev"
  zone_name           = "prasaddevops.shop"
  resource_group_name = "Project_RG"
  ttl                 = 3
  records             = [azurerm_network_interface.cart.private_ip_address]
}



resource "azurerm_public_ip" "mysql" {
  name                = "mysql-ip"
  resource_group_name = "Project_RG"
  location            = "UK West"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "mysql" {
  name                = "mysql-nic"
  location            = "UK West"
  resource_group_name = "Project_RG"

  ip_configuration {
    name                          = "mysql-nic"
    subnet_id                     = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Network/virtualNetworks/Project_VN/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.mysql.id
  }
}

resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.mysql.id
  network_security_group_id = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Network/networkSecurityGroups/Project_NSG"
}

resource "azurerm_virtual_machine" "mysql" {
  name                = "mysql"
  location            = "UK West"
  resource_group_name = "Project_RG"
  network_interface_ids = [azurerm_network_interface.mysql.id]
  vm_size = "Standard_B1ms"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    id = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Compute/images/test-devops-practice"
  }
  storage_os_disk {
    name              = "mysql-vm-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "mysql-vm"
    admin_username = "azuser"
    admin_password = "Muniprasad@123"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "mysql" {
  name                = "mysql-dev"
  zone_name           = "prasaddevops.shop"
  resource_group_name = "Project_RG"
  ttl                 = 3
  records             = [azurerm_network_interface.mysql.private_ip_address]
}



resource "azurerm_public_ip" "shipping" {
  name                = "shipping-ip"
  resource_group_name = "Project_RG"
  location            = "UK West"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "shipping" {
  name                = "shipping-nic"
  location            = "UK West"
  resource_group_name = "Project_RG"

  ip_configuration {
    name                          = "shipping-nic"
    subnet_id                     = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Network/virtualNetworks/Project_VN/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.shipping.id
  }
}

resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.shipping.id
  network_security_group_id = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Network/networkSecurityGroups/Project_NSG"
}

resource "azurerm_virtual_machine" "shipping" {
  name                = "shipping"
  location            = "UK West"
  resource_group_name = "Project_RG"
  network_interface_ids = [azurerm_network_interface.shipping.id]
  vm_size = "Standard_B1ms"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    id = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Compute/images/test-devops-practice"
  }
  storage_os_disk {
    name              = "shipping-vm-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "shipping-vm"
    admin_username = "azuser"
    admin_password = "Muniprasad@123"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "shipping" {
  name                = "shipping-dev"
  zone_name           = "prasaddevops.shop"
  resource_group_name = "Project_RG"
  ttl                 = 3
  records             = [azurerm_network_interface.shipping.private_ip_address]
}



resource "azurerm_public_ip" "rabbitmq" {
  name                = "rabbitmq-ip"
  resource_group_name = "Project_RG"
  location            = "UK West"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "rabbitmq" {
  name                = "rabbitmq-nic"
  location            = "UK West"
  resource_group_name = "Project_RG"

  ip_configuration {
    name                          = "rabbitmq-nic"
    subnet_id                     = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Network/virtualNetworks/Project_VN/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.rabbitmq.id
  }
}

resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.rabbitmq.id
  network_security_group_id = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Network/networkSecurityGroups/Project_NSG"
}

resource "azurerm_virtual_machine" "rabbitmq" {
  name                = "rabbitmq"
  location            = "UK West"
  resource_group_name = "Project_RG"
  network_interface_ids = [azurerm_network_interface.rabbitmq.id]
  vm_size = "Standard_B1ms"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    id = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Compute/images/test-devops-practice"
  }
  storage_os_disk {
    name              = "rabbitmq-vm-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "rabbitmq-vm"
    admin_username = "azuser"
    admin_password = "Muniprasad@123"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "rabbitmq" {
  name                = "rabbitmq-dev"
  zone_name           = "prasaddevops.shop"
  resource_group_name = "Project_RG"
  ttl                 = 3
  records             = [azurerm_network_interface.rabbitmq.private_ip_address]
}



resource "azurerm_public_ip" "payment" {
  name                = "payment-ip"
  resource_group_name = "Project_RG"
  location            = "UK West"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "payment" {
  name                = "payment-nic"
  location            = "UK West"
  resource_group_name = "Project_RG"

  ip_configuration {
    name                          = "payment-nic"
    subnet_id                     = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Network/virtualNetworks/Project_VN/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.payment.id
  }
}

resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.payment.id
  network_security_group_id = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Network/networkSecurityGroups/Project_NSG"
}

resource "azurerm_virtual_machine" "payment" {
  name                = "payment"
  location            = "UK West"
  resource_group_name = "Project_RG"
  network_interface_ids = [azurerm_network_interface.payment.id]
  vm_size = "Standard_B1ms"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    id = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Compute/images/test-devops-practice"
  }
  storage_os_disk {
    name              = "payment-vm-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "payment-vm"
    admin_username = "azuser"
    admin_password = "Muniprasad@123"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "payment" {
  name                = "payment-dev"
  zone_name           = "prasaddevops.shop"
  resource_group_name = "Project_RG"
  ttl                 = 3
  records             = [azurerm_network_interface.payment.private_ip_address]
}



resource "azurerm_public_ip" "dispatch" {
  name                = "dispatch-ip"
  resource_group_name = "Project_RG"
  location            = "UK West"
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "dispatch" {
  name                = "dispatch-nic"
  location            = "UK West"
  resource_group_name = "Project_RG"

  ip_configuration {
    name                          = "dispatch-nic"
    subnet_id                     = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Network/virtualNetworks/Project_VN/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.dispatch.id
  }
}

resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.dispatch.id
  network_security_group_id = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Network/networkSecurityGroups/Project_NSG"
}

resource "azurerm_virtual_machine" "dispatch" {
  name                = "dispatch"
  location            = "UK West"
  resource_group_name = "Project_RG"
  network_interface_ids = [azurerm_network_interface.dispatch.id]
  vm_size = "Standard_B1ms"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    id = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Compute/images/test-devops-practice"
  }
  storage_os_disk {
    name              = "dispatch-vm-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "dispatch-vm"
    admin_username = "azuser"
    admin_password = "Muniprasad@123"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}

resource "azurerm_dns_a_record" "dispatch" {
  name                = "dispatch-dev"
  zone_name           = "prasaddevops.shop"
  resource_group_name = "Project_RG"
  ttl                 = 3
  records             = [azurerm_network_interface.dispatch.private_ip_address]
}