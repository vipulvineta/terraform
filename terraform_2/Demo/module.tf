#start module.tf
provider "aws" {
  region     = var.region
}

module "EC2" {
  source = "./modules/EC2"
}

module "s3" {
  source = "./modules/s3"
}




#end start module.tf
