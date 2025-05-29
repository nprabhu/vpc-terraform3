variable "cidr_block_range" {
  type        = string
  description = "VPC CIDR Block Range"
}

variable "cidr_block_route" {
  type        = string
  description = "VPC CIDR Block Range"
}

variable "ingress_ports" {
  type    = map(number)
}
# EC2 Instance using UBUNTU OS
variable "instance_type" {
  type        = string
  description = "EC2 Instance using Ubuntu OS"
}
