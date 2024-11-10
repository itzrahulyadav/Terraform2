locals {
  math       = 2 * 2 # math operator
  equality   = 2 != 2
  comparison = 2 > 1
  logical    = true && false

}

output "operators" {
  value = {
    math       = local.math
    comparsion = local.comparison
    logical    = local.logical
    equality   = local.equality
  }
}