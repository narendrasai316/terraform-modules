variable "global_config" {
  type = object(
    {
      mandatory_tags = object(
        {
          environment = string
          location    = string
        }
      )
    }
  )
}

locals {

  global_config            = var.global_config
  location                 = local.global_config.mandatory_tags.location
  environment              = local.global_config.mandatory_tags.environment
  resource_tags            = local.global_config.mandatory_tags
}