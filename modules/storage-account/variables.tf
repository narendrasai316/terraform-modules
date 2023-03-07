variable "sa_configs" {
  type = list(
    object(
      {
        name                             = string
        location                         = string
        resource_group_name              = string
        account_tier                     = string
        account_replication_type         = string
        account_kind                     = string
        cross_tenant_replication_enabled = bool
        access_tier                      = string
        enable_https_traffic_only        = bool
        min_tls_version                  = string
        allow_nested_items_to_be_public  = bool
        shared_access_key_enabled        = bool
        public_network_access_enabled    = bool
        default_to_oauth_authentication  = bool
        is_hns_enabled                   = bool
        nfsv3_enabled                    = bool
        tags                             = map(string)

      }
    )
  )
}
