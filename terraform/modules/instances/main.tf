provider "aws" {
  region = "us-west-1"
}

resource "aws_instance" "recipes_host" {
  ami                         = var.ec2_ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [var.recipe_host_sec_group_id]
  subnet_id                   = var.recipe_subnet_id
  private_ip                  = var.app_static_ip
  key_name                    = var.access_key
  associate_public_ip_address = true

  tags = merge(var.tags, {
    Name = "RecipesHost"
  })

  user_data = file("modules/instances/host_init.sh")

}

resource "aws_instance" "recipes_sql_server" {
  ami                         = var.ec2_ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [var.recipe_mysql_sec_group_id]
  subnet_id                   = var.recipe_subnet_id
  private_ip                  = var.sql_static_ip
  key_name                    = var.access_key
  associate_public_ip_address = true

  tags = merge(var.tags, {
    Name = "RecipesMySQL"
  })

  user_data = file("modules/instances/mysql_init.sh")
}
