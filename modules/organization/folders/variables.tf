variable "folders" {
  description = "Map of folders to create"
  type = map(object({
    display_name = string
    parent       = string # org ID like "organizations/123456789"
  }))
}