region         = "asia-south1"
project_id     = "cloudside-academy"
sub_project_id = "equentis-shared-services"
network_name   = "projects/equentis-shared-services/global/networks/vpc-uat-services-base"

configs = [
  {
    name                        = "fbc-vm-uat-gcp-alphabet-as1-b"
    subnetwork                  = "projects/equentis-shared-services/regions/asia-south1/subnetworks/sb-uat-services-base-asso1-web1"
    zone                        = "asia-south1-b"
    labels                      = { env = "uat", deployed-by = "cloudside", type = "on-demand" }
    machine_type                = "n1-standard-2"
    service_account             = "equentis-uat-gcp-alphabet@equentis-uat-env.iam.gserviceaccount.com"
    scopes                      = ["cloud-platform"]
    tags                        = ["alphabet", "iap"]
    disk_size                   = "80"
    image                       = "projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20231030"
    deletion_protection         = true
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  },
  {
    name                        = "fbc-vm-uat-blog-as1-a"
    subnetwork                  = "projects/equentis-shared-services/regions/asia-south1/subnetworks/sb-uat-services-base-asso1-web1"
    zone                        = "asia-south1-a"
    labels                      = { env = "uat", deployed-by = "cloudside", type = "spot" }
    machine_type                = "n1-standard-4"
    service_account             = "equentis-uat-gcp-blog@equentis-uat-env.iam.gserviceaccount.com"
    scopes                      = ["cloud-platform"]
    tags                        = []
    disk_size                   = "50"
    image                       = "projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20250213"
    deletion_protection         = true
    preemptible                 = true
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
    key_revocation_action_type  = "NONE"
    instance_termination_action = "STOP"
    automatic_restart           = false
  },
  {
    name                        = "fbc-vm-uat-db-as1-c"
    subnetwork                  = "projects/equentis-shared-services/regions/asia-south1/subnetworks/sb-uat-services-base-asso1-web1"
    zone                        = "asia-south1-c"
    labels                      = { env = "uat", deployed-by = "cloudside", type = "spot" }
    machine_type                = "n1-standard-1"
    service_account             = "equentis-uat-gcp-db@equentis-uat-env.iam.gserviceaccount.com"
    scopes                      = ["cloud-platform"]
    tags                        = []
    disk_size                   = "70"
    image                       = "projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20241219"
    deletion_protection         = true
    preemptible                 = true
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
    key_revocation_action_type  = "NONE"
    metadata            = { enable-osconfig = "TRUE" }
    instance_termination_action = "STOP"
    automatic_restart           = false
  }
]
