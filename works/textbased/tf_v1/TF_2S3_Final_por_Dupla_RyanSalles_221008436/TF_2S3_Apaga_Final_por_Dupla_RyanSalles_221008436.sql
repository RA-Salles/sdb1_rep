-- -------- < TRABALHO FINAL - TEMA 2 - BUFFET > --------
--
--                    SCRIPT DE DELECAO (DDL)
--
-- Data Criacao ...........: 08/06/2024
-- Autor(es) ..............: Ryan Salles
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF_2S3_ryansalles
--
-- 
-- PROJETO => 01 Base de Dados
--         => 21 Tabelas
--         => 04 Perfis (role)
--         => 08 Usuarios
--  
-- Ultimas Alterações
--      08/06/24
--          * Criação do script V1
--          * adição de comando para ignorar CONSTRAINTS de FK durante a deleção das tabelas 
-- 		17/06/24
-- 			*adição de pedaço para apagar usuários e roles
-- ---------------------------------------------------------
USE TF_2S3_ryansalles;

SET foreign_key_checks = 0; -- added this so this bamf stops whining about "muh foreign key constraints" 

DROP TABLE IF EXISTS CLIENTE;
DROP TABLE IF EXISTS CONTRATO;
DROP TABLE IF EXISTS DEPARTAMENTO;
DROP TABLE IF EXISTS EMAILCLIENTE;
DROP TABLE IF EXISTS EMAILFORNECEDOR;
DROP TABLE IF EXISTS EMAILFREELANCER;
DROP TABLE IF EXISTS EMAILFUNCIONARIO;
DROP TABLE IF EXISTS EQUIPE;
DROP TABLE IF EXISTS EQUIPEFREELANCER;
DROP TABLE IF EXISTS FORNECEDOR;
DROP TABLE IF EXISTS FORNECIMENTO;
DROP TABLE IF EXISTS FREELANCER;
DROP TABLE IF EXISTS FUNCIONARIO;
DROP TABLE IF EXISTS INGREDIENTE;
DROP TABLE IF EXISTS MENU;
DROP TABLE IF EXISTS PRATO;
DROP TABLE IF EXISTS PRATOINGREDIENTE;
DROP TABLE IF EXISTS TELEFONECLIENTE;
DROP TABLE IF EXISTS TELEFONEFORNECEDOR;
DROP TABLE IF EXISTS TELEFONEFREELANCER;
DROP TABLE IF EXISTS TELEFONEFUNCIONARIO;

SET foreign_key_checks = 1; -- and fix it later so it doesn't MFU later execution of scripts.

DROP USER IF EXISTS 'superuser1'@'%' ;
DROP USER IF EXISTS 'BigMaster'@'%';
DROP USER IF EXISTS 'john.silveira'@'%';
DROP USER IF EXISTS 'jailson.mendes'@'%';
DROP USER IF EXISTS 'grande.silva'@'%';
DROP USER IF EXISTS 'hot.coldman'@'%';
DROP USER IF EXISTS 'mini.johnson'@'%';
DROP USER IF EXISTS 'jackson.pollock'@'%';

DROP ROLE IF EXISTS MESTRE, ADM, COMERCIAL, CONTADOR;

-- DROP DATABASE TF_2S3_ryansalles; -- Tirar esse do comentário para NUKAR a DATABASE :)


