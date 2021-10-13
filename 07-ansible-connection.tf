resource "time_sleep" "wait_30_seconds" {
  depends_on = [local_file.AnsibleInventory]

  create_duration = "30s"
}




resource "null_resource" "addkey" {
  depends_on = [time_sleep.wait_30_seconds]

  provisioner "local-exec" {
    command = "chmod 400 ./secrets/private_key.pem && ssh-add ./secrets/private_key.pem"
  }
}

resource "null_resource" "provisioner" {

  depends_on = [time_sleep.wait_30_seconds]
  triggers = {
    always_run = "${timestamp()}"
  }
  provisioner "local-exec" {
    command = "ansible-playbook -i './ansible-configuration/inventory.cfg' ./ansible-configuration/configuration.yml"
  }
}



