output "region" {
  value = module.eks_service.region
}

output "cluster_name" {
  value = module.eks_service.cluster_name
}

output "kubectl_update_kubeconfig_command" {
  value = module.eks_service.kubectl_update_kubeconfig_command
}

output "service_url" {
  value = coalesce(
    module.eks_service.service_load_balancer_hostname,
    module.eks_service.service_load_balancer_ip
  )
}
