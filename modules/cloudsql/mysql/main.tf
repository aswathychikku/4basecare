resource "google_sql_database_instance" "mysql_instance" {
  database_version = var.database_version
  name             = var.db_name
  project          = var.project_id
  region           = var.region

  lifecycle {
    ignore_changes = [
      database_version,
      settings[0].database_flags
    ]
  }
  settings {
    deletion_protection_enabled = var.deletion_protection_enabled
    dynamic "database_flags" {
      for_each = var.database_flags
      content {
        name  = lookup(database_flags.value, "name", null)
        value = lookup(database_flags.value, "value", null)
      }
    }
    activation_policy = var.activation_policy
    availability_type = var.availability_type
    backup_configuration {
      backup_retention_settings {
        retained_backups = var.retained_backups
        retention_unit   = var.retention_unit
      }
      binary_log_enabled             = var.engine_type != "MYSQL" ? false : true
      enabled                        = var.enabled
      point_in_time_recovery_enabled = var.engine_type != "MYSQL" ? true : false //var.point_in_time_recovery_enabled
      start_time                     = var.start_time
      transaction_log_retention_days = var.transaction_log_retention_days
      location                       = var.location
    }
    disk_autoresize       = var.disk_autoresize
    disk_autoresize_limit = var.disk_autoresize_limit
    disk_size             = var.disk_size
    disk_type             = var.disk_type
    ip_configuration {
      ipv4_enabled                                  = var.ipv4_enabled
      private_network                               = var.private_network
      allocated_ip_range                  = var.allocated_ip_range
      enable_private_path_for_google_cloud_services = var.enable_private_path_for_gcp
      dynamic "authorized_networks" {
        for_each = var.authorized_networks
        content {
          name  = lookup(authorized_networks.value, "name", null)
          value = authorized_networks.value.value
        }
      }
    }

    location_preference {
      zone = var.zone
    }
    maintenance_window {
      day  = var.day
      hour = var.hour
      update_track  = var.update_track
    }
    pricing_plan = var.pricing_plan
    tier         = var.tier
    user_labels  = merge(var.user_labels)

  }
  deletion_protection = var.deletion_protection
}

/*
resource "google_sql_user" "root_user" {
      name     = "lk_prime"
      instance = google_sql_database_instance.mysql_instance.name
      password = random_password.password.result
}

resource "random_password" "password" {
  length  = var.password_length
  special = true
  upper   = true
  lower   = true
  numeric = true
}
*/
