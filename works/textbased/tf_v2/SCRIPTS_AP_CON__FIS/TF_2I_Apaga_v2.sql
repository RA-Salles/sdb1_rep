-- -------- < TRABALHO FINAL - TEMA 2 - BUFFET > --------
--
--                    SCRIPT DE DELECAO
--
-- Data Criacao ...........: 23/06/2024
-- Autor(es) ..............: Paulo Filho, Paulo Sousa, Ryan Salles, Victor Guimaraes
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF_2I
--
-- 
-- PROJETO => 01 base de dados 
--         => 19 tabelas
-- 		   => 04 Perfis (role)
--         => 12 Usuários
--  
-- Ultimas Alterações
--      16/06/24
--          * Criação do script de deleção para correta remoção de todos 
-- 				os objetos (tabelas, usuários, roles) do banco. 
-- ---------------------------------------------------------

use TF_2I;

SET foreign_key_checks = 0;

DROP TABLE IF EXISTS CONTRATO;
DROP TABLE IF EXISTS FORNECEDORMATERIAPRIMA;
DROP TABLE IF EXISTS ALIMENTOMATERIAPRIMA;
DROP TABLE IF EXISTS EVENTOALIMENTO;
DROP TABLE IF EXISTS TELEFONEFORNECEDOR;
DROP TABLE IF EXISTS TELEFONEPESSOA;
DROP TABLE IF EXISTS FREELANCER;
DROP TABLE IF EXISTS COLABORADOREVENTO;
DROP TABLE IF EXISTS EVENTO;
DROP TABLE IF EXISTS MATERIAPRIMA;
DROP TABLE IF EXISTS ALIMENTO;
DROP TABLE IF EXISTS FORNECEDOR;
DROP TABLE IF EXISTS FICHADO;
DROP TABLE IF EXISTS COLABORADOR;
DROP TABLE IF EXISTS EMPRESA;
DROP TABLE IF EXISTS CLIENTE;
DROP TABLE IF EXISTS FUNCAOCOLABORADOR;
DROP TABLE IF EXISTS PESSOA;
DROP TABLE IF EXISTS ENDERECO;

SET foreign_key_checks = 1;

DROP USER IF EXISTS 'superuser1'@'%';
DROP USER IF EXISTS 'BigMaster'@'%';
DROP USER IF EXISTS 'ultrauser'@'%';
DROP USER IF EXISTS 'john.silveira'@'%';
DROP USER IF EXISTS 'jailson.mendes'@'%';
DROP USER IF EXISTS 'michael.jackson'@'%';
DROP USER IF EXISTS 'grande.silva'@'%';
DROP USER IF EXISTS 'pequeno.silva'@'%';
DROP USER IF EXISTS 'hot.coldman'@'%';
DROP USER IF EXISTS 'mini.johnson'@'%';
DROP USER IF EXISTS 'big.johnson'@'%';
DROP USER IF EXISTS 'jackson.pollock'@'%';

DROP ROLE IF EXISTS MESTRE, ADM, COMERCIAL, CONTADOR;