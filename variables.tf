variable "cluster_name" {
  description = "Nome do cluster EKS"
  type        = string
  default     = "aws-rds"
}

variable "environment" {
  description = "Ambiente (dev|prod)"
  type        = string
  default     = "dev"
}

variable "region" {
  description = "Região AWS"
  type        = string
  default     = "us-east-1"
}

variable "use_default_vpc" {
  description = "Se true, usa a VPC default. Se false, cria VPC custom."
  type        = bool
  default     = true
}

variable "vpc_cidr" {
  description = "CIDR da VPC custom"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidrs" {
  description = "Lista de CIDRs para subnets custom"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "azs" {
  description = "Availability zones para subnets custom"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "db_name" {
  description = "Nome do banco"
  type        = string
  default     = "db_fiap"
}

variable "db_username" {
  description = "Usuário master do banco"
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "Senha master do banco"
  type        = string
  default     = "postgres"
  sensitive   = true
}

variable "db_instance_class" {
  description = "Tipo da instância RDS"
  type        = string
  default     = "db.t4g.micro"
}

variable "allocated_storage" {
  description = "Tamanho do armazenamento em GB"
  type        = number
  default     = 20
}
