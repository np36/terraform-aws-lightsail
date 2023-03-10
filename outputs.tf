output "arn" {
  description = "The ARN of this Lightsail instance."
  value       = try(aws_lightsail_instance.main.0.arn, null)
}

output "id" {
  description = "The ID of this Lightsail instance."
  value       = try(aws_lightsail_instance.main.0.id, null)
}

output "created_at" {
  description = "The datetime of creation of this Lightsail instance."
  value       = try(aws_lightsail_instance.main.0.created_at, null)
}

output "availability_zone" {
  description = "The availability zone this Lightsail instance locates."
  value       = try(aws_lightsail_instance.main.0.availability_zone, null)
}

output "blueprint_id" {
  description = "The blueprint id of this Lightsail instance."
  value       = try(aws_lightsail_instance.main.0.blueprint_id, null)
}

output "bundle_id" {
  description = "The bundle id of this Lightsail instance."
  value       = try(aws_lightsail_instance.main.0.bundle_id, null)
}

output "key_pair_name" {
  description = "The key pair name of this Lightsail instance."

  value = try(aws_lightsail_instance.main.0.key_pair_name, null)
}

output "user_data" {
  description = "The user data of this Lightsail instance."

  value = try(aws_lightsail_instance.main.0.user_data, null)
}

output "static_ip_arn" {
  description = "The static ip arn of this Lightsail instance."
  value       = try(aws_lightsail_static_ip.main.0.arn, null)
}

output "static_ip_address" {
  description = "The static ip address of this Lightsail instance."
  value       = try(aws_lightsail_static_ip.main.0.ip_address, null)
}

output "static_ip_support_code" {
  description = "The static ip support code of this Lightsail instance."
  value       = try(aws_lightsail_static_ip.main.0.support_code, null)
}

output "key_id" {
  description = "The key pair ID of this Lightsail instance."

  value = try(aws_lightsail_key_pair.main.0.id, null)
}

output "key_arn" {
  description = "The key pair ARN of this Lightsail instance."

  value = try(aws_lightsail_key_pair.main.0.arn, null)
}

output "key_fingerprint" {
  description = "The key pair fingerprint of this Lightsail instance."

  value = try(aws_lightsail_key_pair.main.0.fingerprint, null)
}

output "public_key" {
  description = "If created a new key in Console, this is the public key of this Lightsail instance."

  value = try(aws_lightsail_key_pair.main.0.public_key, null)
}

output "private_key" {
  description = "If created a new key in Console, this is the private key of this Lightsail instance."
  value       = try(aws_lightsail_key_pair.main.0.private_key, null)
}

output "encrypted_private_key" {
  description = "If created a new key in Console, this is the encrypted private key of this Lightsail instance."

  value = try(aws_lightsail_key_pair.main.0.encrypted_private_key, null)
}

output "encrypted_fingerprint" {
  description = "If created a new key in Console, this is the encrypted fingerprint of the key of this Lightsail instance."

  value = try(aws_lightsail_key_pair.main.0.encrypted_fingerprint, null)
}
