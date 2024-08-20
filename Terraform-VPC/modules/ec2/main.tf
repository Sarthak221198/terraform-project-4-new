data "aws_ami" "amazon-2" {
  most_recent = true

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["amazon"]
}

data "aws_availability_zones" "available_zones" {
  state = "available"
}

resource "aws_instance" "web" {
  count = length(var.ec2_names)
  ami           = data.aws_ami.amazon-2.id
  instance_type = "t3.micro"
  availability_zone = data.aws_availability_zones.available_zones.names[count.index]
  vpc_security_group_ids = [var.sg_id]
  associate_public_ip_address = true
  subnet_id = var.subnet_id[count.index]
  user_data = filebase64("./modules/ec2/user_data.sh") 
  tags = {
    Name = var.ec2_names[count.index]
  }
}