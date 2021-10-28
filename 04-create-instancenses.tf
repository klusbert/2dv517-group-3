resource "openstack_compute_instance_v2" "word_press" {
  image_id          = var.image_id
  flavor_id         = var.flavor_id
  key_pair          = openstack_compute_keypair_v2.project_keypair.name
  count             = var.wordpress_instances
  name              = format("%s-%02d", "word_press", count.index + 1)
  force_delete      = true
  security_groups   = ["default"]
  availability_zone = var.availability_zone
  depends_on = [
    openstack_networking_router_interface_v2.router_interface_1
  ]
  network {
    name = openstack_networking_network_v2.network_1.name
  }
}

resource "openstack_compute_instance_v2" "db_master" {
  name              = "db_master"
  image_id          = var.image_id
  flavor_id         = var.flavor_id
  key_pair          = openstack_compute_keypair_v2.project_keypair.name
  availability_zone = var.availability_zone
  force_delete      = true
  security_groups   = ["default"]
  depends_on = [
    openstack_networking_router_interface_v2.router_interface_1
  ]
  network {
    name = openstack_networking_network_v2.network_1.name
  }
}

resource "openstack_compute_instance_v2" "db_slave" {
  name              = "db_slave"
  image_id          = var.image_id
  flavor_id         = var.flavor_id
  key_pair          = openstack_compute_keypair_v2.project_keypair.name
  availability_zone = var.availability_zone
  force_delete      = true
  security_groups   = ["default"]
  depends_on = [
    openstack_networking_router_interface_v2.router_interface_1
  ]
  network {
    name = openstack_networking_network_v2.network_1.name
  }
}


resource "openstack_compute_instance_v2" "load_balancer" {
  name              = "load_balancer"
  image_id          = var.image_id
  flavor_id         = var.flavor_id
  key_pair          = openstack_compute_keypair_v2.project_keypair.name
  security_groups   = ["default", openstack_compute_secgroup_v2.http.name, openstack_compute_secgroup_v2.ssh.name, openstack_compute_secgroup_v2.icmp.name]
  availability_zone = var.availability_zone
  force_delete      = true
  depends_on = [
    openstack_networking_router_interface_v2.router_interface_1
  ]
  network {
    name = openstack_networking_network_v2.network_1.name
  }
}

resource "openstack_compute_instance_v2" "monitoring" {
  name              = "monitoring"
  image_id          = var.image_id
  flavor_id         = var.flavor_id
  key_pair          = openstack_compute_keypair_v2.project_keypair.name
  security_groups   = ["default", openstack_compute_secgroup_v2.http.name, openstack_compute_secgroup_v2.ssh.name, openstack_compute_secgroup_v2.icmp.name, openstack_compute_secgroup_v2.monitoring.name]
  availability_zone = var.availability_zone
  force_delete      = true
  depends_on = [
    openstack_networking_router_interface_v2.router_interface_1
  ]
  network {
    name = openstack_networking_network_v2.network_1.name
  }
}


resource "openstack_compute_instance_v2" "fileserver" {
  name              = "fileserver"
  image_id          = var.image_id
  flavor_id         = var.flavor_id
  key_pair          = openstack_compute_keypair_v2.project_keypair.name
  security_groups   = ["default"]
  availability_zone = var.availability_zone
  force_delete      = true
  depends_on = [
    openstack_networking_router_interface_v2.router_interface_1
  ]
  network {
    name = openstack_networking_network_v2.network_1.name
  }

}

resource "openstack_compute_instance_v2" "db_proxy" {
  name              = "db_proxy"
  image_id          = var.image_id
  flavor_id         = var.flavor_id
  key_pair          = openstack_compute_keypair_v2.project_keypair.name
  security_groups   = ["default"]
  availability_zone = var.availability_zone
  force_delete      = true
  depends_on = [
    openstack_networking_router_interface_v2.router_interface_1
  ]
  network {
    name = openstack_networking_network_v2.network_1.name
  }
}
