# terraform-aws-lightsail

Create an AWS Lightsail instance with a static IP, firewall rules.

## Infrastructure Topology Diagram

![The Infrastructure](https://github.com/np36/terraform-aws-lightsail/blob/025a9fbf40672f1c98ae06534221ba0a7d177efa/_docs/np36_lightsail_aws.png?raw=true)

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

# Useful snippets

### Show Lightsail regions

```bash
aws lightsail get-regions \
--query "regions[*].{regionName: displayName, regionCode: name }" \
--output text

# # Sample Output:
# us-east-1       Virginia
# us-east-2       Ohio
# us-west-2       Oregon
# ...
```

### Show Lightsail availability zones of a certain region

```bash
region="eu-west-3"  # give a region here

aws lightsail get-regions \
--region $region \
--include-availability-zones \
--query "regions[?name=='$region'].{regionName: displayName, regionCode: name, ZAs:availabilityZones[?state=='available'].zoneName }"

# # Sample Output:
# [
#     {
#         "regionName": "Paris",
#         "regionCode": "eu-west-3",
#         "ZAs": [
#             "eu-west-3a",
#             "eu-west-3b",
#             "eu-west-3c"
#         ]
#     }
# ]
```

### Show Lightsail blueprint ID, name, version, type

```bash
aws lightsail get-blueprints \
--query 'blueprints[*].[blueprintId,name,version,type]' \
--output text \
| sort -k1

# # Sample Output:
# # Columns from left to right: ID, name, version, type
# amazon_linux_2  Amazon Linux 2  2.0.20230221.0  os
# centos_7_2009_01        CentOS  7 2009-01       os
# centos_8        CentOS  8 2004-01       os
# cpanel_whm_linux        cPanel & WHM for Linux  RELEASE Tier    app
# ...
```

### Show Lightsail bundle ID for a certain region

```bash
region="ap-south-1"  # give a region

aws lightsail get-bundles \
--region $region \
--query 'bundles[*].[bundleId]' \
--output text

# # Sample Output:
# nano_2_1
# micro_2_1
# small_2_1
# ...
```

### Generate a pair of key in local

```bash
key_name="my-server-key"  # How to name your key pair?
key_path="~/.ssh"         # Where to store your key pair?
passphrase=""             # Password of your key pair. "" means no password.

[[ -n $key_name ]] && ssh-keygen -t rsa -C ${key_name} -N "$key_pair_for_web_ins_passphrase" -f $key_path/${key_name} \
&& chmod 400 $key_path/${key_name} \
```

**Hope you like it!**

# Putin khuylo!

```

```
