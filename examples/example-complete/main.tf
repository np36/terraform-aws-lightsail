terraform {
  required_version = ">= 0.14.0"
}

provider "aws" {
  region = "us-west-2"
}

# If want to deploy Lightsail in a different region, create a alias provider like this
provider "aws" {
  alias  = "lightsail"
  region = "ap-northeast-1"
}