## terraform-openshift-rhnregister

This is meant to be used as a module, make sure your module implementation sets all the variables in its terraform.tfvars file

```terraform
module "rhnregister" {
    source                  = "git::ssh://git@github.ibm.com/ncolon/terraform-openshift-rhnregister.git"
    rhn_username            = "${var.rhn_username}"
    rhn_password            = "${var.rhn_password}"
    rhn_poolid              = "${var.rhn_poolid}"
    master_ip_address       = "${module.infrastructure.master_public_ip}"
    master_private_ssh_key  = "${var.private_ssh_key}"
    infra_ip_address        = "${module.infrastructure.infra_public_ip}"
    infra_private_ssh_key   = "${var.private_ssh_key}"
    app_ip_address          = "${module.infrastructure.app_public_ip}"
    app_private_ssh_key     = "${var.private_ssh_key}"
    storage_ip_address      = "${module.infrastructure.storage_public_ip}"
    storage_private_ssh_key = "${var.private_ssh_key}"
    bastion_ip_address      = "${module.infrastructure.bastion_public_ip}"
    bastion_private_ssh_key = "${var.private_ssh_key}"
}
```

## Module Inputs Variables

|Variable Name|Description|Default Value|Type|
|-------------|-----------|-------------|----|
|rhn_username|RedHat Username|-|string|
|rhn_password|RedHat Password|-|string|
|rhn_poolid|OpenShift Subscription Pool ID|-|string|
|master_ip_address|Public IPv4 Address of Master Nodes|-|list|
|master_private_ssh_key|ssh key for master servers|-|string|
|infra_ip_address|Public IPv4 Address of Infra Nodes|-|list|
|infra_private_ssh_key|ssh key for Infra servers|-|string|
|app_ip_address|Public IPv4 Address of Master Nodes|-|list|
|app_private_ssh_key|ssh key for master servers|-|string|
|storage_ip_address|Public IPv4 Address of Master Nodes|-|list|
|storage_private_ssh_key|ssh key for master servers|-|string|


## Module Output
This module produces no output

----
