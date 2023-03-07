variable "resource_group_configs" {
  default = []
}


locals {
  resource_group_configs = [
    for index, resource_group_config in var.resource_group_configs : {
      name     = resource_group_config.name
      location = resource_group_config.location
      tags     = merge(coalesce(resource_group_config.tags), local.resource_tags)
    }
  ]
}


module "resource_group" {
  source                 = "./modules/resource-group"
  resource_group_configs = local.resource_group_configs
}

output "resource_group" {
  value = module.resource_group.outputs
}