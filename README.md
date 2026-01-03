# GitHub Terraform Azure Starter Project
A template for managing GitHub Repository settings with Terraform, using a GitHub Actions Workflow to automatically authenticate with GitHub using OIDC.

The `main` branch of the `/github-settings` folder is the source of truth for the GitHub Repository Settings, and any time there are changes to the GitHub Repository Settings terraform files, the Apply GitHub Repository Settings workflow will be triggered.

**Rulesets must be DELETED MANUALLY in GitHub before changes will take effect.** Otherwise, the next terraform apply will fail, because it tries to recreate the rulesets again.

**This project is intended to be a one-time repo setup at the moment**, because the tfstate is NOT being tracked. If you create a terraform backend to store the tfstate, only then can you can run it multiple times without deleting the Rulesets.

# Acceptance Criteria

## GitHub

# Steps to use this in your project
1. Open your GitHub [Developer Settings](https://github.com/settings/personal-access-tokens)
2. Create a fine-grained PAT in GitHub
   1. `Name` - Something related to the repo name
   2. `Expiration` - Usually 90 days
   3. `Only Select Repositories` - You should only select the repo you want to set the rules for
   4. `Permissions`:
      1. Administration - Read & Write (this is what allows Terraform to update the Repo settings)
      2. Contents - Read (Terraform needs to see repo data)
3. In GitHub, go to your repository Settings, then under Security, select `Secrets and variables -> Actions`.
   1. Under `Repository secrets`, add the PAT as a secret called `GH_PAT`
4. Copy `/.github/` folder into your repository. This should include these files:
   1. `workflows/apply-github-settings.yml` - A GitHub Actions workflow that automatically updates the Repository Settings on changes
   2. `CODEOWNERS` - Set up code owners for your `/github-settings/` and `/.github/` folders to prevent unauthorized changes to the repository settings
5. Copy `/github-settings/` folder into your repository. This should include these files:
   1. `main.tf` - Repository settings and rulesets defined using Terraform
   2. `providers.tf` - Tells Terraform to use the GitHub provider
   3. `terraform.tfvars` - Not used unless you need to override the Workflow values
   4. `variables.tf` - Defines the tf vars
6. Push to the `main` branch. The `Apply GitHub Repository Settings` GitHub Actions Workflow should automatically run and 
