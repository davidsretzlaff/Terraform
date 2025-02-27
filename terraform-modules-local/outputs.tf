output "name_pet01" {
  value = module.pets_count[*].name_01.id
}

output "name_pet02" {
  value = module.pets_count[*].name_02.id
}


output "name_foreach_pet01" {
  value = {
    for key, pet in module.pets_foreach :
    key => { for name, details in pet : name => details.id }
  }
}
output "name_foreach_pet02" {
  value = {
    for key, pet in module.pets_foreach :
    key => { for name, details in pet : name => details.id }
  }
}