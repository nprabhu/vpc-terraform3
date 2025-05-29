resource "aws_security_group" "NPD-SG" {
  vpc_id      = var.vpc_id
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"

  tags = {
    Name = var.sg-name
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ports" {
  for_each          = var.ingress_ports
  security_group_id = aws_security_group.NPD-SG.id
  ip_protocol       = "tcp"
  from_port         = each.value
  to_port           = each.value
  cidr_ipv4         = var.cidr_block_range
  description       = "Allow ${each.key} traffic on port ${each.value}"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.NPD-SG.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
