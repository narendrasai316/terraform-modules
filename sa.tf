variable "sa_configs" {
  default = []
}


locals {
  sa_configs = [
    for index, sa_config in var.sa_configs : {
      name                             = sa_config.name
      resource_group_name              = sa_config.resource_group_name
      location                         = sa_config.location
      account_tier                     = sa_config.account_tier
      account_replication_type         = sa_config.account_replication_type
      account_kind                     = try(sa_config.account_kind, null)
      cross_tenant_replication_enabled = try(sa_config.cross_tenant_replication_enabled, true)
      access_tier                      = try(sa_config.access_tier, "Hot")
      enable_https_traffic_only        = try(sa_config.enable_https_traffic_only, true)
      min_tls_version                  = try(sa_config.min_tls_version, null)
      allow_nested_items_to_be_public  = try(sa_config.allow_nested_items_to_be_public, true)
      shared_access_key_enabled        = try(sa_config.shared_access_key_enabled, true)
      public_network_access_enabled    = try(sa_config.public_network_access_enabled, true)
      default_to_oauth_authentication  = try(sa_config.default_to_oauth_authentication, false)
      is_hns_enabled                   = try(sa_config.is_hns_enabled, null)
      nfsv3_enabled                    = try(sa_config.nfsv3_enabled, false)
      tags                             = merge(coalesce(sa_config.tags), local.resource_tags)
    }
  ]
}


module "sa" {
  source     = "./modules/storage-account"
  sa_configs = local.sa_configs
}

output "sa" {
  value = module.sa.outputs
}