provider "aws" {
  region = "us-west-1"
}

resource "aws_instance" "recipes_host" {
  ami                         = var.ec2_ami
  instance_type               = var.instance_type
  vpc_security_group_ids      = [var.recipe_host_sec_group_id]
  subnet_id                   = var.recipe_subnet_id
  key_name                    = var.access_key
  associate_public_ip_address = true

  tags = merge(var.tags, {
    Name = "RecipesHost"
  })

  user_data = <<EOF
#!/bin/bash
sudo apt update
sudo apt install python3-pip
sudo apt install python3-flask
pip install flask-mysql
git clone https://github.com/GennadyEnichek/pet_project.git
cd pet_project/
python3 main.py
EOF
}

resource "aws_instance" "recipes_sql_server" {
  ami                    = var.ec2_ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.recipe_mysql_sec_group_id]
  subnet_id              = var.recipe_subnet_id
  key_name               = var.access_key

  tags = merge(var.tags, {
    Name = "RecipesMySQL"
  })

  user_data = <<EOF
#!/bin/bash
sudo apt update
sudo apt install mysql-server
EOF
}
