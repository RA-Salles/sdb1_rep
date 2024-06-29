-- -------- <Trabalho Final Tema 2 Sozinho 24> --------
--
--           SCRIPT DE DELEÇÃO (DML)
--
-- DATA DE CRIAÇÃO: 16/06/2024
-- BANCO DE DADOS.: MySQL 8.4
-- AUTOR..........: Victor Hugo Rodrigues Guimarães, 211063256
-- BASE DE DADOS..: TF_S24_victorguimaraes
--
-- PROJETO => 01 base de dados 
--         => 25 tabelas
-- 		   => 02 Perfis (role)
-- ------------------------------------

use TF_S24_victorguimaraes;

SET foreign_key_checks = 0;

DROP TABLE IF EXISTS fornece;
DROP TABLE compoe;
DROP TABLE serve;
DROP TABLE telefonePessoa;
DROP TABLE telefoneFornecedor;
DROP TABLE TRABALHO;
DROP TABLE CONTRATO;
DROP TABLE EVENTO;
DROP TABLE FREELANCER;
DROP TABLE FIXO;
DROP TABLE FUNCIONARIO;
DROP TABLE EMPRESA;
DROP TABLE CLIENTE;
DROP TABLE PESSOA;
DROP TABLE ITEM;
DROP TABLE FORNECEDOR;
DROP TABLE DECORACAO;
DROP TABLE MATERIAPRIMA;
DROP TABLE TIPOITEM;
DROP TABLE FORMAPAGAMENTO;
DROP TABLE CATEGORIA;
DROP TABLE INFRACAO;
DROP TABLE GRAUESCOLARIDADE;
DROP TABLE FUNCAO;
DROP TABLE ENDERECO;

SET foreign_key_checks = 1;

DROP USER IF EXISTS 'superuser1'@'%';
DROP USER IF EXISTS 'BigMaster'@'%';
DROP USER IF EXISTS 'john.silveira'@'%';
DROP USER IF EXISTS 'jailson.mendes'@'%';
DROP USER IF EXISTS 'grande.silva'@'%';
DROP USER IF EXISTS 'hot.coldman'@'%';
DROP USER IF EXISTS 'mini.johnson'@'%';
DROP USER IF EXISTS 'jackson.pollock'@'%';
DROP USER IF EXISTS 'ultrauser'@'%';
DROP USER IF EXISTS 'michael.jackson'@'%';
DROP USER IF EXISTS 'big.johnson'@'%';

DROP ROLE IF EXISTS MESTRE, ADM, COMERCIAL, CONTADOR;