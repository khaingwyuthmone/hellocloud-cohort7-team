variable "workspace_name" {
  description = "Workspace Name"
  type = string
  default = "aws-vpc-day3"
}
variable "org_name" {
  description = "Organization Name"
  type = string
  default = "hellocloud-cohort7-team"
}
variable "vault_url" {
  description = "The address of the Vault instance runs will access."
  type = string
  default = "https://cohort7-vault-cluster-public-vault-dade1026.a8ab6f61.z1.hashicorp.cloud:8200" ### have to change new vault cluster id
}
variable "run_role" {
  description = "TFC_VAULT_RUN_ROLE"
  type = string
  default = "admin-role"
}
variable "vault_namespace" {
  description = "TFC_VAULT_NAMESPACE"
  type = string
  default = "admin"
}