-- -------- <Trabalho Final Tema 2 Sozinho 24> --------
--
--           SCRIPT DE CONTROLE (DDL)
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

 CREATE ROLE 'administrador';
 CREATE ROLE 'funcionario';
 CREATE ROLE 'possivelCliente';
 CREATE ROLE 'cliente';
 
 CREATE USER 'jonathan' IDENTIFIED BY '@@basedadoseventosadmin';
 CREATE USER 'rafael' IDENTIFIED BY '@@basedados';
 CREATE USER 'gabriel' IDENTIFIED BY 'clientegabriel@';
 CREATE USER 'camila' IDENTIFIED BY 'clientecamila@';
 
 GRANT ALL PRIVILEGES ON * TO admnistrador;
 GRANT administrador TO jonathan;
 
 GRANT SELECT, INSERT, ALTER ON * TO funcionario;
 GRANT funcionario TO lucas;
 
 GRANT SELECT, INSERT ON PESSOA  TO 'lead';
 GRANT SELECT, INSERT ON CLIENTE TO 'lead';
 GRANT SELECT, INSERT ON EMPRESA TO 'lead';
 GRANT SELECT, INSERT ON telefonePessoa TO 'lead';
 
 GRANT SELECT, INSERT ON PESSOA TO 'cliente';
 GRANT SELECT, INSERT ON CLIENTE TO 'cliente';
 GRANT SELECT, INSERT ON EMPRESA TO 'cliente'; 
 GRANT SELECT, INSERT ON EVENTO TO 'cliente';
 GRANT SELECT, INSERT ON CONTRATO TO 'cliente';
 GRANT SELECT, INSERT ON telefonePessoa TO 'cliente';
 
 GRANT possivelCliente TO cliente1;
 GRANT cliente TO cliente2;