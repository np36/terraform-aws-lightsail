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
This example would create a Lightsail instance with a static IP.

Use the default key in the region, where this instance locates, to connect to this instance.

```terraform
module "any_name_you_like" {
  source  = "np36/lightsail/aws"
  version = ">= 0.1.0"
  
  # insert the 3 required variables here:
  name         = "Putin_khuylo"
  bundle_id    = "small_2_0"
  blueprint_id = "lamp_8_bitnami"
  
  # configure optional variables here:
}
```

### Use an existing key in Lightsail Console
If you have created a key in Lightsail Console, and want to connect the instance with it:

```terraform
module "any_name_you_like" {
  ...
  # configure optional variables here:
  key_pair_name_in_console = "key-name"
  ...
}
```

### Create a brand new key in Lightsail Console
If you create a brand new key in Lightsail Console:

```terraform
module "any_name_you_like" {
  ...
  # configure optional variables here:
  create_key = true
  ...
}
```

### Use a local public key
If you already have a pair of key at local, say they are `~/.ssh/id_rsa` and `~/.ssh/id_rsa.pub`, and you wanna use `~/.ssh/id_rsa` to connect to the Lightsail instance you would create, you should give the absolute path of `id_rsa.pub`:

```terraform
module "any_name_you_like" {
  ...
  # configure optional variables here:
  create_key = true
  public_key_file_at_local = "~/.ssh/id_rsa.pub"
  ...
}
```

### Firewall rules and tags
```terraform
module "any_name_you_like" {
  ...
  # configure optional variables here:
  
  port_22_cidr_blocks = {
    "Open to the whold world" : "0.0.0.0/0"
  }
  port_443_cidr_blocks = {
    "Open to the whold world" : "0.0.0.0/0"
  }
  port_80_cidr_blocks = {
    "Open to the whold world" : "0.0.0.0/0"
  }
  
  tags = {
    "stage"      = "dev"
    "costcenter" = "1122"
    "Name"       = "Putin_khuylo"
  }
  ...
}
```

**Hope you like it!**

# Putin khuylo!
