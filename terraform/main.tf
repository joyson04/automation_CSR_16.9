terraform {
  required_providers {
    iosxe = {
      source  = "CiscoDevNet/iosxe"
      version = "~>0.5.7"
    }
    null = {
      source = "hashicorp/null"
      version = "3.2.3"
    }
  }
}

provider "iosxe" {
  url      = "https://192.168.174.153"
  username = "admin"
  password = "Cisco123"
  insecure = true
}

# Loopback Interface Configuration
resource "iosxe_interface_loopback" "loop" {
  name              = 100
  description       = "My Interface Description loopback"
  shutdown          = false
  ipv4_address      = "100.1.0.1"
  ipv4_address_mask = "255.255.255.255"
}

# Ethernet Interface Configuration
resource "iosxe_interface_ethernet" "examples" {
  type              = "GigabitEthernet"
  name              = "2"
  shutdown          = false
  ipv4_address      = "10.0.0.1"
  ipv4_address_mask = "255.255.255.0"
  description       = "This interface assign terraform"
  load_interval     = 30
}

# Static Route Configuration
resource "iosxe_static_route" "example_static" {
  prefix = "200.1.1.0"
  mask   = "255.255.255.255"
  next_hops = [
    {
      next_hop = "10.0.0.2"
      name     = "Route1"
    }
  ]
}

