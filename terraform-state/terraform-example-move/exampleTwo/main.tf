resource "local_file" "file" {
  content = random_pet.pets.id 
  filename = "file.txt"
  //count = var.quantity
}

resource "random_pet" "pets" {
 //count = var.quantity
}

# variable "quantity" {
#   default = 4
# }

// terraform state mv "random_pet.pets" "random_pet.pets[0]"
// terraform apply