resource "null_resource" "setup_master" {
count = "${var.master_count}"
  connection {
    type     = "ssh"
    user     = "root"
    host = "${element(var.master_ip_address, count.index)}"
    private_key = "${file(var.master_private_ssh_key)}"
  }


 provisioner "file" {
    source      = "${path.module}/scripts"
    destination = "/tmp"

  }



    provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/scripts/*",
      "/tmp/scripts/rhn_register.sh ${var.rhn_username} ${var.rhn_password} ${var.rhn_poolid}",
      ]

    }

    provisioner "remote-exec" {
        when = "destroy"
        inline = [
            "subscription-manager unregister",
        ]
    }

}
