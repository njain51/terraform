# define provider
provider "azurerm" {
  features {}
}



# declaring azure resource group, name is required attribute and id,location, tag are exported arguments. 
# https://registry.terraform.io/providers/hashicorp/azurerm/2.1.0/docs/data-sources/resource_group#attributes-reference

resource "azurerm_resource_group" "main" {
# using for_each to product list of servers colelction.
# Once you’ve used for_each on a resource, it becomes a map of resources, rather than just one resource.
for_each         = var.servers
location         = each.value.location
name             = "${var.prefix}-${each.key}"

tags = {
            "environment" = "testing"
         }
timeouts  {
              create = "15m"
              delete  = "15m"
            }
}

# creating azure virtual network
# Manages a virtual network including any configured subnets. Each subnet can optionally be configured with a security group to be associated with the subnet.
# https://registry.terraform.io/providers/hashicorp/azurerm/2.1.0/docs/resources/virtual_network

resource "azurerm_virtual_network" "main" {

for_each = azurerm_resource_group.main

name                = "${var.prefix}-network"
address_space       = ["10.0.0.0/16"]
location            = each.value.location
resource_group_name = each.value.name

tags = {
            "environment" = "testing"
         }

timeouts  {
              create = "15m"
              delete  = "15m"
            }

}

# creating subnet
# https://registry.terraform.io/providers/hashicorp/azurerm/2.1.0/docs/resources/subnet
# Manages a subnet. Subnets represent network segments within the IP space defined by the virtual network.
# 

resource "azurerm_subnet" "internal" {
for_each             = azurerm_virtual_network.main
name                 = "internal"
resource_group_name  = each.value.resource_group_name
virtual_network_name = each.key
address_prefixes     = ["10.0.2.0/24"]

timeouts  {
              create = "15m"
              delete  = "15m"
            }

}

output "servers" {
   value = azurerm_resource_group.main[*]
          
 }

 output "virtual_network" {
   value = azurerm_virtual_network.main[*]
          
 }

  output "subnet" {
   value = azurerm_subnet.internal[*]
          
 }


 # just output location
 output "location" {
  value = values(azurerm_resource_group.main)[*].location
}