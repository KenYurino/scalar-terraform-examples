data "terraform_remote_state" "network" {
  backend = "local"

  config = {
    path = "../network/terraform.tfstate"
  }
}

data "terraform_remote_state" "cassandra" {
  count = local.database == "cassandra" ? 1 : 0

  backend = "local"

  config = {
    path = "../cassandra/terraform.tfstate"
  }
}

data "terraform_remote_state" "cosmosdb" {
  count = local.database == "cosmos" ? 1 : 0

  backend = "local"

  config = {
    path = "../cosmosdb/terraform.tfstate"
  }
}
