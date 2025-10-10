provider "aws" {
  region = var.region
}

locals {
  common_tags = {
    Project     = var.cluster_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_db_subnet_group" "rms" {
  name       = "${var.cluster_name}-${var.environment}-db-subnets"
  subnet_ids = local.subnets_db
  tags       = local.common_tags
}

resource "aws_db_instance" "postgres" {
  identifier     = "${var.cluster_name}-${var.environment}-postgres"
  engine         = "postgres"
  engine_version = "16.3"
  instance_class = var.db_instance_class
  db_name        = var.db_name
  username       = var.db_username
  password       = var.db_password

  allocated_storage   = var.allocated_storage
  storage_encrypted   = true
  publicly_accessible = var.use_default_vpc ? true : false
  port                = 5432

  db_subnet_group_name   = aws_db_subnet_group.rms.name
  vpc_security_group_ids = [aws_security_group.rds.id]

  skip_final_snapshot = true
  deletion_protection = false
  apply_immediately   = true

  tags = local.common_tags
}