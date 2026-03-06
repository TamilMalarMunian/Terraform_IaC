provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source         = "../modules/vpc"
  vpc_cidr       = "10.0.0.0/16"
  public_subnet1 = "10.0.3.0/24"
  public_subnet2 = "10.0.4.0/24"
}

module "ec2" {
  source        = "../modules/ec2"
  ami           = "ami-019715e0d74f695be"  
  instance_type = "t3.micro"
  subnet_id     = module.vpc.public_subnet1
}

module "alb" {
  source          = "../modules/alb"
  public_subnet_1 = module.vpc.public_subnet1
  public_subnet_2 = module.vpc.public_subnet2
}