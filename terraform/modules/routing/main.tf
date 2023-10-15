provider "aws" {
  region = "us-west-1"
}

resource "aws_subnet" "recipes_subnet" {
  vpc_id     = var.vpc_default_id
  cidr_block = var.subnet_cidr

  tags = merge(var.tags, {
    Name = "RecipesSubnet"
  })
}

resource "aws_security_group" "recipes_host_sec_group" {
  name = "recipes_host_sec_group"
  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, {
    Name = "RecipesHostSecGroup"
  })
}

resource "aws_security_group" "recipes_sql_sec_group" {
  name = "recipes_sql_sec_group"
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, {
    Name = "RecipesSqlSecGroup"
  })
}
