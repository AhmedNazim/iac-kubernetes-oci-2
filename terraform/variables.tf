# Variables d'entrée — valeurs fournies via terraform.tfvars
# Authentification : via `az login` (pas de Service Principal)

# -------- Authentification Azure --------

variable "subscription_id" {
  description = "ID de la souscription Azure (az account show --query id -o tsv)"
  type        = string
}

# -------- Configuration générale --------

variable "location" {
  description = "Région Azure où déployer"
  type        = string
  default     = "westeurope" # Amsterdam — correspond au suffixe EUW
}

variable "resource_group_name" {
  description = "Nom du Resource Group partagé"
  type        = string
  default     = "RG-GAN-EUW"
}

variable "project_name" {
  description = "Préfixe utilisé pour nommer les ressources"
  type        = string
  default     = "iac-k8s"
}

variable "ssh_public_key_path" {
  description = "Chemin vers la clé SSH publique injectée dans les VMs"
  type        = string
  default     = "~/.ssh/oci_k8s.pub"
}

# -------- Réseau --------

variable "vnet_cidr" {
  description = "Plage CIDR du Virtual Network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "Plage CIDR du subnet"
  type        = string
  default     = "10.0.1.0/24"
}

# -------- Instances --------

variable "control_plane_vm_size" {
  description = "Taille de la VM control-plane (B2s = 2 vCPU / 4 GB, requis par kubeadm)"
  type        = string
  default     = "Standard_B2s"
}

variable "worker_vm_size" {
  description = "Taille des VMs workers (B1ms = 1 vCPU / 2 GB)"
  type        = string
  default     = "Standard_B1ms"
}

variable "admin_username" {
  description = "Nom de l'utilisateur admin sur les VMs Linux"
  type        = string
  default     = "ubuntu"
}

variable "worker_count" {
  description = "Nombre de workers Kubernetes (TP = 2)"
  type        = number
  default     = 2
}

variable "use_spot" {
  description = "Utiliser des VMs Spot (jusqu'à -90% mais évincibles à tout moment)"
  type        = bool
  default     = false
}