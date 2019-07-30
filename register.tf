data "template_file" "rhn_register_sh" {
  vars = {
    verbosity = ""

    rhel_user_name = "${var.rhn_username}"
    rhel_password  = "${var.rhn_password}"
    subscription_pool = "${var.rhn_poolid}"
  }

  template = "${file("${path.module}/templates/rhn_register.sh.tpl")}"

}

resource "null_resource" "rhn_register" {
    count = "${length(var.node_ip_address)}"

    connection {
        type     = "ssh"
        host = "${element(var.node_ip_address, count.index)}"
        user     = "${var.ssh_user}"
        password = "${var.ssh_password}"
        private_key = "${var.ssh_private_key}"

        bastion_host = "${var.bastion_ip_address}"
        bastion_password = "${var.bastion_ssh_password}"
        bastion_host_key = "${var.bastion_ssh_private_key}"
    }

    provisioner "file" {
        when = "create"
        content      = "${data.template_file.rhn_register_sh.rendered}"
        destination = "/tmp/rhn_register.sh"
    }

    provisioner "remote-exec" {
        when = "create"
        inline = [
            "chmod +x /tmp/rhn_register.sh",
            "sudo /tmp/rhn_register.sh",
        ]
    }

    provisioner "remote-exec" {
        when = "destroy"
        inline = [
            "sudo subscription-manager unregister",
        ]
    }
}
