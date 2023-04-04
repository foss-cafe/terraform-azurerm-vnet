module "vnet" {
  source              = "../../"
  resource_group_name = "terraform-test"
  location            = "East US"

  create_vnet   = true
  name          = "terraform-test"
  address_space = ["10.0.0.0/16"]

  tags = {
    environment = "test"
  }
}
