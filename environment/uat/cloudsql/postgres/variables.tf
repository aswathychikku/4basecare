variable "project_id" {
  description = "The GCP project ID where the Cloud SQL instance will be created."
  type        = string
}

variable "region" {
  description = "The GCP region for the Cloud SQL instance."
  type        = string
}

variable "zone" {
  description = "The preferred GCP zone for the Cloud SQL instance within the specified region."
  type        = string
}

variable "db_name" {
  description = "The name of the Cloud SQL database instance."
  type        = string
}

variable "database_version" {
  description = "The database version for the Cloud SQL instance (e.g., POSTGRES_15)."
  type        = string
}

variable "disk_size" {
  description = "The size of the data disk in GB."
  type        = number
}

variable "tier" {
  description = "The machine type (tier) for the Cloud SQL instance (e.g., db-f1-micro, db-custom-4-16384)."
  type        = string
}

variable "pricing_plan" {
  description = "The pricing plan for the instance. Currently, only 'PER_USE' is supported."
  type        = string
  default     = "PER_USE"
}

variable "engine_type" {
  description = "The database engine type (e.g., MYSQL, POSTGRES, SQLSERVER)."
  type        = string
}

variable "private_network" {
  description = "The self-link of the VPC network for private IP connectivity."
  type        = string
}

variable "activation_policy" {
  description = "This specifies when the instance should be active. Can be 'ALWAYS', 'NEVER', or 'ON_DEMAND'."
  type        = string
  default     = "ALWAYS"
}

variable "availability_type" {
  description = "The availability type of the Cloud SQL instance: 'REGIONAL' for high availability or 'ZONAL' for single zone."
  type        = string
  default     = "ZONAL"
}

variable "retained_backups" {
  description = "The number of backups to retain."
  type        = number
  default     = 7
}

variable "retention_unit" {
  description = "The unit that 'retained_backups' represents. Defaults to 'COUNT'."
  type        = string
  default     = "COUNT"
}

variable "enabled" {
  description = "Set to true if backup configuration is enabled."
  type        = bool
  default     = true
}

variable "start_time" {
  description = "The start time for daily backups in HH:MM format (UTC)."
  type        = string
  default     = "03:00"
}

variable "transaction_log_retention_days" {
  description = "The number of days of transaction logs to retain for point-in-time recovery (from 1-7)."
  type        = number
  default     = 7
}

variable "disk_autoresize" {
  description = "Set to true to enable automatic storage size increase."
  type        = bool
  default     = true
}

variable "disk_autoresize_limit" {
  description = "The maximum disk size (in GB) to which the disk can auto-resize. 0 means no limit."
  type        = number
  default     = 0
}

variable "disk_type" {
  description = "The type of data disk: 'PD_SSD' or 'PD_HDD'."
  type        = string
  default     = "PD_SSD"
}

variable "ipv4_enabled" {
  description = "Set to true to assign a public IPv4 address to the instance."
  type        = bool
  default     = false
}

variable "day" {
  description = "Day of week (1-7), starting on Monday, for maintenance window."
  type        = number
  default     = 6
}

variable "hour" {
  description = "Hour of day (0-23), ignored if day not set, for maintenance window."
  type        = number
  default     = 8
}

variable "location" {
  description = "The location for the backup configuration (e.g., 'asia'). Note: This is an input to your module if it defines a 'location' variable. If your module's location is a sub-field like `backup_configuration.location`, this variable might need to be named differently or removed from the root."
  type        = string
}

variable "user_labels" {
  description = "A map of key/value user labels to assign to the instance. 'account' and 'env' labels are required by your module."
  type        = map(string)
}

variable "enable_password_policy" {
  description = "Set to true to enable password validation policy."
  type        = bool
  default     = false
}

variable "deletion_protection" {
  description = "Set to true to block Terraform from deleting a SQL Instance."
  type        = bool
  default     = true
}
