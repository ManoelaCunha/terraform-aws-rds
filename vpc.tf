# --- VPC default (quando use_default_vpc = true) ---
data "aws_vpc" "selected" {
  count   = var.use_default_vpc ? 1 : 0
  default = true
}

data "aws_subnets" "selected" {
  count = var.use_default_vpc ? 1 : 0
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected[0].id]
  }
}

# --- VPC custom (quando use_default_vpc = false) ---
resource "aws_vpc" "custom" {
  count = var.use_default_vpc ? 0 : 1

  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = merge(local.common_tags, {
    Name = "${var.cluster_name}-${var.environment}-vpc"
  })
}

resource "aws_subnet" "custom" {
  count = var.use_default_vpc ? 0 : length(var.subnet_cidrs)

  vpc_id            = aws_vpc.custom[0].id
  cidr_block        = var.subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]

  tags = merge(local.common_tags, {
    Name = "${var.cluster_name}-${var.environment}-${count.index}"
  })
}

locals {
  vpc_id_db  = var.use_default_vpc ? data.aws_vpc.selected[0].id : aws_vpc.custom[0].id
  subnets_db = var.use_default_vpc ? data.aws_subnets.selected[0].ids : aws_subnet.custom[*].id
}