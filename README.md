# Terraform AWS RDS

**Tech Challenge** do curso **Pós Tech em Arquitetura de Software** — Sistema de Autoatendimento de Fast Food.

**Descrição Breve**: Este módulo Terraform provisiona uma instância Amazon RDS na AWS.

## 🚀 Visão Geral

Este projeto contém código Terraform modular para implantar um banco de dados Amazon RDS (Relational Database Service). A configuração de rede é flexível, permitindo o uso da VPC padrão da conta para testes rápidos ou a criação de uma VPC customizada.

## ✅ Pré-requisitos

- [Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- [AWS CLI](https://docs.aws.amazon.com/pt_br/cli/latest/userguide/getting-started-install.html)
- Credenciais AWS configuradas com permissões adequadas - AWS_ACCESS_KEY_ID | AWS_SECRET_ACCESS_KEY

## ⚙️ Configuração e Uso

### 1. Clonar o Repositório

```bash
git clone https://github.com/ManoelaCunha/terraform-aws-eks.git
cd terraform-aws-eks
```

### 2. Execução da Infraestrutura Terraform

Siga estes passos para implantar a infraestrutura:

Inicialize o projeto Terraform para baixar os providers necessários.

```bash
terraform init
```

Revise o plano de execução para ver quais recursos serão criados.

```bash
terraform plan
```

Aplique a configuração para criar a infraestrutura.

```bash
terraform apply
```

### 3. Destruindo a Infraestrutura

Para desfazer todos os recursos criados por este Terraform e evitar custos contínuos, execute:

```bash
terraform destroy
```

## 🤝 Projetos relacionados

API de Fast Food https://github.com/ManoelaCunha/api-software-architecture-fiap

## 🔗 Referências

- [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
- [AWS RDS Documentation](https://docs.aws.amazon.com/pt_br/rds/)
