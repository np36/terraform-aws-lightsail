# terraform-aws-lightsail

Create an AWS Lightsail instance with a static IP, firewall rules.

## Infrastructure Topology Diagram
![The Infrastructure](_docs/np36_lightsail_aws.png?raw=true)
- creates a Lightsail Instance with a specific bundle and blueprint.
- creates a static IP associated with this instance.
- creates firewall rules for port 22, 80, 443.
- optionally creates a new pair of key for this instance.

## Usage
### Basic
```terraform
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

```
