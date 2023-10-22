
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    # Replace this with your bucket name!
    bucket  = "recipe-s3-gj-481"
    key     = "recipe_tf/terraform.tfstate"
    region  = "us-west-1"
    encrypt = true
  }
}

provider "aws" {
  region = "us-west-1"
}

module "routing" {
  source = "./modules/routing"
}

module "instances" {
  source                    = "./modules/instances"
  recipe_subnet_id          = module.routing.recipes_subnet_id
  recipe_host_sec_group_id  = module.routing.recipes_host_sec_group
  recipe_mysql_sec_group_id = module.routing.recipes_sql_sec_group
}
