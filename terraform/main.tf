provider "aws" {
  region = "us-west-1"
}

resource "aws_subnet" "recipes_subnet" {
  vpc_id     = "vpc-0f488eb699cfd3961"
  cidr_block = "172.31.200.0/24"

  tags = {
    Name  = "recipes_subnet"
    Owner = "GenadijsJ"
  }
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

  tags = {
    Name  = "recipes_host_sec_group"
    Owner = "GenadijsJ"
  }
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

  tags = {
    Name  = "recipes_sql_sec_group"
    Owner = "GenadijsJ"
  }
}


resource "aws_instance" "recipes_host" {
  ami                         = "ami-0f8e81a3da6e2510a"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.recipes_host_sec_group.id]
  subnet_id                   = aws_subnet.recipes_subnet.id
  key_name                    = "KeyPairForGJInstance"
  associate_public_ip_address = true

  tags = {
    Name  = "recipes_host"
    Owner = "GenadijsJ"
  }
}

resource "aws_instance" "recipes_sql_server" {
  ami                    = "ami-0f8e81a3da6e2510a"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.recipes_sql_sec_group.id]
  subnet_id              = aws_subnet.recipes_subnet.id
  key_name               = "KeyPairForGJInstance"

  tags = {
    Name  = "recipes_sql_server"
    Owner = "GenadijsJ"
  }
}
