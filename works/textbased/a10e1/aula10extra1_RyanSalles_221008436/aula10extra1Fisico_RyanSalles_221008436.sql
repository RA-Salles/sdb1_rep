-- -------- < aula10extra1 > --------
--
--                    SCRIPT DE CRIAÇÃO (FISICO)
--
-- Data Criacao ...........: 16/05/2024
-- Autor(es) ..............: Ryan Salles
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula10extra1
--
-- 
-- Ultimas Alteracoes
--  Adiciona criação da db e tabelas
--  Adiciona constraints
--  
-- ---------------------------------------------------------

create database aula10extra1

use aula10extra1

CREATE TABLE ESTADO(
    sigla VARCHAR(2) NOT NULL,
    nome  VARCHAR(20),
    CONSTRAINT ESTADO_PK PRIMARY KEY (sigla),
    CONSTRAINT ESTADO_UK UNIQUE (nome)
);

CREATE TABLE CIDADE(
        codigo INT(5),
        nome VARCHAR(50),
        sigla VARCHAR(2),
        habitantes BIGINT,
    CONSTRAINT CIDADE_PK PRIMARY KEY(codigo),
    CONSTRAINT CIDADE_ESTADO_FK FOREIGN KEY (sigla) REFERENCES ESTADO(sigla),
    CONSTRAINT CIDADE_UK UNIQUE (nome)
);


