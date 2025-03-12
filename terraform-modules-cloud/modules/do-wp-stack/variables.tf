
variable "region" {
  type    = string
  default = "nyc1"
}

variable "wp_vm_count" {
  type = number
  default = 2
  description = "number of machines for wordpress"

  validation {
    condition = var.wp_vm_count > 1
    error_message = "the minimum number of machines required is two"
  }
}

variable "vms_ssh" {
  type = string
  description = "Key ssh to access the VMS"
}