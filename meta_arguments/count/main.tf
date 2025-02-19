
resource "local_file" "file" {
  content    = "This is file ${count.index} content}"
  filename   = "./arquivo-${count.index}.txt"
  count = var.countador // it will create the resource 10 times 
}


variable "countador" {
  default = 10
}