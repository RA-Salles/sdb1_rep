-- -------- Aula 6 Exercicio 4 Evolucao 2 --------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 17/06/2024
-- Autor(es) ..............: Caio Rodrigues, corrigido por Ryan Salles
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula6exer4evolucao2
--
-- PROJETO => 01 Base de Dados
--         => 05 Tabelas
-- 		   => 2 roles (perfis)
--         => 4 usuarios
-- 		   => 3 consultas
-- 		   => 1 view
-- 
-- Ultimas Alteracoes
--   28/05/2024 => Primeira versao BD
-- 	 17/06/24 => Alterações de atributos e restrições; criação de nova tabela localizacao.
--

CREATE DATABASE IF NOT EXISTS aula6exer4evolucao2;

USE aula6exer4evolucao2;

CREATE TABLE EMPREGADO (
    matriculaEmpregado VARCHAR(32) PRIMARY KEY,
    salario FLOAT NOT NULL,
    numero VARCHAR(3) NOT NULL,
    bairro VARCHAR(128) NOT NULL,
    rua VARCHAR(128) NOT NULL,
    nome VARCHAR(256) NOT NULL,
    sexo ENUM('M', 'F') NOT NULL,
    dataNascimento DATE NOT NULL,
    matriculaSupervisor VARCHAR(32) NOT NULL,
    CONSTRAINT EMPREGADO_SUPERVISOR_FK FOREIGN KEY (matriculaSupervisor) REFERENCES EMPREGADO(matriculaEmpregado) ON DELETE RESTRICT ON UPDATE CASCADE
) engine = InnoDB;

CREATE TABLE DEPENDENTE (
	idDependente BIGINT PRIMARY KEY,
    grauLigacao VARCHAR(128) NOT NULL,
    dataNascimento DATE NOT NULL,
    sexo ENUM('M', 'F') NOT NULL,
    nome VARCHAR(256) NOT NULL,
    matriculaEmpregado VARCHAR(32) NOT NULL,
    CONSTRAINT DEPENDENTE_EMPREGADO_FK FOREIGN KEY (matriculaEmpregado) REFERENCES EMPREGADO (matriculaEmpregado) ON DELETE CASCADE
)engine = InnoDB;

CREATE TABLE DEPARTAMENTO (
    idDepartamento BIGINT PRIMARY KEY,
    nome VARCHAR(128) NOT NULL,
    matriculaEmpregado VARCHAR(32),
    dataAssumiu DATE,
    CONSTRAINT DEPARTAMENTO_EMPREGADO_FK FOREIGN KEY (matriculaEmpregado) REFERENCES EMPREGADO(matriculaEmpregado) ON DELETE RESTRICT
)engine = InnoDB;



CREATE TABLE PROJETO (
    idProjeto BIGINT PRIMARY KEY,
    nome VARCHAR(128) NOT NULL,
    rua VARCHAR(128) NOT NULL,
    numero VARCHAR(3) NOT NULL,
    bairro VARCHAR(128) NOT NULL,
    idDepartamento BIGINT NOT NULL,
    CONSTRAINT PROJETO_EMPREGADO_FK FOREIGN KEY (idDepartamento) REFERENCES DEPARTAMENTO(idDepartamento) ON DELETE RESTRICT ON UPDATE CASCADE
)engine = InnoDB;

CREATE TABLE LOCALIZACAO (
	idLocalizacao BIGINT PRIMARY KEY ,
    rua VARCHAR(32) NOT NULL,
    bairro VARCHAR(128) NOT NULL,
    numero INT NOT NULL,
    idDepartamento BIGINT NOT NULL,
    CONSTRAINT LOCALIZACAO_DEPARTAMENTO_FK FOREIGN KEY (idDepartamento) REFERENCES DEPARTAMENTO(idDepartamento) ON DELETE CASCADE ON UPDATE CASCADE
)engine = InnoDB;

CREATE TABLE trabalha (
    idProjeto BIGINT NOT NULL,
    matriculaEmpregado VARCHAR(32) NOT NULL,
    horasSemanais INT NOT NULL,
    CONSTRAINT trabalha_PROJETO_FK FOREIGN KEY (idProjeto) REFERENCES PROJETO(idProjeto) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT trabalha_EMPREGADO_FK FOREIGN KEY (matriculaEmpregado) REFERENCES EMPREGADO(matriculaEmpregado) ON DELETE CASCADE ON UPDATE CASCADE
)engine = InnoDB;
