resource "local_file" "arithmetic_expression" {
  content = 50 + 10 + var.value
  filename = "arithmetic_expression.txt"
}

resource "local_file" "logical_expression" {
  content = var.value == 10
  filename = "logical_expression.txt"
}


resource "local_file" "condition_expression" {
  content = var.value > 10 ? "greater" : "smaller"
  filename = "condition_expression.txt"
}

resource "local_file" "join_for" {
  content = join(", ", [for v in var.join_for_value: upper(v)])
  filename = "join_for.txt"
}

variable "join_for_value" {
  default = ["Docker","Jenkins","Terraform",]
}

variable "value" {
  default = 40
}


resource "local_file" "validation_expression" {
  content = join(", ", [for v in var.validation_expression_value: upper(v)])
  filename = "validation_expression.txt"
}

variable "validation_expression_value" {
  default = ["kubernetes", "Jenkins", "Terraform"]
  validation {
    condition = contains(var.validation_expression_value, "kubernetes")
    error_message = "this list need to have kubernetes"
  }
}