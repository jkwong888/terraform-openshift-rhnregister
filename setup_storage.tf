resource "null_resource" "setup_storage" {
    count = "${var.storage_count}"
    connection {
        type     = "ssh"
        user     = "root"
        host = "${element(var.storage_ip_address, count.index)}"
        private_key = "${file(var.storage_private_ssh_key)}"
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
