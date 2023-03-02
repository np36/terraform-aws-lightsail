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

### Specific availability zone

If you wanna locate Lightsail instance at a specific availability zone:

```terraform
module "any_name_you_like" {
  ...
  # configure optional variables here:
  availability_zone = "us-east-1a"
  ...
}
```

Here is a snippet helps you find out AZs for Lightsail of a given region code:

```bash
# give a region code
region="ap-northeast-1"

aws lightsail get-regions \
--region $region \
--include-availability-zones \
--query "regions[?name=='$region'].{regionName: displayName, regionCode: name, ZAs:availabilityZones[?state=='available'].zoneName }"
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

If you wanna create a brand new key in Lightsail Console:

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

  # e.g. let 80, 443 open to the whole world, let 22 open to Admin's IP:
  fire_wall_rules = [
    {
      port : 80,
      rules : [
        {
          description : "Open to the whold world",
          cidr : "0.0.0.0/0"
        },
      ]
    },
    {
      port : 443,
      rules : [
        {
          description : "Open to the whold world",
          cidr : "0.0.0.0/0"
        },
      ]
    },
    {
      port : 22,
      rules : [
        {
          description : "admin",
          cidr : "77.56.23.0/24"
        },
      ]
    },
  ]

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
