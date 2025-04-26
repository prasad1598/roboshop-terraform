provider "azurerm" {
  features {}
  subscription_id = "aa32da49-0603-4855-b55b-bfd4bcf7b16f"
}

# variable "prefix" {
#   default = "tfvmex"
# }

resource "azurerm_resource_group" "Devops_RG" {
  name     = "Devops_RG"
  location = "UK West"
}

resource "azurerm_virtual_network" "Devops_VN" {
  name                = "Devops_VN"
  address_space       = ["10.0.0.0/16"]
  location            = "UK West"
  resource_group_name = "Devops_RG"
}

# resource "azurerm_subnet" "internal" {
#   name                 = "internal"
#   resource_group_name  = azurerm_resource_group.example.name
#   virtual_network_name = azurerm_virtual_network.main.name
#   address_prefixes     = ["10.0.2.0/24"]
# }

resource "azurerm_network_interface" "Devops_NI" {
  name                = "Devops_NI"
  location            = "UK West"
  resource_group_name = "Devops_RG"

  ip_configuration {
    name                          = "Devops_IP"
    subnet_id                     = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Network/virtualNetworks/Project_VN/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "workstation" {
  name                  = "workstation"
  location              = "UK West"
  resource_group_name   = "Devops_RG"
  network_interface_ids = [azurerm_network_interface.Devops_NI.id]
  vm_size               = "Standard_B1ms"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    id = "/subscriptions/aa32da49-0603-4855-b55b-bfd4bcf7b16f/resourceGroups/Project_RG/providers/Microsoft.Compute/images/local-devops-practice"
  }
  storage_os_disk {
    name              = "workstation-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "workstation"
    admin_username = "azuser"
    admin_password = "Muniprasad@321"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}