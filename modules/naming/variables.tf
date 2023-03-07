variable "naming_configs" {
  type = object(
    {
      location     = string
      environment  = string
    }
  )
}

variable "resource_group_configs" {
  type = list(any)
}

variable "sa_configs" {
  type = list(any)
}
