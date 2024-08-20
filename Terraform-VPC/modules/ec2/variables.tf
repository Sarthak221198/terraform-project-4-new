variable "sg_id" {
  type = string
}
variable "subnet_id" {
  type = list(string)
}

variable "vpc_id" {
  
}

variable "ec2_names" {
  type = list(string)
  default = [ "webserver1", "webserver2" ]
}