-- -------- < TRABALHO FINAL - TEMA 2 - BUFFET > --------
--
--                    SCRIPT DE POPULACAO (DML)
--
-- Data Criacao ...........: 08/06/2024
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
--      08/06/24
--          * Criação do script v1 e adição de 5 tuplas para cada tabela
--          * Bugs de inserção duplicada e além do range desejado consertados.
-- ---------------------------------------------------------

use TF_2S3_ryansalles;

INSERT INTO CLIENTE VALUES ('100', 'João Silva'),
						   ('200', 'Carl Johnson'),
						   ('300', 'Carlos Bancleyton'),
                           ('31415', 'Archimedes de Siracusa'),
                           ('500', 'Mario Oliveira');

INSERT INTO EMAILCLIENTE VALUES ('joaosilva@yahoo.com', '100'),
								('carl_johnson@gmail.com', '200'),
								('bigcleyton@gmail.com', '300'),
                                ('31415@gmail.com', '31415'),
                                ('armario@hotmail.com', '500');
                                
INSERT INTO TELEFONECLIENTE VALUES ('3728189', '100'),
									('7382137','200'),
									('3721904', '300'),
                                    ('7481048','31415'), 
                                    ('3821930', '31415'), -- two phone numbers for archy to test if this table is accepting duplicate foreign keys, as it should
                                    ('3821830', '500');

INSERT INTO DEPARTAMENTO VALUES (1, 'Comercial'),
								(2, 'Marketing'),
                                (3, 'Contabilidade'),
                                (4, 'Executivo'),
                                (5, 'Presidencia');

INSERT INTO FUNCIONARIO VALUES ('600', 'Rattus Brandon', '312780321', '37128304', '73829104', 'Medio', 2),
							   ('700', 'Clark Claymore', '821930133', '85014838', '38129042', 'Superior', 4),
                               ('800', 'Hot ColdMan', '39210842', '328193321', '38291312', 'PhD', 3),
                               ('900', 'Kazuhira Miller', '382130321', '3821930321', '83921042', 'PhD', 3),
                               ('1000', 'Ace Ventura', '32910321', '328193123', '382193213', 'Superior', 1);

INSERT INTO TELEFONEFUNCIONARIO VALUES ('3892104', '600'),
									   ('3219032', '700'),
                                       ('38201302', '800'),
                                       ('32910301', '900'),
                                       ('32104124', '1000');

INSERT INTO EMAILFUNCIONARIO VALUES ('rattus.brandon@yahoo.com', '600'),
									('clark.claymore@yahoo.com', '700'),
                                    ('peace.walker@yahoo.com', '800'), -- FK duplicates here
                                    ('tacticalnukeenjoyer@yahoo.com', '800'),
                                    ('lovebigboss@yahoo.com', '900'), -- and here to test same thing as TELEFONECLIENTE
                                    ('outerhavenlover@yahoo.com', '900'),
                                    ('ace.ventura@yahoo.com', '1000');
                                    
INSERT INTO CONTRATO VALUES (01, 01, '2025-08-06 20:00:00', 'DF', 'Brasilia', 'Sobradinho', 'Quadra 10, Conjunto A', 03, 50000.00, '100', '1000'),
							(02, 02, '2024-07-20 19:00:00', 'DF', 'Brasilia', 'Asa Norte', '412, bloco A', 05, 25000.00, '200', '600'),
                            (03, 01, '2024-08-20 19:30:00', 'DF', 'Brasilia', 'Asa Sul', '412, bloco B', 32, 32000.00, '300', '700'),
                            (04, 01, '2024-08-17 19:00:00', 'DF', 'Brasilia', 'Gama', 'Setor Central, Q30', 20, 424000.00, '500', '800'),
                            (05, 02, '2024-09-03 18:00:00', 'DF', 'Brasilia', 'Asa Norte', '412, bloco A', 05, 812000.00, '31415', '900'); 

