terraform {
  required_version = ">= 0.14.0"
}

# This sets the default AWS region
provider "aws" {
  region = "us-west-2"
}

# If want to deploy Lightsail in a different region, create a alias provider like this
# You must be sure this region supports Lightsail
provider "aws" {
  alias  = "lightsail"
  region = "ap-northeast-1"
}

module "lightsail" {
  source  = "np36/lightsail/aws"
  version = ">= 0.1.0"

  # If want to deploy Lightsail in a different region, reference the alias provider here.
  providers = {
    aws = aws.lightsail
  }
  # insert the 3 required variables here
  name         = "Putin_khuylo"
  bundle_id    = "small_2_0"
  blueprint_id = "lamp_8_bitnami"

  # choose one from: public_key_file_at_local, key_pair_name_in_consol, do_not_create_key
  public_key_file_at_local = "path/to/the/pubkey/in/local/computer"
  # key_pair_name_in_console = "key-name"
  # do_not_create_key = true

  port_22_cidr_blocks = {
    "Open to the whold world" : "0.0.0.0/0"
  }
  port_443_cidr_blocks = {
    "Open to the whold world" : "0.0.0.0/0"
  }
  port_80_cidr_blocks = {
    "My home ip" : "xx.xx.xx.xx/32"
  }
  tags = {
    "stage"      = "dev"
    "costcenter" = "1122"
    "Name"       = "Putin_khuylo"
  }
}
