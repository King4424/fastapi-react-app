# Output the EKS cluster name
output "cluster_name" {
  description = "Name of the EKS cluster"
  value       = module.eks.cluster_name
}

# Output the cluster endpoint
output "cluster_endpoint" {
  description = "Endpoint for the EKS control plane"
  value       = module.eks.cluster_endpoint
}

# Output the cluster CA certificate
output "cluster_certificate_authority_data" {
  description = "Base64 encoded certificate data required to communicate with the cluster"
  value       = module.eks.cluster_certificate_authority_data
  sensitive   = true
}

# Output the EKS node group IAM role name (updated attribute)
output "node_group_role_name" {
  description = "IAM role name for the EKS node group"
  value       = module.eks.eks_managed_node_groups["default"].iam_role_name
}

# Optional: VPC ID and Subnets (for reference)
output "vpc_id" {
  description = "VPC ID where the EKS cluster is deployed"
  value       = module.vpc.vpc_id
}

output "private_subnets" {
  description = "Private subnet IDs used for EKS nodes"
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "Public subnet IDs (for NAT / LB)"
  value       = module.vpc.public_subnets
}
