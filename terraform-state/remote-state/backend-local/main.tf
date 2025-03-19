terraform {
  backend "local" {
    path = "relative/path/to/terraform.tfstate"
  }
}


resource "local_file" "local_file" {
  filename = "file.txt"
  content  = "content"
}

//terraform init -migrate-state