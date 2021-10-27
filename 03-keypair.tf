resource "openstack_compute_keypair_v2" "project_keypair" {
  name = "my-keypair"
}


resource "local_file" "private_key" {
  content = templatefile("./template/privatekey.tmpl",
    { private_key = openstack_compute_keypair_v2.project_keypair.private_key }
  )
  filename = "./secrets/private_key.pem"
}

resource "null_resource" "protect_ssh_key" {
  depends_on = [local_file.private_key]

  provisioner "local-exec" {
     command = "chmod 400 ./secrets/private_key.pem"
  }
}

resource "null_resource" "add_key"{
   depends_on = [null_resource.protect_ssh_key]
     provisioner "local-exec" {
     command = "ssh-add ./secrets/private_key.pem"
  }
}