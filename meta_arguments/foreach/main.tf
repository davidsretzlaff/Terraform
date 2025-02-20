
resource "local_file" "file" {
  content    = "This is file ${each.key} content}"
  filename   = "./arquivo-${each.key}.txt"
  for_each = var.countador 
}


variable "countador" {
  default = ["Machine 01", "Machine 02", "Machine 03"]
  type = set(string)
}