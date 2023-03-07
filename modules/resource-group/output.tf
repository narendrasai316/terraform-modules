locals {
  resource_group_output_properties = ["name", "id"] 
  module_output = {
    for resource_group_key, resource_group_configs in azurerm_resource_group.resource_group : "${resource_group_key}" => {
      for key, value in resource_group_configs : key => value if contains(local.resource_group_output_properties, key)
    }
  }
}

output "outputs" {
  value = local.module_output
}