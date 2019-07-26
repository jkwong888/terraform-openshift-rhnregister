variable "bastion_ip_address" {
  default = ""
}

variable "bastion_ssh_private_key" {
  default = ""
}

variable "bastion_ssh_user" {
  default = ""
}

variable "node_ip_address" {
  type = "list"
  default = []
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

variable "ansible_version" {
  default = "2.6"
}

variable "openshift_version" {
  default = "3.11"
}