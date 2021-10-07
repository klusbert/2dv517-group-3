resource "local_file" "AnsibleInventory" {
  content = templatefile("./template/inventory.tmpl",
    {
      db_master     = openstack_compute_instance_v2.db_master.access_ip_v4,
      db_slave      = openstack_compute_instance_v2.db_slave.access_ip_v4,
      monitoring    = openstack_compute_instance_v2.monitoring.access_ip_v4,
      fileserver    = openstack_compute_instance_v2.fileserver.access_ip_v4,
      load_balancer = openstack_compute_instance_v2.load_balancer.access_ip_v4,
      word_press    = openstack_compute_instance_v2.word_press.*.access_ip_v4, ## send all ip_v4 values to our template, we loop through there.
      floating_ip   = openstack_networking_floatingip_v2.fip_1.address

    }
  )
  filename = "./ansible-configuration/inventory.cfg"
}

resource "local_file" "HostFile" {
  content = templatefile("./template/hosts.tmpl",
    {
      db_master     = openstack_compute_instance_v2.db_master,
      db_slave      = openstack_compute_instance_v2.db_slave,
      monitoring    = openstack_compute_instance_v2.monitoring,
      fileserver    = openstack_compute_instance_v2.fileserver,
      load_balancer = openstack_compute_instance_v2.load_balancer,
      word_press    = openstack_compute_instance_v2.word_press.*

    }
  )
  filename = "./output/hosts"
}

resource "local_file" "DeviceFile" {
  content = templatefile("./template/device.tmpl",
    { device_id = openstack_compute_volume_attach_v2.va_1.device }
  )
  filename = "./ansible-configuration/group_vars/fileserver.yml"
}
