terraform {
  required_version = ">= 0.14.0"

  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "~> 0.1.4"
    }
    template = {
      source  = "hashicorp/template"
      version = "~> 2.1.2"
    }
  }

}

provider "azuredevops" {
  org_service_url       = var.org_service_url
  personal_access_token = var.personal_access_token
}

module "project" {
  source = "./modules/project"

  proj_name        = "DemoLab"
  proj_description = "DemoLab Project for demonstration purposes."
  proj_visibility  = "private"
  proj_features = {
    "boards"       = "enabled"
    "repositories" = "enabled"
    "pipelines"    = "enabled"
    "testplans"    = "disabled"
    "artifacts"    = "disabled"
  }
  proj_repos = ["teste1", "teste2"]
}