project_id         = "cloudside-academy"
region             = "asia-south1"
zone               = "asia-south1-b"
db_name            = "fbc-db-uat-mysql-as1-01"
database_version   = "MYSQL_5_7"
disk_size          = 20
tier               = "db-custom-2-8192"
pricing_plan       = "PER_USE"
engine_type        = "MYSQL"
private_network    = "projects/equentis-shared-services/global/networks/vpc-uat-services-base"

activation_policy  = "ALWAYS"
availability_type  = "ZONAL"
retained_backups   = 7
retention_unit     = "COUNT"
enabled            = true
start_time         = "00:02"
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
