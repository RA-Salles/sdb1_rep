-- -------- < aula4exer6evolucao3 > --------
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

use Detran;

CREATE TABLE VEICULO (
    placa VARCHAR(8) PRIMARY KEY NOT NULL,
    chassi VARCHAR(18) NOT NULL,
    corPredominante VARCHAR(15) NOT NULL,
    anoFabricacao INT(4) NOT NULL,
    FK_MODELO_codModelo INT(6) NOT NULL,
    FK_CATEGORIA_codCategoria INT(2) NOT NULL,
    FK_PROPRIETARIO_cpfProprietario BIGINT NOT NULL
);

CREATE TABLE PROPRIETARIO (
    cpfProprietario BIGINT PRIMARY KEY NOT NULL,
    nomeProprietario VARCHAR(60) NOT NULL,
    cep BIGINT NOT NULL,
    estado VARCHAR(2) NOT NULL,
    bairro VARCHAR(20) NOT NULL,
    cidade VARCHAR(20) NOT NULL,
    dtNascimento DATETIME NOT NULL,
    sexo CHAR('M', 'F') NOT NULL,
    FK_TELEFONES_idTelefones BIGINT NOT NULL
);

CREATE TABLE MODELO (
    codModelo INT(6) PRIMARY KEY NOT NULL,
    nomeModelo VARCHAR(20) NOT NULL
);

CREATE TABLE CATEGORIA (
    codCategoria INT(2) PRIMARY KEY NOT NULL,
    nomeCategoria VARCHAR(20) NOT NULL
);

CREATE TABLE MULTA (
    codInfracao INT(4) PRIMARY KEY NOT NULL,
    descricaoInfracao VARCHAR(100) NOT NULL,
    valorMulta FLOAT NOT NULL
);

CREATE TABLE INFRACAO (
    dtHora DATETIME PRIMARY KEY NOT NULL,
    velocidadeAferida INT(3) NOT NULL,
    FK_MULTA_codInfracao INT(4) NOT NULL,
    FK_LOCAL_codLocal INT(6) NOT NULL,
    FK_AGENTE_matriculaAgente BIGINT NOT NULL,
    FK_VEICULO_placa VARCHAR(8) NOT NULL
);

CREATE TABLE LOCALIDADE (
    codLocal INT(6) PRIMARY KEY NOT NULL,
    latitude DOUBLE NOT NULL,
    longitude DOUBLE NOT NULL,
    velocidadePermitida INT(3) NOT NULL
);

CREATE TABLE AGENTE (
    matriculaAgente BIGINT PRIMARY KEY NOT NULL,
    nomeAgente VARCHAR(60) NOT NULL,
    dtContratacao DATETIME NOT NULL
);

CREATE TABLE TELEFONES (
    idTelefones BIGINT PRIMARY KEY NOT NULL,
    telefone VARCHAR(15) NOT NULL
);
 
ALTER TABLE VEICULO ADD CONSTRAINT FK_VEICULO_2
    FOREIGN KEY (FK_MODELO_codModelo)
    REFERENCES MODELO (codModelo)
    ON DELETE CASCADE;
 
ALTER TABLE VEICULO ADD CONSTRAINT FK_VEICULO_3
    FOREIGN KEY (FK_CATEGORIA_codCategoria)
    REFERENCES CATEGORIA (codCategoria)
    ON DELETE CASCADE;
 
ALTER TABLE VEICULO ADD CONSTRAINT FK_VEICULO_4
    FOREIGN KEY (FK_PROPRIETARIO_cpfProprietario)
    REFERENCES PROPRIETARIO (cpfProprietario)
    ON DELETE RESTRICT;
 
ALTER TABLE PROPRIETARIO ADD CONSTRAINT FK_PROPRIETARIO_2
    FOREIGN KEY (FK_TELEFONES_idTelefones)
    REFERENCES TELEFONES (idTelefones);
 
ALTER TABLE INFRACAO ADD CONSTRAINT FK_INFRACAO_2
    FOREIGN KEY (FK_MULTA_codInfracao)
    REFERENCES MULTA (codInfracao)
    ON DELETE RESTRICT;
 
ALTER TABLE INFRACAO ADD CONSTRAINT FK_INFRACAO_3
    FOREIGN KEY (FK_LOCAL_codLocal)
    REFERENCES LOCALIDADE (codLocal)
    ON DELETE CASCADE;
 
ALTER TABLE INFRACAO ADD CONSTRAINT FK_INFRACAO_4
    FOREIGN KEY (FK_AGENTE_matriculaAgente)
    REFERENCES AGENTE (matriculaAgente)
    ON DELETE CASCADE;
 
ALTER TABLE INFRACAO ADD CONSTRAINT FK_INFRACAO_5
    FOREIGN KEY (FK_VEICULO_placa)
    REFERENCES VEICULO (placa)
    ON DELETE RESTRICT;
