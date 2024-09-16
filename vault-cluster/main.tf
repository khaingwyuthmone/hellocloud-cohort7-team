resource "hcp_hvn" "example" {
  hvn_id         = "cohort7-hvn"
  cloud_provider = "aws"
  region         = "ap-southeast-1"
  cidr_block     = "172.25.16.0/20"
}

resource "hcp_vault_cluster" "example" {
  cluster_id = "cohort7-vault-cluster"
  hvn_id     = hcp_hvn.example.hvn_id
  tier       = "starter_small"
  public_endpoint = true
}