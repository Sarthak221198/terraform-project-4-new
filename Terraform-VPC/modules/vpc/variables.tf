variable "project_name"{}
variable vpc_cidr{}
variable "subnet_cidr" {
    type = list(string)
}

variable "subnet_names" {
  type = list(string)
  default = [ "PublicSubnet1", "PublicSubnet2" ]
}

