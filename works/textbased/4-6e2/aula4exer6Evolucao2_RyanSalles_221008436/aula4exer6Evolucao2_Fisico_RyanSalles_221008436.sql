-- -------- < aula4exer6evolucao2 > --------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 06/05/2024
-- Autor(es) ..............: Ryan Salles
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: Detran
--
-- 
-- Ultimas Alteracoes
--  Alteracao nos tipos de dados
--
-- ---------------------------------------------------------
create database Detran;

create table PROPRIETARIO (
	cpfProprietario		varchar(11)	primary key,
	nomeProprietario	varchar(60)	NOT NULL,
	bairro			varchar(20)	NOT NULL,
	cidade			varchar(20)	NOT NULL,
	estado			varchar(2)	NOT NULL,
	cep			varchar(9)	NOT NULL,
	sexo			enum('M','F')	NOT NULL,
	dtNascimento		date		NOT NULL,
	idade			int(3)		NOT NULL
);
create table telefone (
	cpfProprietario		bigint(12)	NOT NULL,
	telefone		varchar(15)	primary key,
	constraint telefone_PK foreign key (cpfProprietario) references PROPRIETARIO (cpfProprietario)
);
create table VEICULO (
	placa				varchar(8)	primary key auto_increment,
	chassi				varchar(18)	NOT NULL,
	corPredominante		varchar(15)	NOT NULL,
	anoFabricacao		int(5)		NOT NULL,
	codModelo			int(6)		NOT NULL,
	codCategoria		int(2)		NOT NULL,
	cpfProprietario		bigint(12)	NOT NULL,
	constraint VEICULO_PK foreign key (codModelo) references MODELO (codModelo),
	constraint VEICULO_PK foreign key (codCategoria) references CATEGORIA (codCategoria),
	constraint VEICULO_PK foreign key (cpfProprietario) references PROPRIETARIO (cpfProprietario)
);
create table CATEGORIA (
	codCategoria		int(2)		primary key auto_increment,
	nomeCategoria		varchar(20)	NOT NULL
);
create table MODELO (
	codModelo		int(6)		primary key auto_increment,
	nomeModelo		varchar(20)	NOT NULL
);
create table INFRACAO (
	dtHora				datetime	NOT NULL,
	velocidadeAferida	int(3),
	codInfracao			int(4)		primary key NOT NULL,
	codLocal			int(6)		NOT NULL,
	matriculaAgente		int(6)		NOT NULL,
	placa				varchar(8)	NOT NULL,
	constraint INFRACAO_FK foreign key (codInfracao) references MULTA (codInfracao),
	constraint INFRACAO_FK foreign key (codLocal) references LUGAR (codLocal),
	constraint INFRACAO_FK foreign key (matriculaAgente) references AGENTE (matriculaAgente),
	constraint INFRACAO_FK foreign key (placa) references VEICULO (placa)
);

create table MULTA (
	codInfracao		    int(4)		    primary key auto_increment,
	descricaoInfracao	varchar(100)	NOT NULL,
	valorMulta		    decimal(8,2)	NOT NULL
);
create table LUGAR (
	codLocal			int(6)		primary key auto_increment,
	latitude			int(2)		NOT NULL,
	longitude			int(2)		NOT NULL,
	velocidadePermitida	int(3)		NOT NULL
);
create table AGENTE (
	matriculaAgente		int(6)		primary key auto_increment,
	nomeAgente			varchar(60)	NOT NULL,
	dtContratacao		date		NOT NULL,
	tempoServico		int			NOT NULL
);
