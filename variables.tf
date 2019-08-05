variable "bastion_ip_address" {}
variable "app_ip_address"     { type = "list" }
variable "infra_ip_address"   { type = "list" }
variable "master_ip_address"  { type = "list" }
variable "storage_ip_address" { type = "list" }
variable "haproxy_ip_address" {
    type = "list"
    default = []
}


variable "rhn_username" {}
variable "rhn_password" {}
variable "rhn_poolid" {}

variable "ssh_username" {
    default = "root"
}

variable "bastion" {type = "map"}
variable "master"  {type = "map"}
variable "infra"   {type = "map"}
variable "worker"  {type = "map"}
variable "storage" {type = "map"}
variable "haproxy" {type = "map"}
variable "private_ssh_key" {}
