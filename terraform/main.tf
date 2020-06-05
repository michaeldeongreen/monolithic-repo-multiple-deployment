provider "azurerm" {
    version = "=1.36.0"
}

module "resourcegroup" {
    source      = "./modules/resource_group"

    name        = "rg-mgreen-multideploy-dev"
    region      = "eastus"
    environment = "development"
}

module "webapi1" {
  source               = "./modules/webapi1"
  create_resource      = true
  webapi1_appname      = "as-mgreen-multideploy-webapi1-dev"
  resource_group_name  = module.resourcegroup.name
  resource_group_id    = module.resourcegroup.id
}