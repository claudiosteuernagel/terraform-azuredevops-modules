variable "proj_name" {
  description = "Azure DevOps Project name."
  type        = string
}

variable "proj_description" {
  description = "Azure DevOps Project description."
  type        = string
}

variable "proj_visibility" {
  description = "Project visibility."
  type        = string
  default     = "private"
}

variable "proj_vcs" {
  description = "Project Version Control."
  type        = string
  default     = "Git"
}

variable "proj_wi_template" {
  description = "Project Work Item template."
  type        = string
  default     = "Agile"
}

variable "proj_features" {
  description = "Project features."
  type        = map(string)
  default = {
    "boards"       = "disabled"
    "repositories" = "enabled"
    "pipelines"    = "enabled"
    "testplans"    = "disabled"
    "artifacts"    = "disabled"
  }
}

variable "proj_repos" {
  description = "Project Repositories"
  type = list(string)
}