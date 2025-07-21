variable "vpc_peerings" {
  description = "Map of VPC pairs to peer"
  type = map(object({
    vpc_name1 = string
    vpc_name2 = string
  }))
}
