# create project
resource "azuredevops_project" "proj" {
  name               = var.proj_name
  description        = var.proj_description
  visibility         = var.proj_visibility
  version_control    = "Git"
  work_item_template = var.proj_wi_template
  features           = var.proj_features
}

resource "azuredevops_git_repository" "repo" {
  for_each = toset(var.proj_repos)
  project_id = azuredevops_project.proj.id
  name       = each.key
  initialization {
    init_type = "Clean"
  }
  default_branch = "refs/heads/master"
}