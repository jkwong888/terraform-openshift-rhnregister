output "registered_resource" {
  value = "${join(",", null_resource.rhnregister.*.id)}"
}