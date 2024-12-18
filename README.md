# Configuração de Infraestrutura de Banco de Dados com Terraform

Este repositório contém os arquivos de configuração do **Terraform** responsáveis pela criação da infraestrutura necessária para o banco de dados do sistema. A infraestrutura foi projetada para garantir **integridade dos dados**, essencial para o processamento de pedidos e transações financeiras.

---

## **Arquitetura**

### **1. Banco de Dados Estruturado**
- Foi escolhido um banco de dados **relacional (RDS)** devido à necessidade de garantir:
  - **Integridade transacional**: Fundamental para assegurar que todas as transações financeiras e pedidos sejam consistentes.
  - **Relacionalidade**: Possibilidade de criar relações complexas entre tabelas, como pedidos, clientes e status de pagamento.
  - **Alta Disponibilidade**: O RDS suporta réplicas automáticas e failover para minimizar downtime.

### **2. Camadas de Segurança**
- O banco de dados está protegido por **Security Groups**, que restringem o acesso apenas às origens autorizadas.
- O tráfego é limitado a portas específicas (ex.: 3306 para MySQL ou 5432 para PostgreSQL).
- A comunicação é protegida por **TLS**, garantindo a segurança dos dados em trânsito.

---

## **Conteúdo do Repositório**

### **Arquivos Principais**
1. **`provider.tf`**:
   - Configura o provedor AWS e o backend para armazenar o estado do Terraform no S3.

2. **`vars.tf`**:
   - Declara as variáveis utilizadas no projeto, como região, nome do banco, e tipo de instância.

3. **`rds.tf`**:
   - Contém os recursos para a criação do banco de dados no **AWS RDS**.
   - Configurações incluem engine, tipo de instância, armazenamento e parâmetros adicionais.

4. **`security_group.tf`**:
   - Define as regras de segurança que controlam o tráfego de entrada e saída para o banco de dados.

5. **`data.tf`**:
   - Utiliza recursos data para buscar informações existentes, como VPC ou subnets.

---

## **Configuração**

### **1. Pré-requisitos**
- **Terraform** instalado (versão 1.8.0 ou superior).
- Credenciais AWS configuradas com acesso para criar recursos (RDS, Security Groups, VPCs, etc.).
- Configuração do backend no S3 para armazenar o estado do Terraform.

### **2. Variáveis de Entrada**
O repositório utiliza variáveis para personalizar a infraestrutura. Aqui estão algumas delas:

| Nome                  | Descrição                            | Valor Padrão       |
|-----------------------|---------------------------------------|--------------------|
| `region`              | Região AWS para provisionar recursos | `us-east-1`        |
| `db_instance_class`   | Tipo de instância do banco de dados  | `db.t3.micro`      |
| `db_name`             | Nome do banco de dados               | `app_db`           |
| `allocated_storage`   | Armazenamento em GB                  | `20`               |

### **3. Passos para Execução**
1. Clone o repositório:
   ```bash
   git clone <repo-url>
   cd <repo-folder>
