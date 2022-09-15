resource "oci_core_vcn" "vcn" {
  cidr_blocks    = ["11.0.0.0/16"]
  compartment_id = oci_identity_compartment.tf-compartment.id
  display_name   = "vcn-terraform"
}
