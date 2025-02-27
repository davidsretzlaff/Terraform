
module "pets_count" {
    source = "./modules/pets"
    prefix_file = "pets_count-${count.index}"
    count = 4
}

module "pets_foreach" {
    source = "./modules/pets"
    prefix_file = "pets_foreach-${each.key}"
    for_each = toset(["pre01","pre02","pre03","pre04"])
}

