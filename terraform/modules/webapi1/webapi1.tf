variable "webapi1_appname" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "create_resource" {
  type = bool
}

variable "resource_group_id" {}

data "http" "deployjson" {
  url = "https://raw.githubusercontent.com/michaeldeongreen/monolithic-repo-multiple-deployment/master/azuredeploy.json"
}

resource "azurerm_template_deployment" "webapi1_deploy" {
  count               = var.create_resource ? 1 : 0
  name                = "${var.webapi1_appname}-deployment"
  resource_group_name = var.resource_group_name
  deployment_mode     = "Incremental"
  template_body       = data.http.deployjson.body

  parameters = {
    siteName        = var.webapi1_appname
    hostingPlanName = "asp-mgreen-multideploy-webapi1-dev"
    sku             = "B1"
    project         = "webapi1/webapi1.csproj"
  }

  depends_on          = [var.resource_group_id]
}
