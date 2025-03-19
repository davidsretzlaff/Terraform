terraform {
  backend "pg" {
    conn_str = "postgres://user:pass@db.example.com/terraform_backend"
  }
}


resource "local_file" "local_file" {
  filename = "file.txt"
  content  = "content"
}

//terraform init -migrate-state