resource "local_file" "file" {
  content = random_pet.pets.id 
  filename = "file.txt"  
}

resource "random_pet" "pets" {

}

// terraform state mv "random_pet.pets" "random_pet.pets[0]"
// terraform apply