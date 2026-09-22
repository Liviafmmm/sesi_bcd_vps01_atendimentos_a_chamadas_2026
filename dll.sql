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