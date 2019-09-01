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

variable "all_nodes" {
  type = "list"
  default = []
}

variable "all_count" {
  default = 0
}
