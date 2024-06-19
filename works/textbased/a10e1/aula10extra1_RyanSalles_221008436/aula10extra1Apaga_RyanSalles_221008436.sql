-- -------- < aula10extra1 > --------
--
--                    SCRIPT DE DESTRUIÇÃO (NUKE)
--
-- Data Criacao ...........: 16/05/2024
-- Autor(es) ..............: Ryan Salles
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula10extra1
--
-- 
-- Ultimas Alteracoes
--  Adiciona remoção de constraints
--  Adiciona remoção de tabelas
-- ---------------------------------------------------------

--garantindo que a database será a aula10extra1
use aula10extra1

--ALTERANDO TABELAS PARA TIRAR CONSTRAINTS -> EVITA QUE A DATABASE NÃO PERMITA APAGAR AS TABELAS
ALTER TABLE ESTADO DROP CONSTRAINT ESTADO_PK
ALTER TABLE ESTADO DROP CONSTRAINT ESTADO_UK
ALTER TABLE CIDADE DROP CONSTRAINT CIDADE_PK
ALTER TABLE CIDADE DROP CONSTRAINT CIDADE_ESTADO_FK
ALTER TABLE CIDADE DROP CONSTRAINT CIDADE_UK

--E agora podemos remover com mais leveza
DROP TABLE ESTADO
DROP TABLE CIDADE

