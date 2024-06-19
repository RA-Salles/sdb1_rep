--
-- -------- < aula4exer6Evolucao2 Fisico > --------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 05/05/2024
-- Autor(es) ..............: Arthur Heleno do Couto da Silva
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula4exer6Evolucao2
--
-- PROJETO => 01 Base de Dados
--         => 11 Tabelas
--
-- 
-- Ultimas Alteracoes
--   06/05/2024 => Adição de if not exists na criação da base de dados
--   06/05/2024 => Adição de ENGINE = InnoDB em todas as tabelas
--
-- ---------------------------------------------------------

-- BASE DE DADOS
CREATE DATABASE 
  IF NOT EXISTS aula4exer6Evolucao2;

USE aula4exer6Evolucao2;


-- TABELAS
CREATE TABLE PROPRIETARIO (
	cpf					DECIMAL(11)	  NOT NULL,
	nome				VARCHAR(60)	  NOT NULL,
	sexo				ENUM('M','F') NOT NULL,
	dataDeNascimento	DATE		  NOT NULL,
	idade				DECIMAL(3)	  NOT NULL,
    CONSTRAINT PROPRIETARIO_PK PRIMARY KEY (cpf)
) ENGINE = InnoDB;

CREATE TABLE endereco (
	logradouro			VARCHAR(20)   NOT NULL,
    numero				DECIMAL(5)    NOT NULL,
    complemento			VARCHAR(20),       -- ===> EVITAR <====
    bairro				VARCHAR(20)   NOT NULL,
    cidade				VARCHAR(20)   NOT NULL,
    estado				CHAR(2)       NOT NULL,
    proprietario		DECIMAL(11),
    CONSTRAINT endereco_PROPRIETARIO_FK FOREIGN KEY (proprietario) REFERENCES PROPRIETARIO (cpf)
)ENGINE = InnoDB;

CREATE TABLE telefone (
	telefone			DECIMAL(15)	  NOT NULL,
    proprietario		DECIMAL(11),
	CONSTRAINT telefone_PROPRIETARIO_FK FOREIGN KEY (proprietario) REFERENCES PROPRIETARIO (cpf)
)ENGINE = InnoDB;

CREATE TABLE CATEGORIA (
	codigo				DECIMAL(2)    NOT NULL,
	nome				VARCHAR(20)	  NOT NULL,
    CONSTRAINT CATEGORIA_PK PRIMARY KEY (codigo)
)ENGINE = InnoDB;

CREATE TABLE MODELO (
	codigo				DECIMAL(6)    NOT NULL,
	nome				VARCHAR(20)   NOT NULL,
    CONSTRAINT MODELO_PK PRIMARY KEY (codigo)
)ENGINE = InnoDB;

CREATE TABLE VEICULO (
	placa				VARCHAR(8)    NOT NULL,
	chassi				VARCHAR(18)	  NOT NULL,
	corPredominante		VARCHAR(15)	  NOT NULL,
    modelo				DECIMAL(6)    NOT NULL,
    categoria			DECIMAL(2)    NOT NULL,
	anoDeFabricacao		DECIMAL(4)    NOT NULL,
	proprietario		DECIMAL(11),
    CONSTRAINT VEICULO_PK PRIMARY KEY (placa),
	CONSTRAINT VEICULO_MODELO_FK FOREIGN KEY (modelo) REFERENCES MODELO (codigo),
	CONSTRAINT VEICULO_CATEGORIA_FK FOREIGN KEY (categoria) REFERENCES CATEGORIA (codigo),
	CONSTRAINT VEICULO_PROPRIETARIO_FK FOREIGN KEY (proprietario) REFERENCES PROPRIETARIO (cpf)
)ENGINE = InnoDB;

CREATE TABLE TIPOINFRACAO (
	codigo				DECIMAL(4)    NOT NULL,
	nome				VARCHAR(100)  NOT NULL,
	valorDaMulta		DECIMAL(8,2)  NOT NULL,
    CONSTRAINT TIPOINFRACAO_PK PRIMARY KEY (codigo)
)ENGINE = InnoDB;

CREATE TABLE LOCALIZACAO (
	codigo				DECIMAL(6)    NOT NULL,
	velocidadePermitida	DECIMAL(3)    NOT NULL,
    CONSTRAINT LOCALIZACAO_PK PRIMARY KEY (codigo)
)ENGINE = InnoDB;

CREATE TABLE posicaoGeografica (
	latitude			CHAR(9)       NOT NULL,
    longitude			CHAR(10)      NOT NULL,
    codigoLocal			DECIMAL(6),
    CONSTRAINT posicaoGeografica_LOCALIZACAO_FK FOREIGN KEY (codigoLocal) REFERENCES LOCALIZACAO (codigo) 
)ENGINE = InnoDB;

CREATE TABLE AGENTE (
	matriculaFuncional	DECIMAL(15)   NOT NULL,
	nome				VARCHAR(60)   NOT NULL,
	dataDeContratacao	DATE          NOT NULL,
	tempoDeServico		DECIMAL(4)    NOT NULL,
    CONSTRAINT AGENTE_PK PRIMARY KEY (matriculaFuncional)
)ENGINE = InnoDB;

CREATE TABLE INFRACAO (
	veiculoInfrator		VARCHAR(8)    NOT NULL, 
	dataDaInfracao		DATE          NOT NULL,
    horaDaInfracao		time          NOT NULL,
    tipoDeInfracao		DECIMAL(4)    NOT NULL,
	codigoLocal			DECIMAL(6)    NOT NULL,
    velocidadeAferida	DECIMAL(3),
	agenteDeTransito	DECIMAL(15)    NOT NULL,
    CONSTRAINT INFRACAO_PK PRIMARY KEY (veiculoInfrator, dataDaInfracao, horaDaInfracao, tipoDeInfracao),
	CONSTRAINT INFRACAO_VEICULO_FK FOREIGN KEY (veiculoInfrator) REFERENCES VEICULO (placa),
	CONSTRAINT INFRACAO_TIPOINFRACAO_FK FOREIGN KEY (tipoDeInfracao) REFERENCES TIPOINFRACAO (codigo),
	CONSTRAINT INFRACAO_LOCALIZACAO_FK FOREIGN KEY (codigoLocal) REFERENCES LOCALIZACAO (codigo),
    CONSTRAINT INFRACAO_AGENTE_FK FOREIGN KEY (agenteDeTransito) REFERENCES AGENTE (matriculaFuncional)
) ENGINE = InnoDB;
