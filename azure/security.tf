

resource "azurerm_network_security_group" "security" {
  name = "mySecurityGroup"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  #adding rules
  security_rule {
    access = "Allow"
    direction = "Inbound"
    name = "ssh"
    priority = 100
    protocol = "Tcp"
    source_address_prefix = "*"
    source_port_range = "*"
    destination_address_prefix = "*"
    destination_port_range = "22"
  }

}

