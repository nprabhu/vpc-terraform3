variable "vpc_id" {
  description = "VPC id For Security Group"
  type        = string
}
variable "sg-name" {
    default = "SecurtiyGroupVPC"
  
}

variable "ingress_ports" {
  type    = map(number)
}

variable "cidr_block_range" {
  type        = string
  description = "VPC CIDR Block Range"
}

