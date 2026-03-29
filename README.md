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
essas sao as credenciais para que o terraform use ao acessar a AWS
```
export TF_VAR_assume_role='{
    role_arn    = "value",
    external_id = "value"
  }'
```
configure o arn do seu usuario que ira ter acesso ao cluster
```
TF_VAR_principal_arn='value'
```

# configurar o kubectl apos terminar de configurar o cluster

aws eks update-kubeconfig --region <nome-da-regiao> --name <nome-do-cluster>

