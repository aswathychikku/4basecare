variable "project_id" {
  description = "The Google Cloud project ID."
  type        = string
}

variable "region" {
  description = "The region where the service accounts will be created."
  type        = string
}

variable "service_accounts" {
  description = "A map of service accounts to create."
  type = map(object({
    display_name = string
    description  = string
  }))
}
