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

variable "instance_type" {
  type        = string
  description = "EC2 Instance usinf Ubuntu OS"
}

