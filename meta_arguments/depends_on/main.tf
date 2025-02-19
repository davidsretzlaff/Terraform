
resource "local_file" "file" {
  content    = "This is file 1 content}"
  filename   = "./arquivo1.txt"
  depends_on = [local_file.other_file]
}


resource "local_file" "other_file" {
  content  = "This is file 2 content}"
  filename = "./arquivo2.txt"

}
