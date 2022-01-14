# VPC.tf
# Create VPC/Subnet/Security Group


# create the VPC
resource "aws_vpc" "vpc_Demo" {
  cidr_block           = var.vpcCIDRblock
  instance_tenancy     = var.instanceTenancy
  enable_dns_support   = var.dnsSupport
  enable_dns_hostnames = var.dnsHostNames
tags = {
    Name = "vpc_Demo"
    CreatedBy = "Terraform"

}
} # end resource
# create the Subnet
resource "aws_subnet" "Demo_Subnet" {
  vpc_id                  = aws_vpc.vpc_Demo.id
  cidr_block              = var.subnetCIDRblock
  map_public_ip_on_launch = var.mapPublicIP
  availability_zone       = var.availabilityZone
tags = {
    Name = "subnet_Demo"
    CreatedBy = "Terraform"

}
} # end resource
# Create the Security Group
resource "aws_security_group" "Demo_Security_Group" {
  vpc_id       = aws_vpc.vpc_Demo.id
  name         = "Demo_SecurityGroup"
  description  = "VPC Demo Security Group"

  # allow ingress of port 22
  ingress {
    cidr_blocks = var.ingressCIDRblock
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  # allow egress of all ports
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
tags = {
    Name = "sg_Demo"
    CreatedBy = "Terraform"

}
}
# end resource


# Create the Internet Gateway
resource "aws_internet_gateway" "Demo_IGW" {
 vpc_id = aws_vpc.vpc_Demo.id
tags = {
    Name = "IGW_Demo"
    CreatedBy = "Terraform"

}
}
# end resource

# Create the Route Table
resource "aws_route_table" "Demo_route_table" {
 vpc_id = aws_vpc.vpc_Demo.id
tags = {
    Name = "rt_Demo"
    CreatedBy = "Terraform"

}
}
# end resource

# Create the Internet Access
resource "aws_route" "Demo_internet_access" {
  route_table_id         = aws_route_table.Demo_route_table.id
  destination_cidr_block = var.destinationCIDRblock
  gateway_id             = aws_internet_gateway.Demo_IGW.id
}
# end resource

# Associate the Route Table with the Subnet
resource "aws_route_table_association" "Demo_association" {
  subnet_id      = aws_subnet.Demo_Subnet.id
  route_table_id = aws_route_table.Demo_route_table.id
}
# end resource




# end main.tf
