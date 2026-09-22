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
- [cliente.csv](./chamado.csv)
- [categoria.csv](./categoria.csv)
- [tecnico.csv](./tecnico.csv)
- [historico.csv](./historico.csv)
- [usuario.csv](./usuario.csv)
  
Todos possuem pelo menos 3 registros.


## DDL
O arquivo ddl.sql possui os comandos para criar o banco, as tabelas e os relacionamentos.

## Script SQL DDL (Desenvolvimanto: Criação do Banco de dados)
```sql
drop database if exists atendimento_chamados;
create database atendimento_chamados;

use atendimento_chamados;
create table usuario (
    id int primary key not null auto_increment,
    nome varchar(100) not null,
    email varchar(100) not null unique,
    telefone varchar(20) not null,
    departamento varchar(50) not null,
    cargo varchar(50) not null,
    status enum('ATIVO','INATIVO') not null
);
create table tecnico (
    id int primary key not null auto_increment,
    nome varchar(100) not null,
    email varchar(100) not null unique,
    especialidade varchar(50) not null,
    status enum('ATIVO','INATIVO') not null
);
create table categoria (
    id int primary key not null auto_increment,
    nome varchar(50) not null,
    descricao varchar(100) not null
);
create table chamado (
    id int primary key not null auto_increment,
    titulo varchar(100) not null,
    descricao text not null,
    data_abertura datetime not null,
    data_fechamento datetime,
    status enum('ABERTO','EM ANDAMENTO','RESOLVIDO','FECHADO') not null,
    prioridade enum('BAIXA','MEDIA','ALTA') not null,
    id_usuario int not null,
    id_categoria int not null,
    id_tecnico int
);
create table historico (
    id int primary key not null auto_increment,
    id_chamado int not null,
    id_usuario int not null,
    data_hora datetime not null,
    descricao text not null,
    tipo enum('COMENTARIO','ATUALIZACAO','SOLUCAO') not null
);
alter table chamado add constraint pertence
foreign key (id_usuario) references usuario(id);

alter table chamado add constraint classificado
foreign key (id_categoria) references categoria(id);

alter table chamado add constraint atendido
foreign key (id_tecnico) references tecnico(id);

alter table historico add constraint registra
foreign key (id_chamado) references chamado(id);

alter table historico add constraint feito_por
foreign key (id_usuario) references usuario(id);

show tables;
describe usuario;
describe tecnico;
describe categoria;
describe chamado;
describe historico;
```
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
