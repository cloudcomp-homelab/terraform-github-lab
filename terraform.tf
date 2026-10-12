# ============================================================
# TERRAFORM SETTINGS - VERSION, BACKEND & PROVIDERS
# ============================================================
terraform {
  required_version = ">= 1.9.0"

  # State is stored in HCP Terraform (execution mode: Local)
  cloud {
    organization = "cloudcomp-homelab"

    workspaces {
      name = "terraform-github-lab"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}