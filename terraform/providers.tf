# Provider Azure — authentification via Azure CLI (az login)
# Pas de Service Principal requis : Terraform récupère automatiquement
# les credentials de l'utilisateur logué avec `az login`.


provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.100"
    }
  }

  backend "azurerm" {
    resource_group_name  = "RG-GAN-FRC"
    storage_account_name = "frcenstotfgan"
    container_name       = "tfstate"
    key                  = "iac-k8s/terraform.tfstate"
    use_azuread_auth     = true
  }
}

