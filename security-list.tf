resource "oci_core_security_list" "example_security_list" {
  compartment_id = oci_identity_compartment.tf-compartment.id
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = "SecurityListTerraform"

  // allow outbound tcp traffic on all ports
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "6"
  }

  // allow inbound ssh traffic from a specific port
  ingress_security_rules {
    protocol  = "6" // tcp
    source    = "0.0.0.0/0"
    stateless = false

    tcp_options {
      #source_port_range {
      #  min = 100
      #  max = 100
      #}

      // These values correspond to the destination port range.
      min = 22
      max = 22
    }
  }

  ingress_security_rules {
    protocol  = "6" // tcp
    source    = "0.0.0.0/0"
    stateless = false

    tcp_options {
      #source_port_range {
      #  min = 100
      #  max = 100
      #}

      // These values correspond to the destination port range.
      min = 1521
      max = 1521
    }
  }


  // allow inbound icmp traffic of a specific type
  ingress_security_rules {
    protocol    = 1
    source      = "0.0.0.0/0"
    stateless   = true

    icmp_options {
      type = 3
      code = 4
    }
  }
}
