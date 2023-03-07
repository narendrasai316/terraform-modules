locals {
  naming_configs = {
    environment  = lower(substr(var.naming_configs.environment, 0, 1))
    location     = lower(substr(var.naming_configs.location, 0, 1))
  }
  
  resource_names = {
    resource_group_names = {
      for index, resource_group in var.resource_group_configs :
      "resource_group_${index}" => lower("${local.naming_configs.environment}A${local.naming_configs.location}${upper(substr(resource_group.tags.businessunit, 0, 3))}${upper(substr(resource_group.tags.appid, 0, 7))}${index}")
    }
    sa_names = {
      for index, sa in var.sa_configs :
      "sa_${index}" => lower("${local.naming_configs.environment}A${local.naming_configs.location}${upper(substr(sa.tags.businessunit, 0, 3))}${upper(substr(sa.tags.appid, 0, 7))}${index}")
    }
  } 
}