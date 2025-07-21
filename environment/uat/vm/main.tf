module "instances" {
  source = "../../../modules/vm"

  for_each = { for config in var.configs : config.name => config }

  name                        = each.value.name
  project_id                  = var.project_id
  subnetwork_project          = var.sub_project_id
  network                     = var.network_name
  subnetwork                  = each.value.subnetwork
  zone                        = each.value.zone
  labels                      = each.value.labels
  machine_type                = each.value.machine_type
  email                       = each.value.service_account
  scopes                      = each.value.scopes
  tags                        = each.value.tags
  size                        = each.value.disk_size
  image                       = each.value.image
  deletion_protection         = each.value.deletion_protection
  preemptible                 = each.value.preemptible
  enable_integrity_monitoring = each.value.enable_integrity_monitoring
  enable_secure_boot          = each.value.enable_secure_boot
  enable_vtpm                 = each.value.enable_vtpm
  key_revocation_action_type  = each.value.key_revocation_action_type
  metadata                    = each.value.metadata
  instance_termination_action = each.value.instance_termination_action
  automatic_restart           = each.value.automatic_restart
}
