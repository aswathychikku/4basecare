#################################################
#               GKE CLUSTER
#################################################

module "gke-private" {
  source                        = "../../../modules/gke/cluster"
  name                          = var.name
  project                       = var.project_id
  location                      = var.location
  node_locations                = var.node_locations
  release_channel               = var.release_channel
  initial_node_count            = var.initial_node_count
  cluster_secondary_range_name  = var.pod_secondary_range_name
  services_secondary_range_name = var.services_secondary_range_name
  network                       = var.gke_network
  subnetwork                    = var.gke_subnetwork
  master_ipv4_cidr_block        = var.master_ipv4_cidr_block
  master_version                = var.master_version
  workload_pool                 = var.workload_pool
  monitoring_enable_components  = var.monitoring_enable_components
  master_authorized_networks_config = [
    {
      cidr_blocks = [
        {
          cidr_block   = var.mgmt_cidr_range
          display_name = "mgmt_cidr_range"
        },
        {
          cidr_block   = var.jenkins_range
          display_name = "jenkins range"
        }
      ]
    }
  ]
}

#################################################
#                NODE POOL
#################################################

module "nodepool" {
  source = "../../../modules/gke/node-pool"

  for_each = { for pool in var.nodepools : pool.nodepool_name => pool }

  cluster_name         = each.value.cluster_name
  project              = var.project_id
  location             = var.location
  auto_upgrade         = var.auto_upgrade
  node_version         = var.node_version
  total_max_node_count = each.value.total_max_node_count
  total_min_node_count = each.value.total_min_node_count
  disk_size_gb         = each.value.disk_size_gb
  machine_type         = each.value.machine_type
  labels               = each.value.labels
  max_pods_per_node    = each.value.max_pods_per_node
  service_account      = each.value.service_account
  spot                 = each.value.spot
  max_surge            = each.value.max_surge
  max_unavailable      = each.value.max_unavailable
  nodepool_name        = each.value.nodepool_name
}

