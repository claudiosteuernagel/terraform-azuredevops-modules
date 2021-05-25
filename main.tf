terraform {
  required_version = ">= 0.15.0"
  experiments      = [module_variable_optional_attrs]
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "~> 0.1.4"
    }
    # template = {
    #   source  = "hashicorp/template"
    #   version = "~> 2.1.2"
    # }
  }

}


provider "azuredevops" {
  org_service_url       = var.org_service_url
  personal_access_token = var.personal_access_token
}

module "project" {
  source   = "./projects"
  projects = var.azr_devops_projects
}