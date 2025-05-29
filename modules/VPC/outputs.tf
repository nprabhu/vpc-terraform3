# output "az_count" {
#   value = length(data.aws_availability_zones.available.names)
# }
# output "az_names" {
#   value = data.aws_availability_zones.available.names
# }

# output "Publicsubnet_cidr_block" {
# value = [for x in aws_subnet.PublicSubnets : x.cidr_block]  
# }

#  output "x" {
#   value = length(var.cidr_subnet_range)
#  }

# output "public_subnet_details" {
#   value = [
#     for s in aws_subnet.PublicSubnets :
#     {
#       name = s.tags["Name"]
#       cidr = s.cidr_block
#       az   = s.availability_zone
#     }
#   ]
# }

# output "private_subnet_details" {
#   value = [
#     for p in aws_subnet.PrivateSubnets :
#     {
#       name = p.tags["Name"]
#       cidr = p.cidr_block
#       az   = p.availability_zone
#     }
#   ]
# }

output "vpc_id" {
  description = "VPC ID For EC2 Instances"
  value       = aws_vpc.npd_vpc.id
}

output "subnet_ids_public" {
  description = "Public Subnet ID's For EC2 Instance"
  value       = [for subnet in aws_subnet.PublicSubnets : subnet.id]
}

output "subnet_ids_private" {
  description = "Private Subnet ID's For EC2 Instance"
  value       = [for subnet in aws_subnet.PrivateSubnets : subnet.id]
}
