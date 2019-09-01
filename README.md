## terraform-openshift-rhnregister

This is meant to be used as a module, make sure your module implementation sets all the variables in its terraform.tfvars file

```terraform
locals {
    rhn_all_nodes = "${concat(
        "${list(module.infrastructure.bastion_public_ip)}",
        "${module.infrastructure.master_private_ip}",
        "${module.infrastructure.infra_private_ip}",
        "${module.infrastructure.app_private_ip}",
        "${module.infrastructure.storage_private_ip}",
        "${module.infrastructure.haproxy_public_ip}",
    )}"
    rhn_all_count = "${var.bastion["nodes"] + var.master["nodes"] + var.infra["nodes"] + var.worker["nodes"] + var.storage["nodes"] + var.haproxy["nodes"]}"
}

module "rhnregister" {
  source = "github.com/ibm-cloud-architecture/terraform-openshift-rhnregister.git?ref=v1.1"
  bastion_ip_address = "${module.infrastructure.bastion_public_ip}"
  private_ssh_key    = "${var.private_ssh_key}"
  ssh_username       = "${var.ssh_user}"
  rhn_username       = "${var.rhn_username}"
  rhn_password       = "${var.rhn_password}"
  rhn_poolid         = "${var.rhn_poolid}"
  all_nodes          = "${local.rhn_all_nodes}"
  all_count          = "${local.rhn_all_count}"
}
```

## Module Inputs Variables

|Variable Name|Description|Default Value|Type|
|-------------|-----------|-------------|----|
|bastion_ip_address|Public IP Address of Bastion VM|-|string|
|private_ssh_key|ssh key for all nodes|-|string|
|ssh_username|SSH user.  Must have passwordless sudo access|-|string|
|rhn_username|RedHat Username|-|string|
|rhn_password|RedHat Password|-|string|
|rhn_poolid|OpenShift Subscription Pool ID|-|string|
|all_nodes|IP Address list of all nodes to register|-|list|
|all_count|Total number of nodes to register|-|number|


## Module Output
This module produces no output

----
