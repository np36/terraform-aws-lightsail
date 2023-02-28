output "arn" {
    description = "The ARN of this Lightsail instance."
  value = try(aws_lightsail_instance.main.0.arn, null)
}

output "id" {
    description = "The ID of this Lightsail instance."
  value = try(aws_lightsail_instance.main.0.id, null)
}

output "created_at" {
    description = "The datetime of creation of this Lightsail instance."
  value = aws_lightsail_instance.main.0.created_at
}

output "availability_zone" {
  value = aws_lightsail_instance.main.0.availability_zone
}

output "blueprint_id" {
  value = aws_lightsail_instance.main.0.blueprint_id
}

output "bundle_id" {
  value = aws_lightsail_instance.main.0.bundle_id
}

output "key_pair_name" {
  value = aws_lightsail_instance.main.0.key_pair_name
}

output "user_data" {
  value = aws_lightsail_instance.main.0.user_data
}

output "staticip_arn" {
  value = aws_lightsail_static_ip.main.0.*.arn
}

output "ip_address" {
  value = aws_lightsail_static_ip.main.0.*.ip_address
}

output "staticip_support_code" {
  value = aws_lightsail_static_ip.main.0.*.support_code
}

output "key_id" {
  value = aws_lightsail_key_pair.instance.*.id
}

output "key_arn" {
  value = aws_lightsail_key_pair.instance.*.arn
}

output "fingerprint" {
  value = aws_lightsail_key_pair.instance.*.fingerprint
}

output "public_key" {
  value = aws_lightsail_key_pair.instance.*.public_key
}

output "private_key" {
  value = aws_lightsail_key_pair.instance.*.private_key
}

output "encrypted_private_key" {
  value = aws_lightsail_key_pair.instance.*.encrypted_private_key
}

output "encrypted_fingerprint" {
  value = aws_lightsail_key_pair.instance.*.encrypted_fingerprint
} 