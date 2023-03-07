variable "resource_group_configs" {
  type = list(
    object(
      {
        name     = string
        location = string
        tags     = map(string)
      }
    )
  )
}
