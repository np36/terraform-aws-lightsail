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
  region = "ca-central-1"
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


  # configure optional variables here:

  # If you wanna use a preferred availability zone:
  # availability_zone = ""

  # If you have created a key in Lightsail Console, and want to connect the instance with it:
  # key_pair_name_in_console = "key-name"

  # If you wanna create a brand new key in Lightsail Console:
  # create_key = true

  # If you already have a pair of key at local, say they are `~/.ssh/id_rsa` and `~/.ssh/id_rsa.pub`, and you wanna use `~/.ssh/id_rsa` to connect to the Lightsail instance you would create, you should give the absolute path of id_rsa.pub:
  # create_key               = true
  # public_key_file_at_local = "~/.ssh/id_rsa.pub"

  fire_wall_rules = [
    {
      port : 80,
      rules : [
        {
          description : "admin-xmt35",
          cidr : "35.79.23.128/32"
        },
        {
          description : "self",
          cidr : "3.97.26.156/32"
        }

      ]
    },
    {
      port : 443,
      rules : [
        {
          description : "admin-xmt35",
          cidr : "35.79.23.128/32"
        },
        {
          description : "self",
          cidr : "3.97.26.156/32"
        }

      ]
    },
    {
      port : 22,
      rules : [
        {
          description : "admin-xmt35",
          cidr : "35.79.23.128/32"
        },
        {
          description : "self",
          cidr : "3.97.26.156/32"
        }

      ]
    },
    {
      port : 8080,
      rules : [
        {
          description : "admin-xmt35",
          cidr : "35.79.23.128/32"
        },
        {
          description : "self",
          cidr : "3.97.26.156/32"
        }
      ]
    },
  ]
}
