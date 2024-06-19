-- -------- < aula10extra1 > --------
--
--                    SCRIPT DE CONSULTA
--
-- Data Criacao ...........: 16/05/2024
-- Autor(es) ..............: Ryan Salles
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula10extra1
--
-- 
-- Ultimas Alteracoes
--  Adiciona consultas requisitadas
-- ---------------------------------------------------------

--Consulta 1: projeção sigla-nome de sp e df (estado)
SELECT sigla, nome FROM ESTADO WHERE sigla = 'SP' OR sigla = 'DF';

--Consulta 2: projeção sigla-nome rj,df e go (cidade)
SELECT sigla, nome FROM CIDADE WHERE sigla = 'RJ' OR sigla = 'DF' OR sigla = 'GO';

--Consulta 3: projeção de todas as cidades do primeiro estado cadastrado com nome cidade, nome estado e sigla.
SELECT ESTADO.nome, CIDADE.nome, CIDADE.sigla FROM ESTADO, CIDADE WHERE CIDADE.sigla = 'DF' AND ESTADO.sigla = 'DF';

--Consulta 4: projeção nome-habitantes-nomeEstado-nomeCidade de GO com orderby CIDADE.nome
SELECT ESTADO.nome, CIDADE.sigla, CIDADE.nome, CIDADE.habitantes FROM ESTADO, CIDADE WHERE CIDADE.sigla = 'GO' ORDER BY CIDADE.nome DESC;


