resource "openstack_compute_secgroup_v2" "http" {
  name        = "HTTP"
  description = "Http trafic and https"
  rule {
    from_port   = 80
    to_port     = 80
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
    rule {
    from_port   = 443
    to_port     = 443
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"

  }
}

resource "openstack_compute_secgroup_v2" "icmp" {
  name          = "ICMP"
  description   = "ICMP rules for ping"
  rule {
    from_port   = -1
    to_port     = -1
    ip_protocol = "icmp"
    cidr        = "0.0.0.0/0"
  }
}

resource "openstack_compute_secgroup_v2" "ssh" {
  name          = "SSH"
  description   = "SSH rules"
  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
}

resource "openstack_compute_secgroup_v2" "monitoring" {
  name          = "MONITORING"
  description   = "HTTP for prometheus"
  rule {
    from_port   = 9090
    to_port     = 9090
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
}
