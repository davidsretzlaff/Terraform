
//terraform init to load the new module
// terraform state mv local_file.file module.file_pet.local_file.file
// terraform state mv random_pet.pets module.file_pet.random_pet.pets


module "file_pet" {
  source = "./module/file-pet"
}


# moved {
#   from = local_file.file
#   to   = module.file_pet.local_file.file
# }