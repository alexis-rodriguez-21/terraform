resource "oci_core_route_table" "example_route_table" {
  compartment_id = oci_identity_compartment.tf-compartment.id
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = "RouteTable-Terraform"

  route_rules {
    description       = "ReglaIG"
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.test_internet_gateway.id
  }
}
