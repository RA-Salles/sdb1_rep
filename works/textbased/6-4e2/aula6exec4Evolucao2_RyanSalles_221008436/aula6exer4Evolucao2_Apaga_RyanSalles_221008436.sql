-- -------- Aula 6 Exercicio 4 Evolucao 2 --------
--
--                    SCRIPT DE DELECAO
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
-- Ultimas alterações:
-- 		17/06/24 -> adição de tabela nova para ser apagada e set foreign key checks para evitar possíveis erros.
-- 
-- ----------------------------------------------------------
USE aula6exer4evolucao2;

SET foreign_key_checks = 0; -- remember to update it back to 1 at the end!

DROP TABLE trabalha;
DROP TABLE LOCALIZACAO;
DROP TABLE PROJETO;
DROP TABLE DEPARTAMENTO;
DROP TABLE DEPENDENTE;
DROP TABLE EMPREGADO;

SET foreign_key_checks = 1; -- DO NOT COMMENT THIS!