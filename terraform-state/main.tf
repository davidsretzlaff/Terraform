resource "local_file" "file" {
  content = random_pet.pets[count.index].id 
  filename = "${count.index}-file.txt"
  count = var.quantity
}

resource "random_pet" "pets" {
    count = var.quantity
}

variable "quantity" {
    default = 4
}