terraform {
  required_version = ">= 0.14.0"
}

provider "aws" {
  region = "us-west-2"
}

provider "aws" {
  alias  = "lightsail"
  region = "ap-northeast-1"
}