#################################################
#                  GKE_CLUSTER
#################################################

name                          = "equentis-uat-asso1-gke-cluster"
location                      = "asia-south1"
project_id                    = "cloudside-academy"
node_locations                = ["asia-south1-b", "asia-south1-a"]
release_channel               = "STABLE"
initial_node_count            = 1
pod_secondary_range_name      = "sb-p-services-base-asso1-gpod1"
services_secondary_range_name = "sb-uat-services-base-asso1-gsvc1"
gke_network                   = "projects/equentis-shared-services/global/networks/vpc-uat-services-base"
gke_subnetwork                = "projects/equentis-shared-services/regions/asia-south1/subnetworks/sb-uat-services-base-asso1-k8s-node"
master_ipv4_cidr_block        = "172.16.0.0/28"
mgmt_cidr_range               = "10.24.2.0/24"
jenkins_range                 = "10.27.6.0/24"
master_version                = "1.31.8-gke.1045000"
workload_pool                 = "equentis-uat-env.svc.id.goog"
monitoring_enable_components  = ["SYSTEM_COMPONENTS", "STORAGE", "POD", "DEPLOYMENT", "STATEFULSET", "DAEMONSET", "HPA"]

#################################################
#               GKE_NODE_POOL
#################################################

auto_upgrade = "true"
node_version = "1.31.8-gke.1045000"
nodepools = [
  {
    cluster_name         = "equentis-uat-asso1-gke-cluster"
    total_max_node_count = "10"
    total_min_node_count = "1"
    disk_size_gb         = "80"
    machine_type         = "e2-standard-4"
    labels               = { env = "uat", team = "devops", deployed-by = "cloudside", type = "spot" }
    max_pods_per_node    = "110"
    service_account      = "equentis-uat-gcp-k8s@equentis-uat-env.iam.gserviceaccount.com"
    spot                 = true
    max_surge            = 1
    max_unavailable      = 0
    nodepool_name        = "equentis-uat-nodepool-asso1"
  }
]

