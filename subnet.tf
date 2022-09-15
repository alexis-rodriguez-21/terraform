resource "oci_core_subnet" "regional_subnet" {
  cidr_block        = "11.0.0.0/24"
  display_name      = "regionalSubnetTerraform"
  compartment_id    = oci_identity_compartment.tf-compartment.id
  vcn_id            = oci_core_vcn.vcn.id
  security_list_ids = [oci_core_security_list.example_security_list.id]
  route_table_id    = oci_core_route_table.example_route_table.id
  dhcp_options_id   = oci_core_vcn.vcn.default_dhcp_options_id
}
