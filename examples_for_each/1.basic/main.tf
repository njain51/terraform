#define provider
provider "azurerm" {
  features {}
}


# using for_each to product list of servers colelction. 

resource "azurerm_resource_group" "main" {
  for_each = var.servers

  location = each.value.location
  name = each.key

  tags = {
    "environment" = "testing"
  }
  timeouts {
    create = "15m"
    delete = "15m"
  }
}

output "servers" {
   value = azurerm_resource_group.main[*]
          
 }