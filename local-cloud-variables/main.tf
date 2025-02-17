resource "local_file" "foo_list_string" {
  content  = "The value i will use in my machine is ${var.content_list_string[0]}"
  filename = "./arquivo.txt"
}


resource "local_file" "foo_list_number" {
  content  = "The value i will use in my machine is Machine ${var.content_list_number[0]}"
  filename = "./arquivo.txt"
}

resource "local_file" "foo_map" {
  content  = "The value i will use in my machine is Machine ${var.content_map["small"]}"
  filename = "./arquivo.txt"
}

variable "content_string" {
  default     = "file content"
  type        = string
  description = "string variable"
}

variable "content_number" {
  default     = 12
  type        = number
  description = "number variable"
}

variable "content_boolean" {
  default     = true
  type        = bool
  description = "boolean variable"
}


variable "content_list_string" {
  default     = ["Machine01", "Machine02", "Machine03"]
  type        = list(string)
  description = "boolean variable"
}



variable "content_list_number" {
  default     = [1, 2, 3]
  type        = list(number)
  description = "boolean variable"
}


variable "content_map" {
  default     = {
    "small" = "s-1vcpu-2gb"
    "mid" = "s-4vcpu-4gb"
    "large" = "s-8vcpu-8gb"
  }
  type        = map(string)
  description = "boolean variable"
}