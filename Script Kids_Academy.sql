create database Kids_Academy;

use Kids_Academy;

create table responsavel(
	id_responsavel int not null primary key,
    nome varchar(45),
    sobrenome varchar(45),
    cpf varchar(45) not null,
    email varchar(45) not null
);

create table periodo(
	id_periodo int not null primary key,
    descricao varchar(45),
    horario_inicio varchar(45),
    horario_fim varchar(45)
);

create table estado(
	id_estado int not null primary key,
    nome varchar(45),
    uf varchar(45)
);

create table cidade(
	id_cidade int not null primary key,
    nome varchar(45),
    id_estado int not null,
    foreign key (id_estado) references estado(id_estado)
);

create table escola(
	id_escola int not null primary key,
    nome varchar(45),
    rua varchar(45),
    numero varchar(10),
    bairro varchar(45),
    id_cidade int not null,
    foreign key (id_cidade) references cidade(id_cidade)
);

create table sala(
	id_sala int not null primary key,
    numero int,
    capacidade int,
    id_escola int not null,
    foreign key (id_escola) references escola(id_escola)
);

create table curso(
	id_curso int not null primary key,
    descricao varchar(45),
    carga_horaria float,
    id_sala int not null,
    foreign key (id_sala) references sala(id_sala),
    id_periodo int not null,
    foreign key (id_periodo) references periodo(id_periodo)
);

create table aluno(
	id_aluno int not null primary key,
    nome varchar(45),
    sobrenome varchar(45),
    nascimento date,
    usuario varchar(45) not null,
    senha varchar(45) not null,
    matricula varchar(45) not null,
	sobre varchar(100),
    end_avatar varchar(45),
    id_responsavel int not null,
    foreign key (id_responsavel) references responsavel(id_responsavel),
    id_curso int not null,
    foreign key (id_curso) references curso(id_curso),
    status_curso tinyint
);

create table professor(
	id_professor int not null primary key,
    nome varchar(45),
    sobrenome varchar(45),
    nascimento date,
    email varchar(45),
    id_curso int not null,
    foreign key (id_curso) references curso(id_curso)
);