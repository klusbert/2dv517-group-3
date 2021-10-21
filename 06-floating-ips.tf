resource "openstack_networking_floatingip_v2" "fip_1" {
  depends_on = [
    openstack_compute_instance_v2.fileserver
  ]
  pool = var.floating_ip_pool
}

resource "openstack_networking_floatingip_v2" "fip_2" {
  depends_on = [
    openstack_compute_instance_v2.fileserver
  ]
  pool = var.floating_ip_pool
}



resource "openstack_compute_floatingip_associate_v2" "fip_1" {
  floating_ip = openstack_networking_floatingip_v2.fip_1.address
  instance_id = openstack_compute_instance_v2.load_balancer.id
}
resource "openstack_compute_floatingip_associate_v2" "fip_2" {
  floating_ip = openstack_networking_floatingip_v2.fip_2.address
  instance_id = openstack_compute_instance_v2.monitoring.id


}
