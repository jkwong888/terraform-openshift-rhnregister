module "runplaybook" {
  source = "github.com/ibm-cloud-architecture/terraform-ansible-runplaybooks.git"

  ansible_playbook_dir = "${path.module}/playbooks"
  ansible_playbooks = [
    "playbooks/configure_rhn.yaml"
  ]

  ansible_playbooks_destroy = [
    "playbooks/unregister.yaml"
  ]

  ssh_user           = "${var.ssh_user}"
  ssh_password       = "${var.ssh_password}"
  ssh_private_key    = "${var.ssh_private_key}"

  bastion_ip_address       = "${var.bastion_ip_address}"
  bastion_ssh_user         = "${var.bastion_ssh_user}"
  bastion_ssh_password     = "${var.bastion_ssh_password}"
  bastion_ssh_private_key  = "${var.bastion_ssh_private_key}"

  node_ips = "${var.all_nodes}"
  node_hostnames = "${var.all_nodes}"

  dependson = "${var.dependson}"

  triggerson = {
    node_ips = "${join(",", var.all_nodes)}"
  }

  ansible_vars       = {
    "rhn_username" = "${var.rhn_username}"
    "rhn_password" = "${var.rhn_password}"
    "rhn_poolid"  = "${var.rhn_poolid}"

    "rhn_server_hostname" = "${var.rhn_server_hostname}"
    "rhn_server_prefix" = "${var.rhn_server_prefix}"
    "rhn_server_port" = "${var.rhn_server_port}"

    "rhn_rhsm_baseurl" = "${var.rhn_rhsm_baseurl}"
    "rhn_rhsm_repo_ca_cert" = "${var.rhn_rhsm_repo_ca_cert}"
  }

  # ansible_verbosity = "-vvv"
}

