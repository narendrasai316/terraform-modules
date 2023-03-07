locals {
  sa_output_properties = ["name", "id"] 
  module_output = {
    for sa_key, sa_configs in azurerm_storage_account.sa : "${sa_key}" => {
      for key, value in sa_configs : key => value if contains(local.sa_output_properties, key)
    }
  }
}

output "outputs" {
  value = local.module_output
}