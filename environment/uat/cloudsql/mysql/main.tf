module "mysql_db_01" {
  source = "../../../../modules/cloudsql/mysql"

  project_id         = var.project_id
  region             = var.region
  zone               = var.zone
  db_name            = var.db_name
  database_version   = var.database_version
  disk_size          = var.disk_size
  tier               = var.tier
  pricing_plan       = var.pricing_plan
  engine_type        = var.engine_type
  private_network    = var.private_network

  activation_policy  = var.activation_policy
  availability_type  = var.availability_type
  retained_backups   = var.retained_backups
  retention_unit     = var.retention_unit
  enabled            = var.enabled
  start_time         = var.start_time
  transaction_log_retention_days = var.transaction_log_retention_days
  disk_autoresize    = var.disk_autoresize
  disk_autoresize_limit = var.disk_autoresize_limit
  disk_type          = var.disk_type
  ipv4_enabled       = var.ipv4_enabled
  day                = var.day
  hour               = var.hour
  location           = var.location

  user_labels = var.user_labels

  enable_password_policy = var.enable_password_policy

  deletion_protection = var.deletion_protection
}
