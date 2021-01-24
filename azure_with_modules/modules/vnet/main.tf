resource "azurerm_virtual_network" "main" {
  name                = "${var.name}-network"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.name

}


