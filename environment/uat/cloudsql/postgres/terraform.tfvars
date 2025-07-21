project_id         = "equentis-uat-env"
region             = "asia-south1"
zone               = "asia-south1-b"
db_name            = "postgres-uat-1"
database_version   = "POSTGRES_15"
disk_size          = 43
tier               = "db-custom-4-16384"
pricing_plan       = "PER_USE"
engine_type        = "POSTGRES"
private_network    = "projects/cloudside-academy/global/networks/vpc-uat-services-base"

activation_policy  = "ALWAYS"
availability_type  = "ZONAL"
retained_backups   = 7
retention_unit     = "COUNT"
enabled            = true
start_time         = "00:00"
transaction_log_retention_days = 7
disk_autoresize    = true
disk_autoresize_limit = 0
disk_type          = "PD_SSD"
ipv4_enabled       = false
day                = 7
hour               = 0
location           = "asia"

user_labels = {
  deployed-by = "cloudside"
  env         = "uat"
  team        = "devops"
}

enable_password_policy = false
deletion_protection = true
