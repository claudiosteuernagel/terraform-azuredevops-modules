variable "org_service_url" {
  description = "Azure DevOps Oragnization URL."
  type        = string
}

variable "personal_access_token" {
  description = "Azure DevOps PAT."
  type        = string
  sensitive   = true
}

variable "azr_devops_projects" {
  type = map(object({
    name                 = string
    description          = string
    visibility           = optional(string)
    boards_enabled       = bool
    repositories_enabled = bool
    pipelines_enabled    = bool
    testplans_enabled    = optional(bool)
    artifacts_enabled    = optional(bool)
    work_item_template   = optional(string)
    repos                = optional(list(string))
  }))
  description = "Azure DevOps Projects"
}