resource "local_file" "file" {
  content  = random_pet.pet01.id
  filename = "${var.prefix_file}-file.txt"
}
resource "local_file" "other_file" {
  content  = random_pet.pet02.id
  filename = "${var.prefix_file}-other_file.txt"
}



resource "random_pet" "pet01" {
}

resource "random_pet" "pet02" {
}
