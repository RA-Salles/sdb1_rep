-- -------- < aula4exer6evolucao2 > --------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 01/05/2024
-- Autor(es) ..............: Larissa de Jesus Vieira
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: Detran
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
--         => 00 Visoes
--         => 00 Perfis (role)
--         => 00 Usuarios
--         => 00 Sequencias
--         => 00 Triggers
--         => 00 Procedimentos
--         => 00 Funcoes

-- 
-- Ultimas Alteracoes
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

INSERT INTO PROPRIETARIO VALUES( "05630678108", "Ryan Salles", "Gama", "Brasilia", "DF", "73030037", "M", '2003-09-19', 20);
INSERT INTO PROPRIETARIO VALUES( "26264481092", "Kaleb Silva", "Planaltina", "Brasilia", "DF", "73358420", "M", '1994-08-14', 30);
INSERT INTO PROPRIETARIO VALUES( "41401184235", "Jahne Doe", "Cruzeiro Novo", "Brasilia", "DF", "70658375", "F", '2003-04-23', 21);
INSERT INTO telefone 	 VALUES("05630678108", "6134368743");
INSERT INTO telefone	 VALUES("26264481092", "6135497420");
INSERT INTO telefone 	 VALUES("41401184235", "61997425928");
INSERT INTO MODELO 		 VALUES( 01, "F250 TROPICAMPO");
INSERT INTO MODELO  	 VALUES(02, "EcoSport SE");
INSERT INTO MODELO 		 VALUES(03, "F-1000 XLT");
INSERT INTO CATEGORIA 	 VALUES( 01, "CAMINHONETE");
INSERT INTO CATEGORIA 	 VALUES( 02, "SUV");
INSERT INTO CATEGORIA 	 VALUES( 03, "SEDAN");
INSERT INTO VEICULO 	 VALUES( "JHC8087", "8sbUj9Zr83AKw7228", "Azul", 2007, 01, 01, "05630678108");
INSERT INTO VEICULO  	 VALUES( "JKP0472", "935fCGPKugg9W0599", "Laranja", 2013, 02, 02, "26264481092");
INSERT INTO VEICULO 	 VALUES( "JGE5750", "8hxWpsFe6sM2X7308", "Dourado", 1996, 03, 01,  "41401184235");
INSERT INTO LUGAR        VALUES(01, 15, 47, 80);
INSERT INTO LUGAR        VALUES(02, 15, 47, 80);
INSERT INTO LUGAR        VALUES(03, 16, 48, 60);
INSERT INTO AGENTE		 VALUES(01, "Joao Pereira", '2010-03-04', 177);
INSERT INTO AGENTE 		 VALUES(02, "Carlos Mydia Merlin", '2015-08-22', 112);
INSERT INTO AGENTE       VALUES(03, "Matheus do Egito", '2024-03-15', 1);
INSERT INTO INFRACAO     VALUES('20120618 10:34:13 AM', 0, 01 , 01 , 01 , "JHC8087");
INSERT INTO INFRACAO     VALUES('20150830 03:50:17 PM', 0, 02 , 01 , 01 , "JHC8087");
INSERT INTO INFRACAO     VALUES('20180914 05:28:30 AM', 0, 03 , 01 , 01 , "JHC8087");
INSERT INTO MULTA        VALUES(01, "Estacionado em lugar inadequado", 500.00);
INSERT INTO MULTA        VALUES(02, "Estacionado em lugar inadequado", 500.00);
INSERT INTO MULTA        VALUES(03, "Estacionado em lugar inadequado", 500.00);

DROP DATABASE Detran;
