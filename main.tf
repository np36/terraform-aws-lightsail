terraform {
  required_version = ">= 0.14.0"
  required_providers {
    aws = "~> 4.0"
  }
}

data "aws_region" "current" {}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_lightsail_instance" "main" {
  count = var.create ? 1 : 0

  name = var.name

  availability_zone = var.availability_zone == null ? data.aws_availability_zones.available.names[0] : var.availability_zone

  blueprint_id = var.blueprint_id

  bundle_id     = var.bundle_id
  key_pair_name = var.create_key == true ? aws_lightsail_key_pair.main.0.name : var.key_pair_name_in_console != null ? var.key_pair_name_in_console : null

  tags = var.tags
}

resource "aws_lightsail_static_ip" "main" {
  count = var.create ? 1 : 0
  name  = "lightsail_static_ip_for_${var.name}"
}

resource "aws_lightsail_static_ip_attachment" "main" {
  count          = var.create ? 1 : 0
  static_ip_name = aws_lightsail_static_ip.main.0.id
  instance_name  = aws_lightsail_instance.main.0.id
}

resource "aws_lightsail_key_pair" "main" {
  count      = var.create_key == true ? 1 : 0
  name       = "${var.name}-lightsail-keypair"
  public_key = var.public_key_file_at_local == null ? null : file(var.public_key_file_at_local)
}

resource "aws_lightsail_instance_public_ports" "main" {
  count         = var.create == true ? var.fire_wall_rules == null ? 0 : 1 : 0
  instance_name = aws_lightsail_instance.main.0.name

  dynamic "port_info" {
    for_each = var.fire_wall_rules
    content {
      protocol  = "tcp"
      from_port = port_info.key
      to_port   = port_info.key
      cidrs     = [for k, v in port_info.value : v]
    }
  }
}
