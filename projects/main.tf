terraform {
  experiments = [module_variable_optional_attrs]
}

locals {
  projetos = { for k, v in var.projects : k => {
    proj_name        = v.name
    proj_description = coalesce(v.description, v.name)
    proj_visibility  = coalesce(v.visibility, "private")
    proj_features = {
      "boards"       = coalesce(v.boards_enabled, true) ? "enabled" : "disabled"
      "repositories" = coalesce(v.repositories_enabled, true) ? "enabled" : "disabled"
      "pipelines"    = coalesce(v.pipelines_enabled, true) ? "enabled" : "disabled"
      "testplans"    = coalesce(v.testplans_enabled, false) ? "enabled" : "disabled"
      "artifacts"    = coalesce(v.artifacts_enabled, false) ? "enabled" : "disabled"
    }
    proj_wi_template = coalesce(v.work_item_template, "Agile")
    proj_repos       = coalesce(v.repos, [])
    }
  }
}

module "projeto" {
  source           = "../modules/project"
  for_each         = local.projetos
  proj_name        = each.value.proj_name
  proj_description = each.value.proj_description
  proj_visibility  = each.value.proj_visibility
  proj_features    = each.value.proj_features
  proj_repos       = each.value.proj_repos
}