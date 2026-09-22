# Banco de Dados - Atendimento a Chamados

## Tema 01 - Atendimento a Chamados

Esse trabalho foi feito para a atividade de Banco de Dados do curso de Desenvolvimento de Sistemas.
A ideia do banco é organizar um sistema de atendimento de chamados de TI, onde podemos cadastrar usuários, técnicos, categorias, chamados e o histórico dos atendimentos.

## MER DER Conceitual

![MER Conceitual](Mer_drawio.png)

## MER DER Lógico

![MER DER Lógico](Mer_lógico.drawio.png)

## Normalização

O banco foi organizado usando as formas normais.

1FN: Cada campo possui apenas uma informação e não tem dados repetidos.

2FN: Os campos dependem da chave primária da tabela.

3FN: As informações foram separadas em tabelas para evitar repetir os mesmos dados.

## Tabelas

O banco possui as seguintes tabelas:

Usuario
Tecnico
Categoria
Chamado
Historico

## Dicionário de Dados

### Usuario
| Campo        | Tipo         | Chave | Descrição                |
| ------------ | ------------ | ----- | ------------------------ |
| id           | int          | PK    | Identificação do usuário |
| nome         | varchar(100) | -     | Nome do usuário          |
| email        | varchar(100) | -     | Email                    |
| telefone     | varchar(20)  | -     | Telefone                 |
| departamento | varchar(50)  | -     | Departamento             |
| cargo        | varchar(50)  | -     | Cargo                    |
| status       | enum         | -     | Status do usuário        |

### Tecnico

| Campo         | Tipo         | Chave | Descrição                |
| ------------- | ------------ | ----- | ------------------------ |
| id            | int          | PK    | Identificação do técnico |
| nome          | varchar(100) | -     | Nome do técnico          |
| email         | varchar(100) | -     | Email                    |
| especialidade | varchar(50)  | -     | Especialidade do técnico |
| status        | enum         | -     | Status do técnico        |

### Categoria

| Campo     | Tipo         | Chave | Descrição                  |
| --------- | ------------ | ----- | -------------------------- |
| id        | int          | PK    | Identificação da categoria |
| nome      | varchar(50)  | -     | Nome da categoria          |
| descricao | varchar(100) | -     | Descrição da categoria     |

### Chamado

| Campo           | Tipo         | Chave | Descrição                   |
| --------------- | ------------ | ----- | --------------------------- |
| id              | int          | PK    | Identificação do chamado    |
| titulo          | varchar(100) | -     | Título do chamado           |
| descricao       | text         | -     | Descrição do problema       |
| data_abertura   | datetime     | -     | Data de abertura            |
| data_fechamento | datetime     | -     | Data de fechamento          |
| status          | enum         | -     | Status do chamado           |
| prioridade      | enum         | -     | Prioridade                  |
| id_usuario      | int          | FK    | Usuário que abriu o chamado |
| id_categoria    | in_          |       |                             |


## Relacionamentos

Um usuário pode abrir vários chamados.

Um técnico pode atender vários chamados.

Uma categoria pode ter vários chamados.

Um chamado pode ter vários registros no histórico.

Um usuário pode ter vários registros no histórico.


## Dados de teste em CSV
- [cliente.csv](./cliente.csv)
- [telefone.csv](./telefone.csv)
- [produto.csv](./produto.csv)
- [pedido.csv](./pedido.csv)
- 
Todos possuem pelo menos 3 registros.


## DDL
O arquivo ddl.sql possui os comandos para criar o banco, as tabelas e os relacionamentos.

ddl.sql

Teste do DDL
![DDL](dll.png)



No teste foi executado o arquivo ddl.sql no MySQL para verificar se o banco e as tabelas foram criados corretamente.

DML

O arquivo dml.sql possui os comandos para inserir os dados nas tabelas.

dml.sql

Teste do DML
![DML](dml.png)

No teste foi executado o arquivo dml.sql no MySQL para verificar se os dados foram inseridos corretamente nas tabelas.



## Ferramentas usadas

#MySQL

#SQL

#Draw.io

#GitHub
