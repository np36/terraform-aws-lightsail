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
  default     = null
  description = "Which AZ this Lightsail instance locates? Default is the 1st AZ of current region. Check https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lightsail_instance#availability-zones for more info."
}

variable "blueprint_id" {
  type        = string
  description = "Which blueprint does this Lightsail use? Tell its ID."
}

variable "bundle_id" {
  type        = string
  description = "Which bundle does this Lightsail use? Tell its ID. Check https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lightsail_instance#bundles for more details about Bundles."
}

variable "key_pair_name_in_console" {
  type        = string
  description = "If already created a custom key in the Lightsail console (cannot use aws_key_pair at this time), give the name of your key pair name of current region. If this variable is assigned, don't use `public_key_file_at_local` or `create_key`."
  default     = null
}

variable "public_key_file_at_local" {
  type        = string
  description = "If created a pair of keys in local, give the absolute path of public key. e.g. `~/.ssh/id_rsa.pub`. If this variable is assigned, don't use `key_pair_name_in_console` or `create_key`."
  default     = null
}

variable "create_key" {
  type        = bool
  description = "If do not want to use the regional default/custom key of Lightsail in Console, set this variable to `true`. If then you want to use an existing public key at local, assign its absolute path to `public_key_file_at_local`, or, a brand new key pair would be create."
  default     = false
}

variable "fire_wall_rules" {
  description = "Fire wall rules for ports"
  type        = map(any)
  default     = null
}


variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
