############
#  Subnet  #
############
subnets = {
  "fbc-subnet-uat-web1-as1" = {
    network_name          = "fbc-vpc-uat-as1"
    subnet_ip             = "10.26.0.0/24"
    subnet_region         = "asia-south1"
    subnet_private_access = true
    description           = "Web Subnet"
}
  "fbc-subnet-uat-apps1-as1" = {
    network_name          = "fbc-vpc-uat-as1"
    subnet_ip             = "10.26.1.0/24"
    subnet_region         = "asia-south1"
    subnet_private_access = true
    description           = "App Subnet"
  }
  "fbc-subnet-uat-db1-as1" = {
    network_name          = "fbc-vpc-uat-as1"
    subnet_ip             = "10.26.2.0/24"
    subnet_region         = "asia-south1"
    subnet_private_access = true
    description           = "DB Subnet"
  }
  "fbc-subnet-uat-k8s-node-as1" = {
    network_name          = "fbc-vpc-uat-as1"
    subnet_ip             = "10.55.0.0/21"
    subnet_region         = "asia-south1"
    subnet_private_access = true
    description           = "K8s Subnet"
  }
  "fbc-subnet-uat-public-as1" = {
    network_name          = "fbc-vpc-uat-as1"
    subnet_ip             = "10.40.1.0/24"
    subnet_region         = "asia-south1"
    subnet_private_access = true
    description           = "Public Subnet"
  }
  "fbc-subnet-uat-private-as1" = {
    network_name          = "fbc-vpc-uat-as1"
    subnet_ip             = "10.24.1.0/24"
    subnet_region         = "asia-south1"
    subnet_private_access = true
    description           = "Private Subnet"
  }
  "fbc-subnet-uat-proxy-as1" = {
    network_name          = "fbc-vpc-uat-as1"
    subnet_ip             = "10.28.2.0/23"
    subnet_region         = "asia-south1"
    subnet_private_access = false
    description           = "Proxy Subnet"
    purpose               = "REGIONAL_MANAGED_PROXY"
    role                  = "ACTIVE"
  }
}

secondary_ranges = {
  fbc-sec-subnet-uat-k8s-node-as1 = [
    {
      range_name    = "fbc-sec-subnet-uat-gsvc1-as1"
      ip_cidr_range = "10.56.0.0/16"
    },
    {
      range_name    = "fbc-sec-subnet-uat-gsvc2-as1"
      ip_cidr_range = "10.58.0.0/16"
    },
    {
      range_name    = "fbc-sec-subnet-uat-gpod2-as1"
      ip_cidr_range = "10.59.0.0/16"
    },
    {
      range_name    = "fbc-sec-subnet-uat-gpod1-as1"
      ip_cidr_range = "10.57.0.0/16"
    }
  ]
}