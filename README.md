# Configurações iniciais terraform AWS

encontre o exemplo de configuracao do provider em [AWS PROVIDER](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

## exemplo:
crie o arquivo `main.tf`
```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

```
---

# formas de configuracao da autenticacao


### 1 - ter o AWS config configurado corretamente na sua maquina
link para fazer a configuracao: [configuracao CLI AWS](https://docs.aws.amazon.com/cli/v1/userguide/cli-configure-files.html)


## para utilizar esse codigo é necessario definir a variavel do terraform:
```
export TF_VAR_assume_role='{
    role_arn    = "value",
    external_id = "value"
  }'
```