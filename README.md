# terraform-github-lab

Lab repository for deploying Azure infrastructure with **Terraform** through **GitHub Actions**.

## Structure

| Path | Contents |
|---|---|
| `terraform.tf` | Terraform version, HCP Terraform state backend and required providers |
| `providers.tf` | AzureRM provider (OIDC authentication) |
| `variables.tf` | Input variables |
| `main.tf` | Resources |
| `outputs.tf` | Outputs |
| `sandbox.tfvars` | Values for the sandbox environment (non-secret) |
| `.github/workflows/` | GitHub Actions workflows |

## Workflow

1. Create a feature branch from `main`.
2. Change the Terraform files and push the branch.
3. Open a pull request: the workflow runs `fmt`, `validate` and `plan` and shows the plan in the job summary.
4. After merging into `main`, a new plan is created and saved.
5. After approval of the `production` environment, exactly that saved plan is applied.

## State

Terraform state is stored in **HCP Terraform** (workspace `terraform-github-lab`, execution mode **Local**). Terraform runs in GitHub Actions; HCP Terraform only stores and locks the state.

## Authentication

- **Azure**: OpenID Connect (OIDC) with an App Registration and federated credentials. No passwords or client secrets are stored.
- **HCP Terraform**: team API token stored as a GitHub secret.

## Cost

Free resources only (resource group).
