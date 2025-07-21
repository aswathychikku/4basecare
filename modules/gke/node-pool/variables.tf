variable "cluster_name" {
  description = "Name of the cluster"
  type        = string
}
variable "location" {
  description = "Name of the location"
  type        = string
}
variable "project" {
  description = "Name of the project"
  type        = string
}
variable "total_min_node_count" {
  description = "Total maximum number of nodes in the NodePool. Must be >= min_node_count."
  type        = number
}
variable "total_max_node_count" {
  description = "Total minimum number of nodes in the NodePool. Must be >=0 and <= max_node_count."
  type        = number
}
variable "disk_size_gb" {
  description = "Size of the disk"
  type        = number
}
variable "disk_type" {
  description = "Type of the disk"
  type        = string
  default     = "pd-balanced"
}
variable "local_ssd_count" {
  type = number
  default = 0
}
variable "image_type" {
  description = "Type of the image"
  type        = string
  default     = "COS_CONTAINERD"
}
variable "machine_type" {
  description = "Type of the machine"
  type        = string
}
variable "labels" {
  type        = map(string)
  description = "Labels, provided as a map"
}
variable "service_account" {
  description = "About the service account"
  type        = string
}
variable "oauth_scopes" {
  description = "List of API's"
  type        = list(string)
  default     = ["https://www.googleapis.com/auth/cloud-platform"]
}
variable "auto_repair" {
  description = "management of nodes"
  type        = bool
  default     = true
}
variable "auto_upgrade" {
  description = "management of nodes"
  type        = bool
  default     = false
}
variable "max_surge" {
  description = "upgrade settings"
  type        = number
}
variable "max_unavailable" {
  description = "upgrade settings"
  type        = number
}
variable "enable_integrity_monitoring" {
   description = "Defines whether the instance has integrity monitoring enabled."
   type        = bool
   default     = true
}
variable "enable_secure_boot" {
   description = "Defines whether the instance has Secure Boot enabled"
   type        = bool
   default     = true
}
variable "max_pods_per_node" {
    description = "The maximum number of pods per node in this node pool"
    type        = number
}
variable "nodepool_name" {
    description = "Name of the nodepool"
    type        = string
}
variable "node_version" {
  description = "Kubernetes version for the nodes in this pool"
  type        = string
  default     = "1.30.5-gke.1014001"
}
variable "spot" {
  description = "spot instance for nodepool"
  type        = string
}
