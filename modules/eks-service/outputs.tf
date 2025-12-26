output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  value = module.eks.cluster_certificate_authority_data
}

output "region" {
  value = var.region
}

output "kubectl_update_kubeconfig_command" {
  value = "aws eks update-kubeconfig --region ${var.region} --name ${module.eks.cluster_name}"
}

output "service_namespace" {
  value = var.service_namespace
}

output "service_name" {
  value = var.service_name
}

output "service_load_balancer_hostname" {
  description = "Load Balancer hostname assigned by AWS"
  value       = try(kubernetes_service_v1.app.status[0].load_balancer[0].ingress[0].hostname, null)
}

output "service_load_balancer_ip" {
  description = "Load Balancer IP"
  value       = try(kubernetes_service_v1.app.status[0].load_balancer[0].ingress[0].ip, null)
}
