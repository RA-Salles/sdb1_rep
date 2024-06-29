-- ---------------------   << Trabalho Final - Salão de Festas (Tema 2)  >>   ---------------------
--
--                                   SCRIPT DE POPULA (DDL)                                   
-- 
-- Data Criacao ...........: 07/06/2024
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

-- Popular as tabelas 

-- Tabela CLIENTE
INSERT INTO CLIENTE (cpf, nome, dtNascimento) VALUES
('12345678901', 'Maria Silva', '1985-04-12'),
('23456789012', 'João Santos', '1990-11-23'),
('34567890123', 'Ana Oliveira', '1975-07-30'),
('45678901234', 'Carlos Pereira', '1982-01-15'),
('56789012345', 'Lucia Fernandes', '1995-09-08');

-- Tabela telefoneCliente
INSERT INTO telefoneCliente (cpf, telefone) VALUES
('12345678901', '61987654321'),
('23456789012', '61987654321'),
('34567890123', '61987654321'),
('45678901234', '61987654321'),
('56789012345', '61987654321');

-- Tabela SALAO
INSERT INTO SALAO (nomeSalao, telefone, cidade, estado, bairro, rua, numero) VALUES
('Salão Festa', '6122334455', 'Distrito Federal', 'DF', 'Asa Sul', 'SQS 102', 100),
('Espaço Alegria', '6133445566', 'Distrito Federal', 'DF', 'Asa Norte', 'SQN 208', 200),
('Salão Luxo', '6144556677', 'Distrito Federal', 'DF', 'Lago Sul', 'QL 12', 300),
('Espaço Brilho', '6155667788', 'Distrito Federal', 'DF', 'Lago Norte', 'CA 5', 400),
('Salão Estilo', '6166778899', 'Distrito Federal', 'DF', 'Sudoeste', 'SQSW 300', 500);

-- Tabela BUFFET
INSERT INTO BUFFET (nomeBuffet, telefone, cidade, estado, bairro, rua, numero) VALUES
('Buffet Gourmet', '6177889900', 'Distrito Federal', 'DF', 'Asa Sul', 'SQS 103', 600),
('Buffet Delícia', '6188990011', 'Distrito Federal', 'DF', 'Asa Norte', 'SQN 209', 700),
('Buffet Sabor', '6199001122', 'Distrito Federal', 'DF', 'Lago Sul', 'QL 14', 800),
('Buffet Elegância', '6100112233', 'Distrito Federal', 'DF', 'Lago Norte', 'CA 6', 900),
('Buffet Charme', '6111122334', 'Distrito Federal', 'DF', 'Sudoeste', 'SQSW 301', 1000);

-- Tabela CONTRATO
INSERT INTO CONTRATO (tipoContrato, valorContrato, cpfCliente, nomeSalao, nomeBuffet) VALUES
('Apenas Salão', 5000.00, '12345678901', 'Salão Festa'),
('Apenas Buffet', 3000.00, '23456789012', 'Buffet Delícia'),
('Salão e Buffet', 7000.00, '34567890123', 'Salão Luxo', 'Buffet Sabor'),
('Apenas Salão', 4000.00, '45678901234', 'Espaço Brilho'),
('Apenas Buffet', 3500.00, '56789012345', 'Buffet Charme');

-- Tabela EMPREGADO
INSERT INTO EMPREGADO (nome, cpf, dtNascimento, nomeBuffet, nomeSalao) VALUES
('Pedro Lima', '67890123456', '1980-05-14', 'Buffet Gourmet', 'Salão Festa'),
('Rafael Souza', '78901234567', '1992-06-20', 'Buffet Delícia', 'Espaço Alegria'),
('Mariana Costa', '89012345678', '1988-02-18', 'Buffet Sabor', 'Salão Luxo'),
('Felipe Nunes', '90123456789', '1985-09-22', 'Buffet Elegância', 'Espaço Brilho'),
('Juliana Rocha', '01234567890', '1993-12-02', 'Buffet Charme', 'Salão Estilo');

-- Tabela telefoneEmpregado
INSERT INTO telefoneEmpregado (idFuncionario, telefone) VALUES
(1, '61920742842'),
(2, '61929847520'),
(3, '61908781324'),
(4, '61990183262'),
(5, '61908273243');

-- Tabela FREELANCERS
INSERT INTO FREELANCERS (idFuncionario, numeroEstrela) VALUES
(1, 5),
(2, 4),
(3, 5),
(4, 3),
(5, 4);

-- Tabela FICHADOS
INSERT INTO FICHADOS (idFuncionario, CTnumero, CTserie, cartaoVacina, certidaoNascimento, grauEscolaridade) VALUES
(1, '123456', '7890', TRUE, TRUE, 'Ensino Médio'),
(2, '234567', '8901', TRUE, TRUE, 'Ensino Superior'),
(3, '345678', '9012', TRUE, TRUE, 'Ensino Médio'),
(4, '456789', '0123', TRUE, TRUE, 'Ensino Superior'),
(5, '567890', '1234', TRUE, TRUE, 'Ensino Médio');

-- Tabela FORNECEDOR
INSERT INTO FORNECEDOR (nomeFornecedor, MateriaPrima, quantidadeMateria, valorMateria) VALUES
('Fornecedor A', 'Farinha', 100, 200.00),
('Fornecedor B', 'Açúcar', 200, 300.00),
('Fornecedor C', 'Ovos', 300, 400.00),
('Fornecedor D', 'Leite', 400, 500.00),
('Fornecedor E', 'Chocolate', 500, 600.00);

-- Tabela EVENTO
INSERT INTO EVENTO (tipoEvento, valorEvento, qtdPessoa, dataEvento, horarioEvento, nomeSalao, nomeBuffet, cidade, estado, bairro, rua, numero) VALUES
('Casamento', 10000.00, 200, '2024-07-01', '18:00:00', 'Salão Festa', '', 'Distrito Federal', 'DF', 'Asa Sul', 'SQS 102', 100),
('Aniversário', 5000.00, 100, '2024-08-15', '14:00:00', '', 'Buffet Delícia', 'Distrito Federal', 'DF', 'Asa Norte', 'SQN 208', 200),
('Corporativo', 15000.00, 300, '2024-09-10', '09:00:00', 'Salão Luxo', 'Buffet Sabor', 'Distrito Federal', 'DF', 'Lago Sul', 'QL 12', 300),
('Formatura', 12000.00, 250, '2024-10-05', '19:00:00', 'Espaço Brilho', '', 'Distrito Federal', 'DF', 'Lago Norte', 'CA 5', 400),
('Bodas', 8000.00, 150, '2024-11-20', '17:00:00', '', 'Buffet Charme', 'Distrito Federal', 'DF', 'Sudoeste', 'SQSW 300', 500);

-- Tabela CARDAPIO
INSERT INTO CARDAPIO (tipoCardapio, precoCardapio, nomeBuffet) VALUES
('Janta de Frutos do Mar', 200.00, 'Buffet Gourmet'),
('Entrada de Frios', 150.00, 'Buffet Delícia'),
('Cardapio de Vinhos', 250.00, 'Buffet Sabor'),
('Janta de Pastas', 220.00, 'Buffet Elegância'),
('Janta de Crepes', 180.00, 'Buffet Charme');

-- Tabela possui (relacionamento N:M entre BUFFET e FORNECEDOR)
INSERT INTO possui (nomeBuffet, idFornecedor) VALUES
('Buffet Gourmet', 1),
('Buffet Delícia', 2),
('Buffet Sabor', 3),
('Buffet Elegância', 4),
('Buffet Charme', 5);