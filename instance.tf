variable "flex_instance_image_ocid" {
  type = map(string)
  default = {
    us-phoenix-1 = "ocid1.image.oc1.phx.aaaaaaaa6hooptnlbfwr5lwemqjbu3uqidntrlhnt45yihfj222zahe7p3wq"
    us-ashburn-1 = "ocid1.image.oc1.iad.aaaaaaaay7aycmqdnjc3y4prhsapf73c6awhevptoik5qeqgzi43s2cdtifq"
    eu-frankfurt-1 = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaadvi77prh3vjijhwe5xbd6kjg3n5ndxjcpod6om6qaiqeu3csof7a"
    uk-london-1 = "ocid1.image.oc1.uk-london-1.aaaaaaaaw5gvriwzjhzt2tnylrfnpanz5ndztyrv3zpwhlzxdbkqsjfkwxaq"
  }
}

variable "instance_shape" {
  default = "VM.Standard.E3.Flex"
}

resource "oci_core_instance" "instance_terraform" {
 #count               = var.num_instances
  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id      = oci_identity_compartment.tf-compartment.id
  display_name        = "TerraformInstance"
  shape               = var.instance_shape

  shape_config {
    ocpus = 1
    memory_in_gbs = 1
  }

  create_vnic_details {
    subnet_id                 = oci_core_subnet.regional_subnet.id
    display_name              = "Primaryvnic"
    assign_public_ip          = true
    assign_private_dns_record = true
    #hostname_label            = "terraforminstance"
  }

  source_details {
    source_type = "image"
    source_id = var.flex_instance_image_ocid[var.region]
    # Apply this to set the size of the boot volume that is created for this instance.
    # Otherwise, the default boot volume size of the image is used.
    # This should only be specified when source_type is set to "image".
    boot_volume_size_in_gbs = "50"
  }

  # Apply the following flag only if you wish to preserve the attached boot volume upon destroying this instance
  # Setting this and destroying the instance will result in a boot volume that should be managed outside of this config.
  # When changing this value, make sure to run 'terraform apply' so that it takes effect before the resource is destroyed.
  #preserve_boot_volume = true

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
    #user_data           = base64encode(file("./userdata/bootstrap"))
  }

  timeouts {
    create = "60m"
  }
}

resource "oci_core_instance" "instance_terraform2" {
 #count               = var.num_instances
  availability_domain = data.oci_identity_availability_domain.ad.name
  compartment_id      = oci_identity_compartment.tf-compartment.id
  display_name        = "TerraformInstance2"
  shape               = var.instance_shape

  shape_config {
    ocpus = 1
    memory_in_gbs = 1
  }

  create_vnic_details {
    subnet_id                 = oci_core_subnet.regional_subnet.id
    display_name              = "Primaryvnic"
    assign_public_ip          = true
    assign_private_dns_record = true
    #hostname_label            = "terraforminstance"
  }

  source_details {
    source_type = "image"
    source_id = var.flex_instance_image_ocid[var.region]
    # Apply this to set the size of the boot volume that is created for this instance.
    # Otherwise, the default boot volume size of the image is used.
    # This should only be specified when source_type is set to "image".
    boot_volume_size_in_gbs = "50"
  }

  # Apply the following flag only if you wish to preserve the attached boot volume upon destroying this instance
  # Setting this and destroying the instance will result in a boot volume that should be managed outside of this config.
  # When changing this value, make sure to run 'terraform apply' so that it takes effect before the resource is destroyed.
  #preserve_boot_volume = true

  metadata = {
    ssh_authorized_keys = var.ssh_public2_key
    #user_data           = base64encode(file("./userdata/bootstrap"))
  }

  timeouts {
    create = "60m"
  }
}