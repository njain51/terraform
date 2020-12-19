
resource "azurerm_sql_server" "sql_server" {
  administrator_login = "AdministratorLogin"
  administrator_login_password = "Password!@"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  name = "mysqlserver"
  version = "12.0"
}

resource "azurerm_sql_database" "sql_db" {
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  name = "mysqldb"
  server_name = "${azurerm_sql_server.sql_server.name}"
  edition = "Basic"
}

resource "azurerm_sql_firewall_rule" "sql_firewall" {
  end_ip_address = "0.0.0.0"
  name = "mysqlfirewall"
  resource_group_name = azurerm_resource_group.main.name
  server_name = "${azurerm_sql_server.sql_server.name}"
  start_ip_address = "0.0.0.0"
}