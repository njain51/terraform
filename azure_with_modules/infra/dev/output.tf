output "resource-group-name" {
  value = module.resource_group.rg_name
}

output "network_interface" {
  description = "The name of the newly created network interface"
  value       = module.vnet.network_interface
}