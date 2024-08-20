variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr"{}
variable "project_name"{}

variable subnet_cidr {
    type = list(string)
}

variable "subnet_names" {
  type = list(string)
  default = [ "PublicSubnet1", "PublicSubnet2" ]
}
