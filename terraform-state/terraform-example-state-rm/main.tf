resource "local_file" "file" {
  content  = random_pet.pets[count.index].id
  filename = "${count.index}-file.txt"
  count    = var.quantity
}

resource "random_pet" "pets" {
  count = var.quantity
}

variable "quantity" {
  default = 6
}

// terraform state rm local_file.file
// terraform state rm random_pet.pets
// if you made a mistake and want to cancel, use the command: force the file recreate 
// terraform state rm 'local_file.file[1]'
// terraform state list | grep local_file