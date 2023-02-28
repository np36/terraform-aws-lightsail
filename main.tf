terraform {
  required_version = ">= 0.14.0"
}

data "aws_region" "current" {}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_lightsail_instance" "main" {
  count = var.create ? 1 : 0

  name = var.name

  availability_zone = var.availability_zone

  blueprint_id = var.blueprint_id

  bundle_id = var.bundle_id
  key_pair_name     = var.key_pair_name || null 
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
  count = var.key_pair_name == null && var.do_not_create_key == false ? 1 : 0
  name  = "${var.name}-lightsail-keypair"
    public_key = var.public_key_file_at_local && file(var.public_key_file_at_local)
}

resource "aws_lightsail_instance_public_ports" "main" {
  count         = var.create ? 1 : 0
  instance_name = aws_lightsail_instance.main.0.name

  port_info {
    protocol  = "tcp"
    from_port = 443
    to_port   = 443
    cidrs     = [for k, v in var.port_443_cidr_blocks : v]
  }

  port_info {
    protocol  = "tcp"
    from_port = 80
    to_port   = 80
    cidrs     = [for k, v in var.port_80_cidr_blocks : v]
  }

  port_info {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
    cidrs     = [for k, v in var.port_22_cidr_blocks : v]
  }

}
