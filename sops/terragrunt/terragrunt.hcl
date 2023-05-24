terraform {
  source = "../"
}

locals {
  db_creds = yamldecode(sops_decrypt_file(("../secrets-encrypt.yaml")))
}

inputs = {
  username = local.db_creds.username
  password = local.db_creds.password
}