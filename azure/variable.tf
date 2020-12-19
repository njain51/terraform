
# can define machine_type to "dev", "uat"
variable "environment" {default = "dev"}


variable "prefix" { default = "tfnitin" }
variable "name" { default = "resources" }
variable "location" { default = "East US 2" }

# adding new variable for servers as list type
variable "name_count" {default = ["server1","server2","server3"]}


#introducing map variable for vm_size
//variable "vm_size" {
//  type = "map"
//  default = {"dev":"Standard_DS1_v2",
//              "uat":"Standard_DS2_v2"}
//}

variable "vm_size_dev" {default = "Standard_DS1_v2"}
variable "vm_size_uat" {default = "Standard_DS2_v2"}

