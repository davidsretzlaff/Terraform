
output "wp_lb_ip" {
  value = digitalocean_loadbalancer.wp_lb.ip
  description = "load balance IP"
}

output "wp_vm_ips" {
  value = digitalocean_droplet.vm_wp[*].ipv4_address
  description = "Wordpress machines ips"
}

output "nfs_vm_ips" {
  value = digitalocean_droplet.vm_nfs.ipv4_address
  description = "NFS machine ip"
}


output "wp_db_user" {
  value     = digitalocean_database_user.wp_database_user.name
  description = "Database user"
}

output "wp_db_pwd" {
  value     = digitalocean_database_user.wp_database_user.password
  description = "Database Password"
  sensitive = true
}