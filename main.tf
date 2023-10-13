terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
    #token = "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"
}

resource "github_repository" "LaboratoryInfra" {
  name        = "RepoLaboratoryInfra"
  description = "Laboratory IaC nlamprea"   

  visibility = "public"

}



resource "github_repository_file" "foo" {
  repository          = github_repository.LaboratoryInfra.name
  file                = ".gitignore"
  content             = "**/*.tfstate"
  commit_message      = "Managed by Terraform"
  commit_author       = "nlamprea"
  commit_email        = "nlamprea@unal.edu.co"
  overwrite_on_create = true
}


resource "github_branch" "prod" {
  repository = "RepoLaboratoryInfra"
  branch     = "prod"
}

resource "github_branch" "Dev" {
  repository = "RepoLaboratoryInfra"
  branch     = "Dev"
}

resource "github_branch" "NonProd" {
  repository = "RepoLaboratoryInfra"
  branch     = "NonProd"
}