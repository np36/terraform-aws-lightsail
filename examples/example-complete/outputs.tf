output "arn" {
  description = "The ARN of this Lightsail instance."
  value       = module.lightsail.arn
}

output "id" {
  description = "The ID of this Lightsail instance."
  value       = module.lightsail.id
}

output "created_at" {
  description = "The datetime of creation of this Lightsail instance."
  value       = module.lightsail.created_at
}

output "availability_zone" {
  description = "The availability zone this Lightsail instance locates."
  value       = module.lightsail.availability_zone
}

output "blueprint_id" {
  description = "The blueprint id of this Lightsail instance."
  value       = module.lightsail.blueprint_id
}

output "bundle_id" {
  description = "The bundle id of this Lightsail instance."
  value       = module.lightsail.bundle_id
}

output "key_pair_name" {
  description = "The key pair name of this Lightsail instance."

  value = module.lightsail.key_pair_name
}

output "user_data" {
  description = "The user data of this Lightsail instance."

  value = module.lightsail.user_data
}

output "static_ip_arn" {
  description = "The static ip arn of this Lightsail instance."
  value       = module.lightsail.static_ip_arn
}

output "static_ip_address" {
  description = "The static ip address of this Lightsail instance."
  value       = module.lightsail.static_ip_address
}

output "static_ip_support_code" {
  description = "The static ip support code of this Lightsail instance."
  value       = module.lightsail.static_ip_support_code
}

output "key_id" {
  description = "The key pair ID of this Lightsail instance."

  value = module.lightsail.key_id
}

output "key_arn" {
  description = "The key pair ARN of this Lightsail instance."

  value = module.lightsail.key_arn
}

output "key_fingerprint" {
  description = "The key pair fingerprint of this Lightsail instance."

  value = module.lightsail.key_fingerprint
}

output "public_key" {
  description = "If created a new key in Console, this is the public key of this Lightsail instance."

  value = module.lightsail.public_key
}

output "private_key" {
  description = "If created a new key in Console, this is the private key of this Lightsail instance."
  value       = module.lightsail.private_key
}

output "encrypted_private_key" {
  description = "If created a new key in Console, this is the encrypted private key of this Lightsail instance."

  value = module.lightsail.encrypted_private_key
}

output "encrypted_fingerprint" {
  description = "If created a new key in Console, this is the encrypted fingerprint of the key of this Lightsail instance."

  value = module.lightsail.encrypted_fingerprint
}
