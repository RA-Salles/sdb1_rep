
-- -------- < aula4exer6Evolucao3 > --------
--
--                    SCRIPT DE MANIPULAÇÃO (DML)
--
-- Data Criacao ...........: 06/05/2024
-- Autor(es) ..............: Arthur Heleno do Couto da Silva,
--                           Lucas Martins Gabriel
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula4exer6Evolucao3
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
--
-- Ultimas Alteracoes
--   13/05/2024 => Adicao de mais tuplas exigidas pelo enunciado
--              => Mundancao para uma transacao INSERT por tabela
--              => Remocao das tabelas ENDERECO e POSICAOGEOGRAFICA
--   14/05/2024 => Inclui ao menos 1 chassi para um valor que simula dados reais
--                 para testar a base de dados modelada.
--   15/05/2024 => Correção das inserções quanto ao chassi e matriculaAgente
-- ---------------------------------------------------------

-- BASE DE DADOS
USE aula4exer6Evolucao3;

-- INSERCOES
INSERT INTO PROPRIETARIO VALUES 
(04161109164, 'Arthur Heleno', 'M', '1999-07-26', 'SQN 407 Bloco L', 307, 'Asa Norte', 'Brasília', 'DF', ''),
(12345678910, 'Luis Silva', 'M', '1977-05-04', 'SQN 202 Bloco B', 204, 'Asa Norte', 'Brasília', 'DF', ''),
(98765432100, 'Dilma Maria', 'F', '2000-04-20', 'SQS 104 Bloco J', 1, 'Asa Sul', 'Brasília', 'DF',''),
(07696644157, 'Lucas Martins', 'M', '2004-02-05', 'QR 604 Conjunto 6A', 501, 'Samambaia Norte', 'Brasília', 'DF', ''),
(12345678911, 'Leticia dos Santos', 'F', '1983-01-23', 'QR 604 Conjunto 6A', 501, 'Samambaia Norte', 'Brasília', 'DF', ''),
(98765432101, 'Emanuel Vieira', 'M', '1996-08-31', 'QNN 08 Conjunto I', 45, 'Ceilândia', 'Brasília', 'DF','');

INSERT INTO telefone VALUES 
(61992890399, 04161109164),
(61940028922, 12345678910),
(61912345678, 98765432100),
(61987654321, 07696644157),
(61987654322, 12345678911),
(61987654323, 98765432101);

INSERT INTO CATEGORIA (nomeCategoria) VALUES 
('Automóvel'),
('Motocicleta'),
('Caminhão'),
('Ônibus'),
('Caminhonete'),
('Quadriciclo');

INSERT INTO MODELO (nomeModelo) VALUES 
('GOL MI'),
('GOL 1.8'),
('UNO CS'),
('TWISTER 300'),
('F-350'),
('Marcopolo Paradiso'),
('Can-Am Renegade');

INSERT INTO VEICULO VALUES 
('IJJ4758', 'AAAAAAAAAAAAAAAAA', 'Preto', 1, 1, 2014, 04161109164),
('LLU1236', 'JJJJJJJJJJJJJJJJJ', 'Preto', 2, 1, 2016, 07696644157),
('ALJ7852', 'XXXXXXXXXXXXXXXXX', 'Prata', 3, 1, 2018, 12345678910),
('ABC1234', 'BBBBBBBBBBBBBBBBB', 'Azul', 4, 2, 2015, 98765432101),
('DEF5678', 'CCCCCCCCCCCCCCCCC', 'Vermelho', 5, 5, 2017, 98765432100),
('GHI9012', 'DDDDDDDDDDDDDDDDD', 'Branco', 6, 4, 2019, 07696644157),
('JKL3456', 'EEEEEEEEEEEEEEEEE', 'Verde', 7, 6, 2020, 12345678911),
('JOP2901', '9BD111060T5002156',  'Verde', 7, 6, 2020, 12345678911);
						
                            
INSERT INTO TIPOINFRACAO (descricaoInfracao, valorMulta) VALUES 
('AVANÇO DE SINAL VERMELHO', 800.50),
('PARADA SOBRE A FAIXA DE PEDESTRES', 900.50),
('ULTRAPASSAR LIMITE DE VELOCIDADE', 1000.50),
('DIRIGIR SEM CINTO DE SEGURANÇA', 700.50),
('DIRIGIR USANDO CELULAR', 600.50),
('DIRIGIR EMBRIAGADO', 1500.50);
								 
                                 
INSERT INTO LOCALIZACAO (velocidadePermitida, latitude, longitude) VALUES 
(80,'50° Norte', '155° Oeste'),
(60, '60° Norte', '160° Oeste'),
(40, '50° Sul', '155° Leste'),
(100, '40° Sul', '160° Leste'),
(120, '30° Sul', '165° Leste'),
(80, '20° Sul', '170° Leste');

INSERT INTO AGENTE (nomeAgente, dataContratacao) VALUES 
('Marcos', '2022-05-06'),
('Alexandre', '2022-05-06'),
('Caio', '2022-05-06'),
('Lucas', '2022-05-06'),
('Arthur', '2022-05-06'),
('Luis', '2022-05-06');
						   
                           
INSERT INTO INFRACAO VALUES 
('IJJ4758', '2023-05-05 00:00:00', 1, 1, 1, 90),
('LLU1236', '2023-05-05 00:00:00', 2, 2, 2, 100),
('ALJ7852', '2023-05-05 00:00:00', 3, 3, 3, 60),
('ABC1234', '2023-05-05 00:00:00', 4, 4, 4, 70),
('DEF5678', '2023-05-05 00:00:00', 5, 5, 5, 80),
('GHI9012', '2023-05-05 00:00:00', 6, 6, 6, 120),
('JKL3456', '2023-05-05 00:00:00', 4, 4, 2, 70);