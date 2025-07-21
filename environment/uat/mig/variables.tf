
variable "mig_details" {
  description = "List of MIG details including name, zone, and instance self-link."
  type = list(object({
    project_id = string
    name       = string
    zone       = string
    self_link  = string
    port       = number
  }))
}

