-- -------- < aula10extra1 > --------
--
--                    SCRIPT DE POPULAÇÃO
--
-- Data Criacao ...........: 16/05/2024
-- Autor(es) ..............: Ryan Salles
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula10extra1
--
-- 
-- Ultimas Alteracoes
--  Adição de 5 valores para estado e 10 valores para cidade
--  
-- ---------------------------------------------------------

use aula10extra1

--5 inserts na tabela estado
INSERT INTO ESTADO VALUES('DF', 'DISTRITO FEDERAL');
INSERT INTO ESTADO VALUES('SP', 'SAO PAULO');
INSERT INTO ESTADO VALUES('AM', 'AMAZONAS');
INSERT INTO ESTADO VALUES('AP', 'AMAPA');
INSERT INTO ESTADO VALUES('GO', 'GOIAS');


--10 inserts na tabela cidade
--codigo nome sigla habitantes
--DF
INSERT INTO CIDADE VALUES(01, 'BRASILIA', 'DF', 2817381);
INSERT INTO CIDADE VALUES(02, 'SOBRADINHO', 'DF', 69363);
--SP
INSERT INTO CIDADE VALUES(03, 'SAO PAULO', 'SP', 11451999);
INSERT INTO CIDADE VALUES(04, 'GUARULHOS', 'SP', 1291771 );
--AM
INSERT INTO CIDADE VALUES(05, 'MANAUS', 'AM', 2063547);
INSERT INTO CIDADE VALUES(06, 'ITACOATIRA', 'AM', 103598);
--AP
INSERT INTO CIDADE VALUES(07, 'MACAPA', 'AP', 442933);
INSERT INTO CIDADE VALUES(08, 'SANTANA', 'AP', 107618);
--GO
INSERT INTO CIDADE VALUES(09, 'GOIANIA', 'GO', 1437237);
INSERT INTO CIDADE VALUES(10, 'FORMOSA', 'GO', 125705);
