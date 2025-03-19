terraform {
  backend "kubernetes" {
    secret_suffix    = "state"
    config_path      = "~/.kube/config"
  }
}



resource "local_file" "local_file" {
  filename = "file.txt"
  content  = "content"
}

