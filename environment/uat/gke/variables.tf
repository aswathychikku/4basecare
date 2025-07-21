#################################################
#               GKE_CLUSTER
#################################################

variable "name" {}
variable "location" {}
variable "node_locations" {}
variable "project_id" {}
variable "initial_node_count" {}
variable "gke_network" {}
variable "gke_subnetwork" {}
variable "pod_secondary_range_name" {}
variable "services_secondary_range_name" {}
variable "master_ipv4_cidr_block" {}
variable "jenkins_range" {}
variable "mgmt_cidr_range" {}
#################################################
#               GKE_NODE_POOL
#################################################

variable "nodepools" {
  type = list(object({
    cluster_name         = string
    total_max_node_count = number
    total_min_node_count = number
    disk_size_gb         = number
    machine_type         = string
    labels               = map(string)
    max_pods_per_node    = number
    service_account      = string
    spot                 = bool
    max_surge            = number
    max_unavailable      = number
    nodepool_name        = string
  }))
}

variable "release_channel" {
  description = "status of release channel"
  type        = string
}

variable "auto_upgrade" {
  description = "management of nodes"
  type        = bool
}

variable "master_version" {
  type        = string
  description = "The Kubernetes version of the masters. If set to 'latest' it will pull latest available version in the selected region."
}

variable "node_version" {
  description = "Kubernetes version for the nodes in this pool"
  type        = string
}

variable "workload_pool" {
  description = "connect to Google API's"
  type        = string
}

variable "monitoring_enable_components" {
  description = "List of monitoring components to enable (e.g., ['SYSTEM_COMPONENTS', 'WORKLOADS']). Leave empty to disable all."
  type        = list(string)
  default     = []
}

