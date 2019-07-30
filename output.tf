resource "random_id" "completed" {
    byte_length = 1
    depends_on = [
        "null_resource.setup_bastion",
        "null_resource.setup_master",
        "null_resource.setup_infra",
        "null_resource.setup_worker",
        "null_resource.setup_storage",
    ]
}

output "completed" {
    value = "${random_id.completed}"
}
