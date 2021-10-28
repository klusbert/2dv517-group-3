resource "local_file" "AnsibleInventory" {
  content = templatefile("./template/inventory.tmpl",
    {
      db_master     = openstack_compute_instance_v2.db_master.access_ip_v4,
      db_proxy      = openstack_compute_instance_v2.db_proxy.access_ip_v4,
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
      db_proxy      = openstack_compute_instance_v2.db_proxy,
      db_slave      = openstack_compute_instance_v2.db_slave,
      monitoring    = openstack_compute_instance_v2.monitoring,
      fileserver    = openstack_compute_instance_v2.fileserver,
      load_balancer = openstack_compute_instance_v2.load_balancer,
      word_press    = openstack_compute_instance_v2.word_press.*

    }
  )
  filename = "./ansible-configuration/exports/hosts.j2"
}

# Export the device id to ansible.
resource "local_file" "DeviceFile" {
  content = templatefile("./template/device.tmpl",
    { device_id = openstack_compute_volume_attach_v2.va_1.device }
  )
  filename = "./ansible-configuration/group_vars/fileserver.yml"
}

resource "local_file" "AnsibleVariables" {
  content = templatefile("./template/all.tmpl",
    { username                  = "ubuntu",
      load_balancer_floating_ip = openstack_networking_floatingip_v2.fip_1.address,
      monitoring_floating_ip    = openstack_networking_floatingip_v2.fip_2.address,
      db_master                 = openstack_compute_instance_v2.db_master,
      db_proxy                  = openstack_compute_instance_v2.db_proxy,
      db_slave                  = openstack_compute_instance_v2.db_slave,
      fileserver                = openstack_compute_instance_v2.fileserver,
      monitoring                = openstack_compute_instance_v2.monitoring,
      fileserver                = openstack_compute_instance_v2.fileserver,
      load_balancer             = openstack_compute_instance_v2.load_balancer,
      word_press                = openstack_compute_instance_v2.word_press.*
    }
  )
  filename = "./ansible-configuration/group_vars/all.yml"
}


resource "local_file" "nginx_loadbalancer" {
  content = templatefile("./template/load_balancer.tmpl",
    {

      word_press = openstack_compute_instance_v2.word_press.*,


    }
  )
  filename = "./ansible-configuration/exports/nginx.conf.j2"
}

resource "local_file" "db_loadbalancer" {
  content = templatefile("./template/db_loadbalancer.tmpl",
    {
      db_master = openstack_compute_instance_v2.db_master.access_ip_v4,
      db_slave  = openstack_compute_instance_v2.db_slave.access_ip_v4
    }
  )
  filename = "./ansible-configuration/exports/db_loadbalancer.conf.j2"
}

resource "local_file" "password_output" {
  content = templatefile("./template/password.tmpl",
    { password = random_password.db_password.result }
  )
  filename = "./secrets/db_password.yml"
}

resource "local_file" "monitoring" {
  content = templatefile("./template/prometheus.tmpl",
    {
      db_master                 = openstack_compute_instance_v2.db_master.access_ip_v4,
      db_slave                  = openstack_compute_instance_v2.db_slave.access_ip_v4,
      fileserver                = openstack_compute_instance_v2.fileserver.access_ip_v4,
      load_balancer             = openstack_compute_instance_v2.load_balancer.access_ip_v4,
      word_press_1              = openstack_compute_instance_v2.word_press.0.access_ip_v4,
      word_press_2              = openstack_compute_instance_v2.word_press.1.access_ip_v4,
      word_press_3              = openstack_compute_instance_v2.word_press.2.access_ip_v4,
    }
  )
  filename = "./ansible-configuration/exports/prometheus.yml.j2"
}
