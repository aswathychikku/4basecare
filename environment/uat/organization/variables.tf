variable "organization_id" {
  type = string
}

variable "billing_account_id" {
  type = string
}

variable "folders" {
  description = "Folders to create"
  type = map(object({
    display_name = string
    parent       = string
  }))
}

variable "projects" {
  description = "Projects to create"
  type = map(object({
    folder_key         = string
    project_name       = string
    project_id         = string
    billing_account_id = string
    labels             = map(string)
  }))
}