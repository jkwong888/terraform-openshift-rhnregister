resource "null_resource" "setup_app" {
    count = "${var.app_count}"
    connection {
        type     = "ssh"
        user     = "root"
        host = "${element(var.app_ip_address, count.index)}"
        private_key = "${file(var.app_private_ssh_key)}"
        bastion_host = "${var.bastion_ip_address}"
        bastion_host_key = "${file(var.bastion_private_ssh_key)}"
    }

    provisioner "file" {
        when = "create"
        source      = "${path.module}/scripts"
        destination = "/tmp"
    }


    provisioner "remote-exec" {
        when = "create"
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
