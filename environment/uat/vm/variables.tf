variable "region" {}
variable "project_id" {}
variable "sub_project_id" {}
variable "network_name" {}

variable "configs" {
  type = list(object({
    name                        = string
    subnetwork                  = string
    zone                        = string
    labels                      = map(string)
    machine_type                = string
    service_account             = string
    scopes                      = list(string)
    tags                        = list(string)
    disk_size                   = number
    image                       = string
    deletion_protection         = bool
    preemptible                 = optional(bool, false)
    enable_integrity_monitoring = bool
    enable_secure_boot          = bool
    enable_vtpm                 = bool
    key_revocation_action_type  = optional(string, null)
    metadata                    = optional(map(string), null)
    instance_termination_action = optional(string, null)
    automatic_restart           = optional(bool, true)
  }))
}
