locals {
  double_numbers = [for num in var.number_list : num * 2]
}

output "double_number" {
  value = local.double_numbers
}


