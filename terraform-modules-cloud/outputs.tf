
output "stack_wp_lb_ip" {
  value = module.wp_stack.wp_lb_ip
  description = "load balance IP"
}

output "stack_vm_ips" {
  value = module.wp_stack.wp_vm_ips

  description = "Wordpress machines ips"
}

output "stack_vm_nfs" {
  value = module.wp_stack.nfs_vm_ips
  description = "NFS machine ip"
}


output "stack_wp_db_user" {
  value = module.wp_stack.wp_db_user
  description = "Database user"
}

output "stack_wp_db_pwd" {
  value = module.wp_stack.wp_db_pwd
  description = "Database Password"
  sensitive = true
}