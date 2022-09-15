data "oci_identity_availability_domain" "ad" {
  compartment_id = oci_identity_compartment.tf-compartment.id
  ad_number      = 1
}

resource "oci_core_volume" "test_block_volume_paravirtualized" {
  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id      = oci_identity_compartment.tf-compartment.id
  display_name        = "BlockParavirtualizedTerraform"
  size_in_gbs         = "50"
}
