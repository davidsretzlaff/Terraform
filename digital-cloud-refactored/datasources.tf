
data "digitalocean_ssh_key" "ssh_key" { // segunda label e referente ao nome dessa data
  name = var.ssh_key_name               // nome da minha ssh
}
