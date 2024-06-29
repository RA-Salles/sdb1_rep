-- ---------------------   << Trabalho Final - Salão de Festas (Tema 2)  >>   ---------------------
--
--                                   SCRIPT DE POPULA (DDL)                                   
-- 
-- Data Criacao ...........: 17/06/2024
-- Autor(es) ..............: Paulo Andre Valadão de Brito Filho
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: TF2_PauloFilho
-- 
-- 
-- PROJETO => 01 Base de Dados
--         => 13 Tabelas
-- 
-- --------------------------------------------------------------------------------------------


USE TF2_PauloFilho;

-- Criar usuários e perfis
-- Perfil Administrador
CREATE USER 'admin_user1'@'localhost' IDENTIFIED BY 'password123';
CREATE USER 'admin_user2'@'localhost' IDENTIFIED BY 'password123';

GRANT ALL PRIVILEGES ON TF2_PauloFilho.* TO 'admin_user1'@'localhost';
GRANT ALL PRIVILEGES ON TF2_PauloFilho.* TO 'admin_user2'@'localhost';

-- Perfil Usuário Comum
CREATE USER 'common_user1'@'localhost' IDENTIFIED BY 'password123';
CREATE USER 'common_user2'@'localhost' IDENTIFIED BY 'password123';

GRANT SELECT, INSERT ON TF2_PauloFilho.* TO 'common_user1'@'localhost';
GRANT SELECT, INSERT ON TF2_PauloFilho.* TO 'common_user2'@'localhost';

-- Aplicar as mudanças
FLUSH PRIVILEGES;