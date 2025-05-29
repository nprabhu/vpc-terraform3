cidr_block_range = "10.0.0.0/16"
cidr_block_route = "0.0.0.0/0"
ingress_ports = {
    ssh  = 22
    http = 80
    https = 443
    Jenkins = 8080
    Nexus = 8081
  }
instance_type = "t2.micro"