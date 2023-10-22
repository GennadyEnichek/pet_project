variable "ec2_ami" {
  description = "Amazon Machine Images (AMIs) for instances"
  type        = string
  default     = "ami-04d1dcfb793f6fa37"
}

variable "instance_type" {
  description = "Instances type"
  type        = string
  default     = "t2.micro"
}

variable "access_key" {
  description = "SSH key for access to instance"
  type        = string
  default     = "KeyPairForGJInstance"
}

variable "app_static_ip" {
  description = "static ip address for Host instance"
  type        = string
  default     = "172.31.200.109"
}

variable "sql_static_ip" {
  description = "static ip address for MySQL instance"
  type        = string
  default     = "172.31.200.169"
}

variable "recipe_subnet_id" {
  description = "Subnet ID for recipe project instances"
  type        = string
}

variable "recipe_host_sec_group_id" {
  description = "Security group ID for recipe host instances"
  type        = string
}

variable "recipe_mysql_sec_group_id" {
  description = "Security group ID for recipe mysql instances"
  type        = string
}

variable "tags" {
  description = "Tags for routing module"
  type        = map(string)
  default = {
    Owner   = "GenadijsJ"
    Project = "Recipes"
  }
}
