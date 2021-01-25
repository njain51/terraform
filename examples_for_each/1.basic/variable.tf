// defining servers variable which is nested map

variable "prefix" {
  type = string
}

variable "servers" {
  type = map(object( {
    location     = string
  } ))
}
