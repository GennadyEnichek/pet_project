variable "vpc_default_id" {
  description = "Virtual private cloud default id"
  type        = string
  default     = "vpc-0f488eb699cfd3961"
}

variable "subnet_cidr" {
  description = "CIDR block for recipe subnet"
  type        = string
  default     = "172.31.200.0/24"
}

variable "internet_gateway" {
  description = "Internet geatway for recipe subnet"
  type        = string
  default     = "igw-0261567907a479577"
}

variable "tags" {
  description = "Tags for routing module"
  type        = map(string)
  default = {
    Owner   = "GenadijsJ"
    Project = "Recipes"

  }
}
