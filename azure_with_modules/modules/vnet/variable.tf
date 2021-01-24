variable "name" {
  description = "The name of the resource group we want to use"
  default     = ""
}

variable "location" {
  description = "The location/region where we are creating the resource"
  default     = ""
}

variable "tags" {
  description = "The tags to associate the resource we are creating"
  type = map(string)
  default     = {"environment":"test"}
}