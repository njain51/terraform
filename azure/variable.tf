

variable "prefix" { default = "tfnitin" }
variable "name" { default = "resources" }
variable "location" { default = "East US 2" }

# adding new variable for servers as list type
variable "name_count" {default = ["server1","server2","server3"]}

