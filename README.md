# GitHub Terraform Azure Starter Project
A template for managing GitHub Repository settings with Terraform, using a GitHub Actions Workflow to automatically authenticate with GitHub using OIDC.

The `main` branch of the `/github-settings` folder is the source of truth for the GitHub Repository Settings, and any time there are changes to the GitHub Repository Settings terraform files, the Apply GitHub Repository Settings workflow will be triggered.

# Acceptance Criteria

## GitHub

# Steps to use this in your project


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

