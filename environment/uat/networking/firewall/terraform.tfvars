################
#  Project ID  #
################

project_id = "cloudside-academy"

#################
#  VPC Network  #
#################

network_name = "fbc-vpc-uat-as1"

####################
#  Firewall Rules  #
####################

rules = [
  {
    name        = "fbc-fw-uat-ssh-iap-as1"
    description = "SSH access via IAP"
    direction   = "INGRESS"
    priority    = "1000"
    ranges      = ["35.235.240.0/20"]

    allow = [
      {
        protocol = "tcp"
        ports    = ["22"]
      }
    ]
  },
  {
    name        = "fbc-fw-uat-health-check-as1"
    description = "Allow GCP Health Check probes"
    direction   = "INGRESS"
    priority    = "1000"
    ranges      = ["209.85.204.0/22", "209.85.152.0/22", "130.211.0.0/22", "35.191.0.0/16"]

    allow = [
      {
        protocol = "tcp"
      }
    ]
  },
  {
    name        = "fbc-fw-uat-internal-as1"
    description = "Allow internal CIDR range"
    direction   = "INGRESS"
    priority    = "1000"
    ranges      = ["10.0.0.0/8"]

    allow = [
      {
        protocol = "all"
      }
    ]
  },
  {
    name        = "fbc-fw-uat-https-as1"
    description = "Allow HTTPS"
    direction   = "INGRESS"
    priority    = "1000"
    ranges      = ["0.0.0.0/0"]

    allow = [
      {
        protocol = "tcp"
        ports    = ["443"]
      }
    ]

    source_tags = ["https-server"]
  },
  {
    name        = "fbc-fw-uat-http-as1"
    description = "Allow HTTP"
    direction   = "INGRESS"
    priority    = "1000"
    ranges      = ["0.0.0.0/0"]

    allow = [
      {
        protocol = "tcp"
        ports    = ["80"]
      }
    ]

    source_tags = ["http-server"]
  }
]

