locals {
  module_output = {
    for key, value in local.resource_names : key => value
  }
}

output "outputs" {
  value = local.module_output
}