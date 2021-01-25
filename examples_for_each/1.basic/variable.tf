// defining servers variable which is nested map

variable "servers" {
  type = map(object({
 
    location     = string
  }))
}
