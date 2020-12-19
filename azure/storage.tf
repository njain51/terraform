

resource "azurerm_resource_group" "storage" {
  name     = "storageresourcegroup"
  location = "East US 2"
}

resource "azurerm_storage_account" "account" {
  name = "${azurerm_resource_group.storage.name}"
  location = "${azurerm_resource_group.storage.location}"
  account_tier = "Standard"
  resource_group_name = "${azurerm_resource_group.storage.name}"
  account_replication_type = "LRS"
}


resource "azurerm_storage_container" "container" {
  name = "udemytestcontainer"
  storage_account_name = "${azurerm_storage_account.account.name}"
  container_access_type = "private"
}

resource "azurerm_storage_blob" "blob" {
  name = "udemytestblob"
  storage_account_name = "${azurerm_storage_account.account.name}"
  storage_container_name = "${azurerm_storage_container.container.name}"
  type = "Page"
  size = "5120"
}

resource "azurerm_storage_share" "share" {
  name = "udemytestshare"
  storage_account_name = "${azurerm_storage_account.account.name}"
  quota = 50 #size of share

}