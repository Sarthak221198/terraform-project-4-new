output "project_name" {
  value = var.project_name
}

output "subnet_names" {
  value = var.subnet_names
}

output "subnet_cidr" {
  value = var.subnet_cidr
}

output "vpc_cidr" {
    value = var.vpc_cidr
  
}

output "vpc_id" {
    value = aws_vpc.vpc.id
  
}
#will include all the subnets from the output
output "subnet_id" {
    value = aws_subnet.public_subnets.*.id
}