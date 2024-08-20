variable "project_name"{}
variable "sg_id" {
  type = string
}

variable "vpc_id" {
  
}

variable "instances" {
  
}

variable "subnet_id" {
    description = "Subnets for ALB"
    type = list(string)
}