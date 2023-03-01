# A complete example of how to use [np36/lightsail/aws](https://registry.terraform.io/modules/np36/lightsail/aws/latest)

# Some helper commands
## How to list available AZs of a specific region.
```bash
# give a region code
region="ap-northeast-1"

aws lightsail get-regions --region $region --include-availability-zones --query "regions[?name=='$region'].{regionName: displayName, regionCode: name, ZAs:availabilityZones[?state=='available'].zoneName }"
```