-- -------- < TRABALHO FINAL - TEMA 2 - BUFFET > --------
--
--                    SCRIPT DE CONTROLE 
--
-- Data Criacao ...........: 16/06/2024
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
--      16/06/24
--          * Criação de 4 roles e 8 usuários 
-- ---------------------------------------------------------
CREATE DATABASE IF NOT EXISTS TF_2S3_ryansalles; -- garante que o script vai rodar caso o script físico nunca tenha sido rodado

use TF_2S3_ryansalles;

-- Acesso máximo -> mestre
CREATE ROLE IF NOT EXISTS MESTRE;
-- Acesso submáximo -> adm
CREATE ROLE IF NOT EXISTS ADM;
-- Acesso médio -> comercial
CREATE ROLE IF NOT EXISTS COMERCIAL;
-- Acesso mínimo -> contador
CREATE ROLE IF NOT EXISTS CONTADOR;


-- configuração das roles
GRANT ALL ON tf2.* TO MESTRE;

GRANT CREATE, DELETE, UPDATE, DROP, SELECT ON tf2.* TO ADM;

GRANT CREATE, DELETE, UPDATE, SELECT ON tf2.* TO COMERCIAL;

GRANT SELECT ON tf2.* TO CONTADOR WITH GRANT OPTION;

-- criação de usuários

CREATE USER IF NOT EXISTS 'superuser1' 
	IDENTIFIED BY 'BUFF&TSUP3RUS&R1ONE'
    DEFAULT ROLE MESTRE
    PASSWORD EXPIRE INTERVAL 30 DAY;

CREATE USER IF NOT EXISTS 'BigMaster'
	IDENTIFIED BY 'BUFF&TB1Gm4zT3R'
    DEFAULT ROLE MESTRE
    PASSWORD EXPIRE INTERVAL 30 DAY;
    
CREATE USER IF NOT EXISTS 'john.silveira'
	IDENTIFIED BY 'amominhafamilia'
    DEFAULT ROLE ADM
    PASSWORD EXPIRE INTERVAL 90 DAY;
    
CREATE USER IF NOT EXISTS 'jailson.mendes'
	IDENTIFIED BY 'margarinadelicia'
	DEFAULT ROLE ADM 
    PASSWORD EXPIRE INTERVAL 90 DAY;
    
CREATE USER IF NOT EXISTS 'grande.silva'
	IDENTIFIED BY 'oGrandeSilva'
    DEFAULT ROLE COMERCIAL
    PASSWORD EXPIRE INTERVAL 180 DAY;
    
CREATE USER IF NOT EXISTS 'hot.coldman'
	IDENTIFIED BY 'apreciadordenukes128'
    DEFAULT ROLE COMERCIAL
    PASSWORD EXPIRE INTERVAL 180 DAY;
    
CREATE USER IF NOT EXISTS 'mini.johnson'
	IDENTIFIED BY 'microjohnsonmuitpequenominusculo'
    DEFAULT ROLE CONTADOR
    PASSWORD EXPIRE INTERVAL 180 DAY;

CREATE USER IF NOT EXISTS 'jackson.pollock'
	IDENTIFIED BY 'baguncanatelasimplesmenteumaconfusaoabsurda'
    DEFAULT ROLE CONTADOR
    PASSWORD EXPIRE INTERVAL 180 DAY;


