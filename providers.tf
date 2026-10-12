# ============================================================
# PROVIDER - AZURE (OIDC, NO SECRETS)
# ============================================================
provider "azurerm" {
  features {}

  # Client ID, tenant ID and subscription ID come from ARM_* environment variables
  use_oidc = true
}