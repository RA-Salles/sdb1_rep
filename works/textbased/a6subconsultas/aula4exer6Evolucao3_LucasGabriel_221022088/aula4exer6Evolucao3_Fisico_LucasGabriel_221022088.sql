--
-- -------- < aula4exer6Evolucao3 > --------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 05/05/2024
-- Autor(es) ..............: Arthur Heleno do Couto da Silva,
--                           Lucas Martins Gabriel
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula4exer6Evolucao3
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
-- 
-- Ultimas Alteracoes
--   06/05/2024 => Adição de if not exists na criação da base de dados
--   06/05/2024 => Adição de ENGINE = InnoDB em todas as tabelas
--   13/05/2024 => Remoção das tabelas endereco e posicaoGeografica
--   15/05/2024 => Correção do auto_increment e adição de UNIQUE para 
--                 telefone e LOCALIZACAO
--              => Definindo comportamento das chaves estrangeiras (FK)
-- ---------------------------------------------------------

-- BASE DE DADOS
CREATE DATABASE 
  IF NOT EXISTS aula4exer6Evolucao3;

USE aula4exer6Evolucao3;


-- TABELAS
CREATE TABLE PROPRIETARIO (
	cpfProprietario		DECIMAL(11)	  NOT NULL,
	nomeProprietario	VARCHAR(60)	  NOT NULL,
	sexo				ENUM('M','F') NOT NULL,
	dataNascimento		DATE		  NOT NULL,
	logradouro			VARCHAR(20)   NOT NULL,
    numero				DECIMAL(5)    NOT NULL,
    bairro				VARCHAR(20)   NOT NULL,
    cidade				VARCHAR(20)   NOT NULL,
    estado				CHAR(2)       NOT NULL,
    complemento			VARCHAR(20),
    CONSTRAINT PROPRIETARIO_PK PRIMARY KEY (cpfProprietario)
) ENGINE = InnoDB;

CREATE TABLE telefone (
	telefone			DECIMAL(15)	  NOT NULL,
    cpfProprietario		DECIMAL(11)   NOT NULL,
	CONSTRAINT telefone_PROPRIETARIO_FK FOREIGN KEY (cpfProprietario) 
	  REFERENCES PROPRIETARIO (cpfProprietario)
	    ON DELETE CASCADE
	    ON UPDATE CASCADE,
	CONSTRAINT telefone_telefone_cpfProprietario_UK UNIQUE (telefone, cpfProprietario)
)ENGINE = InnoDB;

CREATE TABLE CATEGORIA (
	codCategoria				INT(2)    		NOT NULL AUTO_INCREMENT,
	nomeCategoria				VARCHAR(20)	  	NOT NULL,
    CONSTRAINT CATEGORIA_PK PRIMARY KEY (codCategoria)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE MODELO (
	codModelo				INT(6)    		NOT NULL AUTO_INCREMENT,
	nomeModelo				VARCHAR(20)   	NOT NULL,
    CONSTRAINT MODELO_PK PRIMARY KEY (codModelo)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE VEICULO (
	placa				CHAR(7)			NOT NULL,
	chassi				CHAR(17)	  	NOT NULL,
	corPredominante		VARCHAR(15)	  	NOT NULL,
    codModelo			INT(6)    		NOT NULL,
    codCategoria		INT(2)    		NOT NULL,
	anoDeFabricacao		DECIMAL(4)    	NOT NULL,
	cpfProprietario		DECIMAL(11)	  	NOT NULL,
    CONSTRAINT VEICULO_PK PRIMARY KEY (placa),
	CONSTRAINT VEICULO_chassi_UK UNIQUE (chassi),
	CONSTRAINT VEICULO_MODELO_FK FOREIGN KEY (codModelo) 
	  REFERENCES MODELO (codModelo)
	    ON DELETE RESTRICT
	    ON UPDATE RESTRICT,
	CONSTRAINT VEICULO_CATEGORIA_FK FOREIGN KEY (codCategoria) 
	  REFERENCES CATEGORIA (codCategoria)
	    ON DELETE RESTRICT
	    ON UPDATE RESTRICT,
	CONSTRAINT VEICULO_PROPRIETARIO_FK FOREIGN KEY (cpfProprietario)
	  REFERENCES PROPRIETARIO (cpfProprietario)
	    ON DELETE RESTRICT
	    ON UPDATE RESTRICT
)ENGINE = InnoDB;

CREATE TABLE TIPOINFRACAO (
	codInfracao			INT(4)    		NOT NULL AUTO_INCREMENT,
	descricaoInfracao	VARCHAR(100)  	NOT NULL,
	valorMulta			DECIMAL(8,2)  	NOT NULL,
    CONSTRAINT TIPOINFRACAO_PK PRIMARY KEY (codInfracao)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE LOCALIZACAO (
	codLocal			INT(6)    		NOT NULL AUTO_INCREMENT,
	velocidadePermitida	DECIMAL(3)    	NOT NULL,
	latitude			VARCHAR(10)   	NOT NULL,
    longitude			VARCHAR(10)   	NOT NULL,
    CONSTRAINT LOCALIZACAO_PK PRIMARY KEY (codLocal),
	CONSTRAINT LOCALIZACAO_latitude_longitude_UK UNIQUE (latitude, longitude)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE AGENTE (
	matriculaAgente		INT(10)   		NOT NULL AUTO_INCREMENT,
	nomeAgente			VARCHAR(60)   	NOT NULL,
	dataContratacao		DATE          	NOT NULL,
    CONSTRAINT AGENTE_PK PRIMARY KEY (matriculaAgente)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE INFRACAO (
	placa				CHAR(7)    	NOT NULL, 
	dataHora			DATETIME	NOT NULL,
	codInfracao			INT(4)		NOT NULL,
	codLocal			INT(6)		NOT NULL,
	matriculaAgente		INT(10)		NOT NULL,
    velocidadeAferida	DECIMAL(3),
    CONSTRAINT INFRACAO_PK PRIMARY KEY (placa, dataHora, codInfracao),
	CONSTRAINT INFRACAO_VEICULO_FK FOREIGN KEY (placa) 
	  REFERENCES VEICULO (placa)
	    ON DELETE RESTRICT
	    ON UPDATE RESTRICT,
	CONSTRAINT INFRACAO_TIPOINFRACAO_FK FOREIGN KEY (codInfracao) 
	  REFERENCES TIPOINFRACAO (codInfracao)
        ON DELETE RESTRICT
	    ON UPDATE RESTRICT,
	CONSTRAINT INFRACAO_LOCALIZACAO_FK FOREIGN KEY (codLocal) 
	  REFERENCES LOCALIZACAO (codLocal)
	    ON DELETE RESTRICT
	    ON UPDATE RESTRICT,
    CONSTRAINT INFRACAO_AGENTE_FK FOREIGN KEY (matriculaAgente) 
	  REFERENCES AGENTE (matriculaAgente)
	    ON DELETE RESTRICT
	    ON UPDATE RESTRICT
) ENGINE = InnoDB;
