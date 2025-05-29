variable "instance_type" {
  type        = string
  description = "EC2 Instance usinf Ubuntu OS"
}
variable "subnet_ids_public" {
  description = "Subnets for EC2"
  type        = list(string)
}

variable "subnet_ids_private" {
  description = "Subnets for EC2"
  type        = list(string)
}

variable "sg_id" {
  description = "SG Id For EC2"
  type        = string
}

