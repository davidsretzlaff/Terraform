// Function to return the content with the maximum value from the list
resource "local_file" "max" {
  content = max(54,26,19,20)
  filename = "Max.txt"
}

// Function to return the content with the minimum value from the list
resource "local_file" "min" {
  content = min(54,26,19,20)
  filename = "Min.txt"
}

// Function to check if the string starts with a given prefix
resource "local_file" "startwith" {
  content = startswith("hello world", "hello")
  filename = "Startswith.txt"
}

// Function to check if the string ends with a given suffix
resource "local_file" "endswith" {
  content = endswith("hello world", "hello")
  filename = "Endswith.txt"
}

// Function to join strings with a separator
resource "local_file" "join" {
  content = join(", ", ["hello", "world"])
  filename = "Join.txt"
}

// Function to convert a string to uppercase
resource "local_file" "upper" {
  content = upper("Hello World")
  filename = "Upper.txt"
}

// Function to convert to uppercase and join strings
resource "local_file" "upperjoin" {
  content = upper(join(", ", ["hello", "world"]))
  filename = "UpperJoin.txt"
}

// Function to convert a string to lowercase
resource "local_file" "lower" {
  content = lower("Hello World")
  filename = "Lower.txt"
}

// Function to remove leading and trailing spaces from the string
resource "local_file" "trimspace" {
  content = trimspace("          Hello            ")
  filename = "Trimspace.txt"
}

// Function to read a file
resource "local_file" "file" {
  content = file("~/.ssh/aula-terraform.pub")
  filename = "File.txt"
}
