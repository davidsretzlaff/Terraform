resource "local_file" "file" {
  content  = var.content
  filename = var.file_name
}

variable "content" {
  type        = string
  description = "file content"
}

variable "file_name" {
  type        = string
  description = "file name"
}