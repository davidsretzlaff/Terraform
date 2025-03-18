
// should use before of the module declaration
moved {
  from = local_file.file
  to   = module.file_pet.local_file.file
}

moved {
  from = random_pet.pets
  to   = module.file_pet.random_pet.pets
}

module "file_pet" {
  source = "./modules/file-pet"
}
