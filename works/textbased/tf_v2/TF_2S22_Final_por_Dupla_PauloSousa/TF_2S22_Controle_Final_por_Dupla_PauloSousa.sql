-- --------------------- Tema 2 - Eventos ---------------------
-- SCRIPT DE CRIAÇÃO DE USUÁRIOS (DDL)
-- Data Criacao ...........: 13/06/2024
-- Autor(es) ..............: PauloSousa
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF_2S22_PAULO_SOUSA
--
-- PROJETO => 03 Perfis (role)
-- => 06 Usuarios
-- Ultimas Alteracoes
-- 13/06/2024 => Criacao do script com 3 roles e 3 usuarios
-- 17/06/2024 => Modificação das permissões e adição de 3 usuarios usuarios
-- 17/06/2024 => adicionando um grant de INSERT, DELETE, UPDATE no fornecedor para funcionarios

USE TF_2S22_PAULO_SOUSA;

-- Criação do perfil 'dono' com permissões completas
CREATE ROLE 'dono';
GRANT ALL PRIVILEGES ON tf_2s22_paulo_sousa.* TO 'dono';

-- Usuários com perfil 'dono'
CREATE USER 'SenhorJonatas'@'localhost' IDENTIFIED BY 'Jonatas2024';
GRANT 'dono' TO 'SenhorJonatas'@'localhost';

CREATE USER 'Vandor'@'localhost' IDENTIFIED BY 'vandor2024';
GRANT 'dono' TO 'Vandor'@'localhost';

-- Criação do perfil 'funcionario' com permissões específicas
CREATE ROLE 'funcionario';
GRANT SELECT ON tf_2s22_paulo_sousa.* TO 'funcionario';
GRANT INSERT, DELETE, UPDATE ON tf_2s22_paulo_sousa.fornecedor TO 'funcionario';
GRANT INSERT, DELETE, UPDATE ON tf_2s22_paulo_sousa.BUFFET TO 'funcionario';

-- Usuários com perfil 'funcionario'
CREATE USER 'PauloVictor'@'localhost' IDENTIFIED BY 'PV2024';
GRANT 'funcionario' TO 'PauloVictor'@'localhost';

CREATE USER 'AlineSayuri'@'localhost' IDENTIFIED BY 'AS2024';
GRANT 'funcionario' TO 'AlineSayuri'@'localhost';

-- Criação do perfil 'gerente' com permissões adicionais
CREATE ROLE 'gerente';
GRANT 'funcionario' TO 'gerente';
GRANT INSERT, SELECT, DELETE, UPDATE ON tf_2s22_paulo_sousa.* TO 'gerente';


-- Usuários com perfil 'gerente'
CREATE USER 'LuizRibeiro'@'localhost' IDENTIFIED BY 'LR2024';
GRANT 'gerente' TO 'LuizRibeiro'@'localhost';

CREATE USER 'LauraJunior'@'localhost' IDENTIFIED BY 'LJ2024';
GRANT 'gerente' TO 'LauraJunior'@'localhost';

FLUSH PRIVILEGES;

-- Verificar permissões do usuário SenhorJonatas
SHOW GRANTS FOR 'SenhorJonatas'@'localhost';

-- Verificar permissões do usuário Vandor
SHOW GRANTS FOR 'Vandor'@'localhost';

-- Verificar permissões do usuário PauloVictor
SHOW GRANTS FOR 'PauloVictor'@'localhost';

-- Verificar permissões do usuário AlineSayuri
SHOW GRANTS FOR 'AlineSayuri'@'localhost';

-- Verificar permissões do usuário LuizRibeiro
SHOW GRANTS FOR 'LuizRibeiro'@'localhost';

-- Verificar permissões do usuário LauraJunior
SHOW GRANTS FOR 'LauraJunior'@'localhost';