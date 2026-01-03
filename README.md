# GitHub Terraform Azure Starter Project
A template for managing GitHub Repository settings with Terraform, using a GitHub Actions Workflow to automatically authenticate with GitHub using OIDC.

The `main` branch of the `/github-settings` folder is the source of truth for the GitHub Repository Settings, and any time there are changes to the GitHub Repository Settings terraform files, the Apply GitHub Repository Settings workflow will be triggered.

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
      3. Pull Requests - Read & Write (TODO: testing without this permission at first)

# Project Structure
```
cashburn-starter-tf-github-settings/
├── .github/
│   └── workflows/
│       ├── ci-cd.yml              # CI (validate, build, test) + CD (tf plan/apply)
|       └── deploy-template.yml    # Used by ci-cd.yml for deployment to each env. Modify this to add your deployment steps
|
├── .vscode/                       # Recommended VS Code settings/extensions
│
├── infra/
│   ├── main.tf                    # Add your terraform resources here
│   ├── providers.tf               # Azure + required providers
│   ├── backend.tf                 # Backend definition (no hardcoded values, all values in env/backend.*.config)
│   ├── variables.tf               # Input variables (env, location, app name)
│   ├── locals.tf                  # Combines the input vars together
│
├── .editorconfig
├── .gitignore
└── README.md                      # You are here!
```

# Cleanup

