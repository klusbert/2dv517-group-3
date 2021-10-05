resource "openstack_blockstorage_volume_v2" "file_storage" {
  name = "file_storage"
  size = 10
}


##Attache the new storage to file_Server
resource "openstack_compute_volume_attach_v2" "va_1" {
  # make sure the file server is created
  depends_on = [
    openstack_compute_instance_v2.fileserver
  ]
  instance_id = "${openstack_compute_instance_v2.fileserver.id}"
  volume_id   = "${openstack_blockstorage_volume_v2.file_storage.id}"
}