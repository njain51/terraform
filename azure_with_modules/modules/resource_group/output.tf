
output "rg_name" {
  description = "The name of the newly created resource group"
  value       = azurerm_resource_group.resource_group.name
}