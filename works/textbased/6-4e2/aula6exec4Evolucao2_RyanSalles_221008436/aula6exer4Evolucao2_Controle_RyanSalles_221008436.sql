-- ------- Aula 6 Exercicio 4 Evolucao 2--------
--
--                    SCRIPT DE CONTROLE
--
-- Data Criacao ...........: 28/05/2024
-- Autor(es) ..............: Caio Felipe Rocha Rodrigues, corrigido por Ryan Salles
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
-- 	 17/06/24 => criacao das roles e usuarios requisitados
-- ------------------------------------------------------
USE aula6exer4evolucao2;


create role if not exists administrador;
create role if not exists funcionario;

grant all on aula6exer4evolucao2.* to administrador;
grant select on aula6exer4evolucao2.* to funcionario;
grant insert on aula6exer4evolucao2.dependente to funcionario;

-- addbd com senha 123admin, superr com senha admsuperR
create user if not exists 'addbd' identified by '123admin' default role administrador;
create user if not exists 'superr' identified by 'admsuperR' default role administrador;

-- jose com senha usu123; anaM com senha mana2023

create user if not exists 'jose' identified by 'usu123' default role funcionario;
create user if not exists 'anaM' identified by 'mana2023' default role funcionario;



