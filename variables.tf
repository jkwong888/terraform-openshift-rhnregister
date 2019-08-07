variable "bastion_ip_address" {}
variable "all_nodes" { type = "list" }
variable "all_count" {}
variable "rhn_username" {}
variable "rhn_password" {}
variable "rhn_poolid" {}

variable "ssh_username" {
    default = "root"
}
variable "private_ssh_key" {}
