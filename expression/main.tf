resource "local_file" "expression_aritimetica" {
  content = 50 + 10 + var.value
  filename = "expression_aritimetica.txt"
}


resource "local_file" "expression_logica" {
  content = var.value == 10
  filename = "expression_logica.txt"
}

variable "value" {
  default = 40
}