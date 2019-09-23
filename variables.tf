variable "bastion_ip_address" {
  default = ""
}

variable "bastion_ssh_user" {
  default = ""
}

variable "bastion_ssh_password" {
  default = ""
}

variable "bastion_ssh_private_key" {
  default = ""
}

variable "ssh_private_key" {
}

variable "ssh_user" {
  default = "root"
}

variable "ssh_password" {
  default = ""
}

variable "rhn_username"{
}

variable "rhn_password"{
}

variable "rhn_poolid"{
}

variable "rhn_server_hostname" {
  default = "subscription.rhsm.redhat.com"
}

variable "rhn_server_prefix" {
  default = "/subscription"
}

variable "rhn_server_port" {
  default = "443"
}

variable "rhn_rhsm_baseurl" {
  default = "https://cdn.redhat.com"
}

variable "rhn_rhsm_repo_ca_cert" {
  default = "/etc/rhsm/ca/redhat-uep.pem"
}


variable "all_nodes" {
  type = "list"
  default = []
}

variable "all_count" {
  default = 0
}

variable "dependson" {
    type = "list"
    default = []
}

