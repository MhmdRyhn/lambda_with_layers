provider "aws" {
  region = var.region_name
  access_key = var.access_key
  secret_key = var.secret_key
//  skip_credentials_validation = true
//  skip_metadata_api_check     = true
//  skip_requesting_account_id  = true
}