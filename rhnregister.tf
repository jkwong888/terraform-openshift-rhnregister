locals {
    all_hosts_ip_address = "${concat(list(var.bastion_ip_address), var.master_ip_address, var.infra_ip_address, var.app_ip_address, var.storage_ip_address, var.haproxy_ip_address)}"
}

resource "null_resource" "rhnregister" {
    count = "${var.bastion["nodes"] + var.master["nodes"] + var.infra["nodes"] + var.worker["nodes"] + var.storage["nodes"] + var.haproxy["nodes"]}"
    connection {
        type     = "ssh"
        user     = "${var.ssh_username}"
        host = "${element(local.all_hosts_ip_address, count.index)}"
        private_key = "${file(var.private_ssh_key)}"
        bastion_host = "${var.bastion_ip_address}"
        bastion_host_key = "${file(var.private_ssh_key)}"
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
