resource "local_file" "file" {
  content  = var.content
  filename = "${terraform.workspace}-file"
}

variable "content" {
  type        = string
  description = "file content"
}

variable "file_name" {
  type        = string
  description = "file name"
}