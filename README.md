## terraform-openshift-rhnregister

This is meant to be used as a module, make sure your module implementation sets all the variables in its terraform.tfvars file

In the example, we register 3 nodes to the public red hat network subscription.  This is useful in cases where we are preparing nodes to install Openshift over the Internet.

```terraform
module "rhnregister" {
  source             = "github.com/ibm-cloud-architecture/terraform-openshift-rhnregister.git?ref=v1.1"

  bastion_ip_address      = "<bastion_public_ip>"
  bastion_ssh_user        = "<bastion_ssh_user>"
  bastion_ssh_private_key = "<bastion_ssh_private_key>"

  ssh_user           = "<ssh_user>"
  ssh_private_key    = "<ssh_private_key>"

  rhn_username       = "<RHN username>"
  rhn_password       = "<RHN password>"
  rhn_poolid         = "<RHN pool id>"

  all_nodes          = ["<ip1>", "<ip2>", "<ip3>"]
  all_count          = 3
}
```

## Module Inputs Variables

|Variable Name|Description|Default Value|Type|
|-------------|-----------|-------------|----|
|bastion_ip_address|Public IP Address of Bastion VM|-|string|
|bastion_ssh_user|Bastion SSH user|-|string|
|bastion_ssh_password|Bastion SSH password|-|string|
|bastion_private_ssh_key|Bastion ssh key|-|string|
|ssh_user|SSH user.  Must have passwordless sudo access|-|string|
|ssh_password|SSH password|-|string|
|ssh_private_key|SSH private key|-|string|
|rhn_username|RedHat Username|-|string|
|rhn_password|RedHat Password|-|string|
|rhn_poolid|OpenShift Subscription Pool ID|-|string|
|all_nodes|IP Address list of all nodes to register|-|list|
|all_count|Total number of nodes to register|-|number|


## Module Output
This module produces a list of randomly generated IDs representing a completed registration of a node.  You can use this in dependencies; for example before executing the openshift installation, you can pass this list of resource IDs to make sure that all nodes are registered.

----
