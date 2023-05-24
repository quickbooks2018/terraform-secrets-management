#VPC
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"

  name = "main"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.0.0/19", "10.0.32.0/19"]
  public_subnets  = ["10.0.64.0/19", "10.0.96.0/19"]

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false
}

#DB Subnet Group
resource "aws_db_subnet_group" "public" {
  name       = "public"
  subnet_ids = module.vpc.public_subnets
}

#KMS Key
data "aws_kms_secrets" "creds" {
  secret {
    name    = "db"
    payload = file("${path.module}/db-creds.yml.encrypted")
  }
}

#Local Variables
locals {
  db_creds = yamldecode(data.aws_kms_secrets.creds.plaintext["db"])
}

#DB Instance
resource "aws_db_instance" "mydb" {
  db_name           = "mydb"
  engine            = "postgres"
  engine_version    = "15"
  instance_class    = "db.t4g.micro"
  allocated_storage = 10

  publicly_accessible  = true
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.public.name

  username = local.db_creds.username
  password = local.db_creds.password
}