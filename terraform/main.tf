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
