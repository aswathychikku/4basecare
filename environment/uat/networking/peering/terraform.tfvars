vpc_peerings = {
  "protected-to-uat-vpc" = {
    vpc_name1 = "projects/equentis-shared-services/global/networks/protected-network"
    vpc_name2 = "projects/equentis-shared-services/global/networks/vpc-uat-services-base"
  },
  "uat-to-protected-vpc" = {
    vpc_name1 = "projects/equentis-shared-services/global/networks/vpc-uat-services-base"
    vpc_name2 = "projects/equentis-shared-services/global/networks/protected-network"
  }
}
