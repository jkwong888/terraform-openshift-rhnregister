resource "null_resource" "setup_infra" {
    count = "${var.infra_count}"
    connection {
        type     = "ssh"
        user     = "${var.ssh_username}"
        host = "${element(var.infra_ip_address, count.index)}"
        private_key = "${file(var.infra_private_ssh_key)}"
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
            "sudo chmod +x /tmp/scripts/*",
            "sudo /tmp/scripts/rhn_register.sh ${var.rhn_username} ${var.rhn_password} ${var.rhn_poolid}",
        ]
    }

    provisioner "remote-exec" {
        when = "destroy"
        inline = [
            "sudo subscription-manager unregister",
        ]
    }
}
