region = "northeurope"

####
network = {
  address_space = ["10.5.0.0/18"]
  subnets = {
    nodes = "10.5.0.0/26"
  }
  network_security_rules = {
    "allow_http" = {
      priority                   = "100"
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "tcp"
      source_port_range          = "*"
      destination_port_ranges    = [80]
      source_address_prefixes    = ["0.0.0.0/0"]
      destination_address_prefix = "*"
    }
  }
}