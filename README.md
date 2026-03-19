# Projeto de Modelagem de Dados - Sistema de Vendas

### Objetivo

Este projeto foi desenvolvido com o objetivo de consolidar conhecimentos em modelagem de dados, aplicando na prática os conceitos de Modelo Entidade-Relacionamento (ER) e sua implementação em SQL.

A proposta consistiu em:

- Estudar os conceitos teóricos de modelagem conceitual
- Criar um modelo ER representando um sistema de vendas
- Implementar o modelo através de scripts SQL

### Conceitos Estudados

Durante o desenvolvimento deste projeto, foram estudados e aplicados os seguintes conceitos:

- Modelo Entidade-Relacionamento (ER)
- Entidades e Atributos
- Relacionamentos e Cardinalidade
- Chaves Primárias (PK)
- Chaves Estrangeiras (FK)
- Tabelas associativas (N:N)
- Normalização (até a 3ª Forma Normal - 3FN)
- Integridade referencial
- Constraints (PRIMARY KEY, FOREIGN KEY, CHECK, NOT NULL)
- Boas práticas de modelagem

### Etapas do Projeto

**1 - Modelagem Conceitual**

Inicialmente, foi criado um modelo ER representando um sistema de vendas contendo as seguintes entidades:

- Cliente
- Endereço
- Pedido
- Item do Pedido
- Produto
- Categoria
- Status do Pedido

O modelo foi estruturado considerando:

- Separação clara de responsabilidades entre entidades
- Relacionamentos bem definidos (1:N e N:N)
- Representação fiel de um cenário real de vendas

**2 - Decisões de Modelagem**

Algumas decisões importantes tomadas durante a modelagem:

- Uso de tabela associativa (Cliente_Endereco) para permitir múltiplos endereços por cliente
- Separação da entidade Status_Pedido para evitar inconsistência de dados
- Inclusão de valor_unitario no Item do Pedido, garantindo histórico de preços
- Uso de FK de endereço no Pedido, preservando o endereço da compra no momento da transação
- Evitar atributos derivados (ex: idade, valor total calculado dinamicamente)

**3️ - Normalização**

O modelo foi estruturado até a Terceira Forma Normal (3FN), garantindo:

- Eliminação de redundâncias
- Dependências funcionais corretas
- Separação adequada entre entidades

**4 - Implementação em SQL**

Após a modelagem, foi realizada a criação das tabelas utilizando SQL, incluindo:

- Definição de chaves primárias
- Implementação de chaves estrangeiras
- Uso de constraints para integridade dos dados
- Aplicação de CHECK constraints para validação de regras de negócio
- Criação de índices para otimização de consultas

### Estrutura do Banco de Dados

O banco de dados é composto pelas seguintes tabelas:

- Cliente
- Endereco
- Cliente_Endereco
- Pedido
- Status_Pedido
- Produto
- Categoria
- Item_Pedido

### Principais Relacionamentos

- Um cliente pode possuir múltiplos endereços
- Um cliente pode realizar vários pedidos
- Um pedido pertence a um único cliente
- Um pedido possui vários itens
- Um produto pode estar presente em vários itens de pedido
- Um produto pertence a uma categoria
- Um pedido possui um status

### Tecnologias Utilizadas

- SQL Server
- Linguagem SQL
- Ferramenta de modelagem (diagrama ER)

### Possibilidades de Evolução

Este projeto pode ser expandido para:

- Criação de consultas analíticas (faturamento, ticket médio, etc.)
- Desenvolvimento de dashboards
- Implementação de ETL
- Transformação do modelo em um Data Warehouse (Star Schema)
- Integração com ferramentas como Power BI ou Databricks

### Conclusão

Este projeto foi essencial para transformar conhecimento teórico em prática, permitindo uma compreensão mais profunda sobre:

- Estruturação de dados
- Organização de sistemas reais
- Boas práticas de modelagem
- Preparação para cenários de análise de dados
