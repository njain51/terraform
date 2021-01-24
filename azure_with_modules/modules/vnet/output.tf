output "network_interface" {
  description = "The name of the newly created network interface"
  value       = azurerm_virtual_network.main.name
}

