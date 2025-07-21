resource "google_sql_database_instance" "sql_instance" {
  database_version = var.database_version
  name             = var.db_name
  project          = var.project_id
  region           = var.region
  settings {
    deletion_protection_enabled = var.deletion_protection_enabled
    activation_policy = var.activation_policy
    availability_type = var.availability_type
    backup_configuration {
      backup_retention_settings {
        retained_backups = var.retained_backups
        retention_unit   = var.retention_unit
      }
      binary_log_enabled             = var.engine_type != "MYSQL" ? false: true
      enabled                        = var.enabled
      point_in_time_recovery_enabled = var.engine_type != "MYSQL" ? true: false //var.point_in_time_recovery_enabled
      start_time                     = var.start_time
      transaction_log_retention_days = var.transaction_log_retention_days
      location                       = var.location
    }
    disk_autoresize       = var.disk_autoresize
    disk_autoresize_limit = var.disk_autoresize_limit
    disk_size             = var.disk_size
    disk_type             = var.disk_type
    ip_configuration {
      allocated_ip_range                  = var.allocated_ip_range
      ipv4_enabled    = var.ipv4_enabled
      private_network = var.private_network
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

    dynamic "password_validation_policy" {
      for_each = var.enable_password_policy ? [1] : []
      content {
        min_length         = var.min_length
        complexity         = var.complexity
        enable_password_policy = var.enable_password_policy
      }
    }
/*
    password_validation_policy {
      min_length             = var.min_length
      complexity             = var.complexity
      enable_password_policy = var.enable_password_policy
    }
*/
  }

  deletion_protection = var.deletion_protection
}
