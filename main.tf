resource "random_id" "completed" {
    byte_length = 1
    depends_on = [
        "null_resource.setup_bastion",
        "null_resource.setup_master",
        "null_resource.setup_infra",
        "null_resource.setup_worker",
        "null_resource.setup_storage",
        "null_resource.dependency"
    ]
}

resource "null_resource" "dependency" {
  triggers = {
    all_dependencies = "${join(",", var.dependencies)}"
  }
}
