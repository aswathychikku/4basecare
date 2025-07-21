resource "google_compute_instance_group" "unmanaged_mig" {
  for_each = { for mig in var.mig_details : mig.name => mig }

  name      = each.value.name
  zone      = each.value.zone
  project   = each.value.project_id
  instances = [each.value.self_link]

  named_port {
    name = "http"
    port = each.value.port
  }

  lifecycle {
    ignore_changes = [
      instances, # Ignore changes to instances since they are unmanaged
    ]
  }
}
