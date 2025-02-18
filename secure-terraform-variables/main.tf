variable "conteudo_string" {
  type        = string  
  description = "Conteúdo dentro do arquivo"
}

variable "lista_nomes" {
  type        = list(string)
  description = "Lista de nomes."
}

resource "local_file" "arquivo_list" {
  content  = "Os nomes definidos foram ${join(", ", var.lista_nomes)}"
  filename = "arquivo-list.txt"
}

resource "local_file" "arquivo_string" {
  content  = var.conteudo_string
  filename = "arquivo-string.txt"
}