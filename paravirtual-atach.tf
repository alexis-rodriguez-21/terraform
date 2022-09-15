resource "oci_core_volume_attachment" "test_block_volume_attach_paravirtualized" {
  attachment_type = "paravirtualized"
  instance_id     = oci_core_instance.instance_terraform.id
  volume_id       = oci_core_volume.test_block_volume_paravirtualized.id
}
