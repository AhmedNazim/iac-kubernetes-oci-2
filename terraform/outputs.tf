output "node_public_ips" {
  description = "IPs publiques de tous les nœuds (map: nom → IP)"
  value = {
    for name, ip in azurerm_public_ip.nodes : name => ip.ip_address
  }
}

output "node_private_ips" {
  description = "IPs privées de tous les nœuds (map: nom → IP)"
  value = {
    for name, nic in azurerm_network_interface.nodes : name => nic.private_ip_address
  }
}

output "control_plane_ip" {
  description = "IP publique du control plane Kubernetes"
  value       = azurerm_public_ip.nodes["control-plane"].ip_address
}

output "worker_ips" {
  description = "IPs publiques des workers Kubernetes"
  value = [
    for name, ip in azurerm_public_ip.nodes : ip.ip_address
    if name != "control-plane"
  ]
}

output "ssh_commands" {
  description = "Commandes SSH prêtes à copier-coller"
  value = {
    for name, ip in azurerm_public_ip.nodes : name =>
    "ssh -i ~/.ssh/oci_k8s ${var.admin_username}@${ip.ip_address}"
  }
}