resource "aws_security_group" "rds" {
  name        = "${var.cluster_name}-${var.environment}-rds-sg"
  description = "Acesso ao RDS PostgreSQL"
  vpc_id      = local.vpc_id_db
  tags        = local.common_tags

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}