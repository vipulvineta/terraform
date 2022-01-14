variable "region" {
     default = "us-east-2"
}

variable "environment_tag" {
  default = "demo"
}

variable "key_name" {
  default = "demo_key"
}

variable "ami_id" {
  default = "ami-03a0c45ebc70f98ea"
}

# variables.tf
variable "availabilityZone" {
     default = "us-east-2a"
}
variable "instanceTenancy" {
    default = "default"
}
variable "dnsSupport" {
    default = true
}
variable "dnsHostNames" {
    default = true
}
variable "vpcCIDRblock" {
    default = "10.4.0.0/16"
}
variable "subnetCIDRblock" {
    default = "10.4.1.0/24"
}
variable "destinationCIDRblock" {
    default = "0.0.0.0/0"
}
variable "ingressCIDRblock" {
    type = list
    default = [ "0.0.0.0/0" ]
}
variable "egressCIDRblock" {
    type = list
    default = [ "0.0.0.0/0" ]
}
variable "mapPublicIP" {
    default = true
}
# end of variables.tf