INSERT INTO EQUIPE VALUES (01, 'Garçons', 01),
						  (02, 'Limpeza', 02),
                          (03, 'Cozinheiros', 03),
                          (04, 'Garçons', 04),
                          (05, 'Limpeza', 05);
                          
INSERT INTO FREELANCER VALUES ('2000', 'Biggie Smalls', 'Garçom', 5),
							  ('2100', 'Minoru Mukaiya', 'Cozinheiro', 5),
                              ('2200', 'Larry Carlton', 'Cozinheiro', 3),
                              ('2300', 'Issei Noro', 'Garçom', 5),
                              ('2400', 'Dusty Hills', 'Cozinheiro', 5);
                              
INSERT INTO TELEFONEFREELANCER VALUES ('83291303', '2000'),
									  ('38921904', '2100'),
                                      ('38291043', '2200'),
                                      ('39021043', '2300'),
                                      ('85930218', '2400');
                                      
INSERT INTO EMAILFREELANCER VALUES ('thenotoriousbig@gmail.com', '2000'),
									  ('ilovetrains@gmail.com', '2100'),
                                      ('fourplayrocks@gmail.com', '2200'),
                                      ('guitarsicko@gmail.com', '2300'),
                                      ('hellraiser@gmail.com', '2400');
                                      
INSERT INTO EQUIPEFREELANCER VALUES ('2000', 01),
									('2100', 03),
									('2200', 03),
                                    ('2300', 04),
                                    ('2400', 03);
                                    
INSERT INTO MENU VALUES (01, 'MENU BEBIDAS I', 01),
						(02, 'MENU PETISCOS I', 01),
                        (03, 'MENU BEBIDAS II', 03),
                        (04, 'MENU BEBIDAS III', 04),
                        (05, 'MENU JANTAR I', 04);
                        
INSERT INTO PRATO VALUES (01, 'Agua', 01),
						 (02, 'Coxinha', 02),
                         (03, 'Cerveja', 03),
                         (04, 'Suco de Uva', 04),
                         (05, 'Strogonoff de Frango', 05),
                         (06, 'Suíno Assado', 05),
                         (07, 'Salada Caesar', 05);
                         
INSERT INTO INGREDIENTE VALUES (01, 'Frango'),
							   (02, 'Porco'),
                               (03, 'Uva'),
                               (04, 'Alface'),
                               (05, 'Tomate');
                               
INSERT INTO PRATOINGREDIENTE VALUES (05, 01),
									(06, 02),
                                    (04, 03),
                                    (07, 04),
                                    (07, 05);
                                    
INSERT INTO FORNECEDOR VALUES (01, 'Juquinha FoodService', 5),
							  (02, 'Grande Johnson Suínos', 5),
                              (03, 'RapSlayer Uvas e Vinhos', 4),
                              (04, 'Fazendas Azevedo', 5),
                              (05, 'Hortifruti do JackSmith', 4);
                              
INSERT INTO TELEFONEFORNECEDOR VALUES ('90327943', 01),
									  ('83221321', 02),
                                      ('32421321', 03),
                                      ('89402932', 04),
                                      ('93808312', 05);
                                      
INSERT INTO EMAILFORNECEDOR VALUES ('contatojuqfoodservice@outlook.com', 01),
								   ('grandejohnson@gmail.com', 02),
                                   ('rapslayer@outlook.com', 03),
                                   ('contato.fazazevedo@gmail.com', 04),
                                   ('contato.jacksmith@hotmail.com', 05);
                               
INSERT INTO FORNECIMENTO VALUES ('3290190421', '2023-04-05 14:00:00', 1000.00, 01, 01),
								('3892193032', '2024-05-05 15:00:00', 2000.00, 02, 02),
                                ('3892140421', '2022-03-04 14:00:00', 2500.00, 03, 03),
                                ('8392100412', '2019-09-21 13:00:00', 3000.00, 04, 04),
                                ('4891200214', '2018-01-18 16:00:00', 500.00, 05, 05);
                                



