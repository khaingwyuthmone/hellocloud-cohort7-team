###Reading Output Data from workspace state 
data "terraform_remote_state" "vpc" {
  backend = "remote"
  config = {
    organization = "hellocloud_khaingwyuthmone"
    workspaces = {
      name = "aws-vpc-day3"
    }
  }
}

# Get Account ID
data "aws_vpc" "selected" {
  id = data.terraform_remote_state.vpc.outputs.vpc_id
}

data "aws_arn" "arn" {
  arn = data.aws_vpc.selected.arn
}

###For Private Subnet
data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.terraform_remote_state.vpc.outputs.vpc_id]
  }

  tags = {
    Name = "private*"
  }
}

data "aws_subnet" "private" {
  for_each = toset(data.aws_subnets.private.ids)
  id       = each.value
}

###For DB Subnet
data "aws_subnets" "db" {
  filter {
    name   = "vpc-id"
    values = [data.terraform_remote_state.vpc.outputs.vpc_id]
  }

  tags = {
    Name = "db*"
  }
}

data "aws_subnet" "db" {
  for_each = toset(data.aws_subnets.db.ids)
  id       = each.value
}


data "aws_route_table" "private_rt" {
  subnet_id = data.aws_subnets.private.ids[0]
}

data "aws_route_table" "db_rt" {
  subnet_id = data.aws_subnets.db.ids[0]
}

# Get HVN Info
data "hcp_hvn" "hvn" {
  hvn_id = var.hvn_id
}
