resource "oci_core_internet_gateway" "test_internet_gateway" {
    compartment_id = oci_identity_compartment.tf-compartment.id
    display_name   = "IG-Terraform"
    vcn_id = oci_core_vcn.vcn.id
}
