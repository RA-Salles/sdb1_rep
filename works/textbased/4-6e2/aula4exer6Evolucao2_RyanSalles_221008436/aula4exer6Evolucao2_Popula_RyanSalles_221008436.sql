-- -------- < aula4exer6evolucao2 > --------
--
--                    SCRIPT DE POPULAÇÃO
--
-- Data Criacao ...........: 01/05/2024
-- Autor(es) ..............: Larissa de Jesus Vieira
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: Detran
--
-- 
-- Ultimas Alteracoes
--  Alteracao nos tipos de dados
--
-- ---------------------------------------------------------

INSERT INTO PROPRIETARIO VALUES( "05630678108", "Ryan Salles", "Gama", "Brasilia", "DF", "73030037", "M", '2003-09-19', 20);
INSERT INTO PROPRIETARIO VALUES( "26264481092", "Kaleb Silva", "Planaltina", "Brasilia", "DF", "73358420", "M", '1994-08-14', 30);
INSERT INTO PROPRIETARIO VALUES( "41401184235", "Jahne Doe", "Cruzeiro Novo", "Brasilia", "DF", "70658375", "F", '2003-04-23', 21);
INSERT INTO telefone 	 VALUES("05630678108", "6134368743");
INSERT INTO telefone	 VALUES("26264481092", "6135497420");
INSERT INTO telefone 	 VALUES("41401184235", "61997425928");
INSERT INTO MODELO 		 VALUES( 01, "F250 TROPICAMPO");
INSERT INTO MODELO  	 VALUES(02, "EcoSport SE");
INSERT INTO MODELO 		 VALUES(03, "F-1000 XLT");
INSERT INTO CATEGORIA 	 VALUES( 01, "CAMINHONETE");
INSERT INTO CATEGORIA 	 VALUES( 02, "SUV");
INSERT INTO CATEGORIA 	 VALUES( 03, "SEDAN");
INSERT INTO VEICULO 	 VALUES( "JHC8087", "8sbUj9Zr83AKw7228", "Azul", 2007, 01, 01, "05630678108");
INSERT INTO VEICULO  	 VALUES( "JKP0472", "935fCGPKugg9W0599", "Laranja", 2013, 02, 02, "26264481092");
INSERT INTO VEICULO 	 VALUES( "JGE5750", "8hxWpsFe6sM2X7308", "Dourado", 1996, 03, 01,  "41401184235");
INSERT INTO LUGAR        VALUES(01, 15, 47, 80);
INSERT INTO LUGAR        VALUES(02, 15, 47, 80);
INSERT INTO LUGAR        VALUES(03, 16, 48, 60);
INSERT INTO AGENTE		 VALUES(01, "Joao Pereira", '2010-03-04', 177);
INSERT INTO AGENTE 		 VALUES(02, "Carlos Mydia Merlin", '2015-08-22', 112);
INSERT INTO AGENTE       VALUES(03, "Matheus do Egito", '2024-03-15', 1);
INSERT INTO INFRACAO     VALUES('20120618 10:34:13 AM', 0, 01 , 01 , 01 , "JHC8087");
INSERT INTO INFRACAO     VALUES('20150830 03:50:17 PM', 0, 02 , 01 , 01 , "JHC8087");
INSERT INTO INFRACAO     VALUES('20180914 05:28:30 AM', 0, 03 , 01 , 01 , "JHC8087");
INSERT INTO MULTA        VALUES(01, "Estacionado em lugar inadequado", 500.00);
INSERT INTO MULTA        VALUES(02, "Estacionado em lugar inadequado", 500.00);
INSERT INTO MULTA        VALUES(03, "Estacionado em lugar inadequado", 500.00);
