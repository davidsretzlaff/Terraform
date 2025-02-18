
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

resource "local_file" "foo_list_string" {
  content  = "The value i will use in my machine is ${var.content_list_string[0]}"
  filename = "./arquivo.txt"
}

variable "content_list_string" {
  default     = ["Machine01", "Machine02", "Machine03"]
  type        = list(string)
  description = "list string variable"
}


resource "local_file" "foo_list_number" {
  content  = "The value i will use in my machine is Machine ${var.content_list_number[0]}"
  filename = "./arquivo.txt"
}

variable "content_list_number" {
  default     = [1, 2, 3]
  type        = list(number)
  description = "list number variable"
}


resource "local_file" "foo_map" {
  content  = "The value i will use in my machine is Machine ${var.content_map["small"]}"
  filename = "./arquivo.txt"
}

variable "content_map" {
  default = {
    "small" = "s-1vcpu-2gb"
    "mid"   = "s-4vcpu-4gb"
    "large" = "s-8vcpu-8gb"
  }
  type        = map(string)
  description = "map variable"
}



resource "local_file" "foo_set" {
  content  = "The value i will use in my machine is ${join(", ", var.content_set)}"
  filename = "./arquivo.txt"
}

variable "content_set" {
  default     = ["s-1vcpu-2gb", "s-4vcpu-4gb", "s-8vcpu-8gb"]
  type        = set(string)
  description = "set variable"
}

resource "local_file" "foo_object" {
  content  = "The value i will use in my machine is ${var.content_object.option_machine}"
  filename = "./arquivo.txt"
}

variable "content_object" {
  default = {
    region           = "sp",
    option_machine   = "machine2",
    should_do_backup = true
  }
  type = object({ 
      region = string,
      option_machine = string,
      should_do_backup = bool
    })
  description = "object variable"
}

resource "local_file" "foo_tuple" {
  content  = "The value i will use in my machine is ${var.content_tuple[0]}"
  filename = "./arquivo.txt"
}

variable "content_tuple" {
  default = ["sp", "machine2", true]
  type = tuple([string, string, bool])
  description = "tuple variable"
}