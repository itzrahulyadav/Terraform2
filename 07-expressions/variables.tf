variable "number_list" {
  type = list(number)
}

variable "objects_list" {
  type = list(object({
    name     = string
    lastname = string
  }))
}