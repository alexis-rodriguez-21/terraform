resource "null_resource" "remote-exec" {
  depends_on = [
    oci_core_instance.instance_terraform,
  ]

  connection {
      agent       = false
      timeout     = "30m"
      host        = oci_core_instance.instance_terraform.public_ip
      user        = "opc"
      private_key = var.ssh_private_key
  }

  provisioner "remote-exec" {
    inline = [
          "sudo chmod +x /home/opc/*.sh",
          "sudo /bin/bash /home/opc/12c-prerequisitos",
	  "export PUBLIC_IP=${oci_core_instance.instance_terraform.public_ip}",
          "echo $PUBLIC_IP > /home/opc/public_ip",
          "hostname > /home/opc/hostname",
          "sudo /bin/bash /home/opc/exec.sh",

    ]
  }
}

resource "null_resource" "remote-exec2" {
  depends_on = [
    oci_core_instance.instance_terraform2,
  ]

  connection {
      agent       = false
      timeout     = "30m"
      host        = oci_core_instance.instance_terraform2.public_ip
      user        = "opc"
      private_key = var.ssh_private2_key
  }

  provisioner "remote-exec" {
    inline = [
          "sudo chmod +x /home/opc/*.sh",
          "sudo /bin/bash /home/opc/12c-prerequisitos",
	  "export PUBLIC_IP=${oci_core_instance.instance_terraform2.public_ip}",
          "echo $PUBLIC_IP > /home/opc/public_ip",
          "hostname > /home/opc/hostname",
          "sudo /bin/bash /home/opc/exec.sh",

    ]
  }
}
