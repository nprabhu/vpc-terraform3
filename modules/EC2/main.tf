# locals {
#   subnets_all = concat(var.subnet_ids_public, var.subnet_ids_private)
#   azs         = data.aws_availability_zones.available.names
# }

resource "aws_instance" "npd_ec2_instance" {
  count         = 10
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  #subnet_id              = local.subnets_all[count.index]
  #availability_zone      = local.azs[count.index % length(local.azs)]

  subnet_id              = count.index < 5 ? var.subnet_ids_public[count.index % length(var.subnet_ids_public)] : var.subnet_ids_private[(count.index - 5) % length(var.subnet_ids_private)]
  vpc_security_group_ids = [var.sg_id]

  associate_public_ip_address = count.index < 5 ? true : false

  tags = {
    Name = count.index < 5 ? "npd_EC2_public_${count.index}" : "npd_EC2_private_${count.index + 5}"
  }
}
