output "registered_resource" {
  value = "${join(",", null_resource.rhn_register.*.id)}"
}