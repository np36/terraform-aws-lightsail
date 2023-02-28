variable "create" {
  description = "Whether to create this Lightsail instance."
  type        = bool
  default     = true
}

variable "name" {
  description = "What would you like to call this instance? \"Kitty\"? \"Putin_khuylo\"?"
  type        = string
}

variable "availability_zone" {
  type        = string
  default     = data.aws_availability_zones.available.names[0]
  description = "Which AZ this Lightsail instance locates? Default is the 1st AZ of current region. Check [this related page in Terraform doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lightsail_instance#availability-zones) for more details about Lightsail AZs."
}

variable "blueprint_id" {
  type        = string
  description = "Which blueprint does this Lightsail use? Tell its ID. Use this command to list all available blueprint IDs: `aws lightsail get-blueprints --query 'blueprints[*].[blueprintId,version,name,type]' --output text | sort -k1`"
}

variable "bundle_id" {
  type        = string
  description = "Which bundle does this Lightsail use? Tell its ID. Use this command to list all available blueprint IDs: `aws lightsail get-bundles --query 'bundles[*].[bundleId]' --output text`. Check [this related page in Terraform doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lightsail_instance#bundles) for more details about Bundles."
}

variable "key_pair_name_in_console" {
  type        = string
  description = "If already created a custom key in the Lightsail console (cannot use aws_key_pair at this time), give the name of your key pair in current region."
  default     = null
}

variable "public_key_file_at_local" {
    type = string
    description = "If created a pair of keys in local, give the absolute path of public key. e.g. `~/.ssh/id_rsa.pub`"
    default = null
}

variable "do_not_create_key" {
  type = bool
  description = "value"
  default = false
}



variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "port_443_cidr_blocks" {
  description = "A mapping of cidr blocks that are allowed by port 443. e.g. `{\"Open to the whold world\": \"0.0.0.0/0\"}`"
  type        = map(string)
  default = {}
}

variable "port_80_cidr_blocks" {
  description = "A mapping of cidr blocks that are allowed by port 80. e.g. `{\"Open to the whold world\": \"0.0.0.0/0\"}`"
  type        = map(string)
  default = {}
}

variable "port_22_cidr_blocks" {
  description = "A mapping of cidr blocks that are allowed by port 22. e.g. `{\"Open to the whold world\": \"0.0.0.0/0\"}`"
  type        = map(string)
  default = {}
}
