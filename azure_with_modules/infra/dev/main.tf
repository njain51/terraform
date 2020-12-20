provider "azurerm" {
  features {}
}

module "resource_group" {
  source = "../../modules/resource_group"
  name     = "${var.prefix}-${var.name}"
  location = var.location
}



