
output "droplet_ip" {
  value = digitalocean_droplet.vm_aula[*].ipv4_address
  # digitalocean_droplet aqui eu estou especificando qual é atributo que eu quero que ele retorne
  #.vm_aula de qual nome  pq eu posso ter varios recursos do mesmo atributo
  #.ipv4_address o atrributo que eu quero que ele retorne pra mim, isso eu vi na documentacao la do digitalocean
}