data "aws_availability_zones" "azs" {
  state = "available"
}

# Fetch AWS access credentials for the defined role from Vault
data "vault_aws_access_credentials" "creds" {
  backend = "aws-master-account"
  role    = "admin-role"
}