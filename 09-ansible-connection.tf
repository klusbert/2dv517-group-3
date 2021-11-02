
resource "null_resource" "provisioner" {
  depends_on = [
                openstack_compute_floatingip_associate_v2.fip_1,
                openstack_compute_floatingip_associate_v2.fip_2,
                local_file.AnsibleInventory,
                local_file.HostFile,
                local_file.password_output,
                local_file.DeviceFile,
                local_file.AnsibleVariables,
                local_file.nginx_loadbalancer,
                local_file.db_loadbalancer               
                ]
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i './ansible-configuration/inventory.cfg' ./ansible-configuration/configuration.yml"
    #command = "ansible-playbook -i './ansible-configuration/inventory.cfg' ./ping.yml" # testing only
  }
}



