-- -------- TF2_PAULO--------
--
--                    SCRIPT DE INSERÇÃO (DML)
--
-- Data Criação ...........: 23/05/2024
-- Autor(es) ..............: Paulo Victor Fonseca Sousa
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF_2S22_PAULO_SOUSA
--
-- PROJETO => 01 Base de Dados
--         => 17 Tabelas
-- Ultimas Alteracoes
-- 05/06/2024 => Criação das 5 tuplas para cada tabela
-- 17/06/2024 Adicionando as tuplas para os novos atributos criados em funcionarios fichados e em espaço (carteiraVacina,valorEspaço)
USE TF_2S22_PAULO_SOUSA;


INSERT INTO telefone (idTelefone,telefone) VALUES
(1,'6199998888'), 
(2,'6198887777'), 
(3,'6197776666'),
(4,'6196665555'),
(5,'6195554444');

-- Inserir telefoneCliente
INSERT INTO telefoneCliente (idTelefoneCliente, telefoneFornecedor)
 VALUES
 (1, '6192353411'),
 (2, '6194353832'),
 (3, '6194354444'),
 (4, '6194355555'),
 (5, '6194343567'),
 (6, '6192355432'),
 (7, '6194353652'),
 (8, '6194351242'),
 (9, '6194355555'),
 (10,'6194434661');
 

-- Inserir Clientes
INSERT INTO CLIENTE (idCliente,nomeCliente, rua, bairro, cep, cidade, estado, idTelefoneCliente) 
VALUES
(1,'Ana Silva', 'Rua das Palmeiras', 'Asa Norte', 70750500, 'Brasília', 'DF', 1),
(2,'Bruno Lima', 'Avenida das Nações', 'Lago Sul', 71680350, 'Brasília', 'DF', 2),
(3,'Carla Souza', 'Rua 12', 'Águas Claras', 71900400, 'Brasília', 'DF', 3),
(4,'Daniel Correia', 'Rua 3', 'Noroeste', 70686700, 'Brasília', 'DF', 4),
(5,'Elena Martins', 'Rua das Figueiras', 'Asa Sul', 70332020, 'Brasília', 'DF', 5),
(6,'Felipe Oliveira', 'Rua 4', 'Sudoeste', 70680220, 'Brasília', 'DF', 6),
(7,'Gabriela Ferreira', 'Rua 10', 'Cruzeiro', 70658300, 'Brasília', 'DF', 7),
(8,'Henrique Costa', 'Rua das Mangueiras', 'Jardim Botânico', 71680260, 'Brasília', 'DF', 8),
(9,'Isabela Azevedo', 'Rua 5', 'Guará', 71015170, 'Brasília', 'DF', 9),
(10,'João Alves', 'Rua 6', 'Taguatinga', 72125300, 'Brasília', 'DF', 10);

-- Inserir PessoaFisica
INSERT INTO PESSOAFISICA (cpfCliente, idCliente, dataNascimento)
VALUES 
('11122233344', 1, '1990-01-01'),
('22233344455', 2, '1985-02-02'),
('33344455566', 3, '1995-03-03'),
('44455566677', 4, '1980-04-04'),
('55566677788', 5, '1975-05-05');

-- Inserir PessoaJuridica
INSERT INTO PESSOAJURIDICA (cnpj, idCliente, razaoSocial,nomeFantasia)
VALUES 
('12345678000199', 6, 'Loja de Roupas Estilo Ltda', 'Estilo Fashion'),
('98765432000188', 7, 'TecnoWorld Informática Eireli', 'TecnoWorld'),
('56473829000177', 8, 'Panificadora Pão Quente Ltda', 'Pão Quente'),
('11223344000166', 9, 'Construtora Bela Vista S/A', 'Bela Vista Construções'),
('99887766000155', 10, 'Loja Bom Preco', 'Bom Precoo');

-- Inserir TipoContrato
INSERT INTO TIPOCONTRATO (idTipoContrato,tipoPagamento, valorBase) 
VALUES 
(1,'Pix', 1000.00), 
(2,'Boleto', 1500.00),
(3,'Cartão de Crédito', 2500.00),
(4,'Boleto', 1000.00),
(5,'Pix', 1500.00);

-- Inserir Contrato
INSERT INTO CONTRATO (idContrato,valorContrato, formaPagamento, clausulasAdicionais, dataAssinatura, idCliente, idTipoContrato)
VALUES 
(1, 1400.00, 'Pix', ' ', '2024-01-01', 1, 1),
(2, 1700.00, 'Boleto', 'o contratante  será responsável por atrasos na execução de suas obrigações de pagamento', '2024-02-01', 2, 2),
(3, 2000.00, 'Cartão de Crédito', '', '2024-03-01', 3, 3),
(4, 5800.00, 'Boleto', 'o contratante  será responsável por atrasos na execução de suas obrigações de pagamento', '2024-04-01', 4, 4),
(5, 3600.00, 'Pix', '', '2024-05-01', 5, 5);

-- Inserir Espaco
INSERT INTO ESPACO (idEspaco,nomeEspaco, capacidadePessoas, rua, bairro, estado, cidade, valorEspaco)
VALUES 
(1,'Espaço Casamento Aguas Claras', 200, 'Avenida Das Araucarias', ' Aguas Claras', 'DF',  'Brasília', 400.00),
(2,'Espaço Festa Ceilandia', 300, 'QNM1', 'Ceilandia', 'DF',  'Brasília', 300.00),
(3,'Espaço Gama Lazer', 400, 'Rua H', 'Gama', 'DF',  'Brasília','700.00'),
(4,'Espaço Plano Piloto Casamento', 250, 'Eixo Monumental', 'Plano Piloto', 'DF',  'Brasília', 600.00),
(5,'Espaço Samambaia Luxo', 650, 'QR303', 'Samambaia', 'DF',  'Brasília', 550.00);

-- Inserir Buffet
INSERT INTO BUFFET (idBuffet,itensMenu)
VALUES 
(1,'Buffet A: Salgados, Doces, Bebidas sem alcool'), 
(2,'Buffet B: Pratos Quentes, Saladas, Bebidas alcolicas'), 
(3,'Buffet C: Frutas, Sobremesas, Bebidas alcolicas'), 
(4,'Buffet D: Salgados, Pratos Quentes, Bebidas sem alcool'), 
(5,'Buffet E: Doces, Frutas, Bebidas sem alcool');

-- Inserir Evento
INSERT INTO EVENTO (idEvento,nomeEvento, dataEvento, horarioEvento, idContrato, idEspaco, idBuffet, quantidadePessoas)
VALUES 
(1,'Evento festa roupas', '2024-06-15', '18:00', 5, 2, 1, 150), 
(2,'Casamento Aguas Claras ', '2024-07-20', '19:00', 2, 1, 2, 200), 
(3,'Evento  Beneficente Gama', '2024-08-25', '20:00', 3, 3, 3, 250), 
(4,'Casamento Plano Piloto', '2024-09-30', '21:00', 4, 4, 4, 180), 
(5,'Evento Comemorativo Samambaia', '2024-10-05', '22:00', 5, 5, 5, 220);

-- Inserir telefoneFornecedor
INSERT INTO telefoneFornecedor (idTelefoneFornecedor, telefoneFornecedor) 
VALUES 
(1, '6198473420'), 
(2, '6191294756'), 
(3, '6153845280'), 
(4, '6152315435'), 
(5, '6199995423');

-- Inserir Fornecedor
INSERT INTO FORNECEDOR (idFornecedor,nomeFornecedor, idTelefoneFornecedor, agencia, banco, conta, produtosFornecidos)
VALUES 
(1,'Mercado Dona De Casa ', 1, 'Agência 001', 'Bradesco', 12345, 'Macarrao, carnes'), 
(2,'Peixe a beca', 2, 'Agência 002', 'Santander', 23456, 'Peixes'), 
(3,'Distribuidora Farma', 3, 'Agência 003', 'Banco Do Brasil', 34567, ' Refrigerantes'), 
(4,'Sams Club', 4, 'Agência 004', 'Banco Do Brasil', 45678, 'Bebidas alcolicas'), 
(5,'Confeitaria Joao', 5, 'Agência 005', 'Banco Inter', 56789, 'Casadinho, brigadeiro, Bolos,');

-- Inserir Funcionario
INSERT INTO FUNCIONARIO (idFuncionario,nomeFuncionario, cpfFuncionario, dataNascimento, idtelefone)
VALUES 
(1,'Carlos Andrade', '12345678900', '1980-06-10', 1), 
(2,'Maria Pereira', '23456789011', '1985-07-15', 2), 
(3,'João Silva', '34567890122', '1990-08-20', 3), 
(4,'Ana Costa', '45678901233', '1995-09-25', 4), 
(5,'Lucas Alves', '56789012344', '2000-10-30', 5);

-- Inserir Freelancer
INSERT INTO FREELANCER (idFuncionario, pagamentoEvento, avaliacao)
VALUES 
(1, 300.00, 5), 
(2, 400.00, 4), 
(3, 350.00, 3), 
(4, 500.00, 5), 
(5, 450.00, 4);

-- Inserir FuncionarioFichado
INSERT INTO FICHADO (idFuncionario, salario, carteiraTrabalho, grauEscolaridade,tituloEleitor,carteiraVacina)
VALUES 
(1, 7800.00, 'CTPS123456', 'Superior Completo', 'TE1234567890','Hepatite B, 2023-01-15", 1ª dose, Unidade Básica de Saúde 101 Norte'), 
(2, 6200.50, 'CTPS234567', 'Ensino Médio Completo', 'TE0987654321','Tétano, 2022-11-20, 2ª dose, Hospital Regional da Asa Sul'), 
(3, 4500.00, 'CTPS345678', 'Ensino Fundamental Completo','TE1122334455','Febre Amarela, 2023-03-10,1ª dose, Unidade Básica de Saúde 202 Sul'), 
(4, 3900.75, 'CTPS456789', 'Ensino Superior Incompleto','TE5566778899','Gripe, 2022-10-05, 1ª dose, Posto de Saúde Sobradinho'), 
(5, 5500.20, 'CTPS567890', 'Ensino Médio Incompleto', 'TE9988776655','Covid-19, 2023-05-22, 1ª dose, "Centro de Vacinação Asa Norte');

-- Inserir trabalha
INSERT INTO trabalha (idEvento,idFuncionario, idContrato)
VALUES 
(1, 1, '1'), 
(2, 2, '1'), 
(3, 3, '3'), 
(4, 4, '4'), 
(5, 5, '5');

-- Inserir possui
INSERT INTO possui (idFornecedor, idBuffet)
VALUES 
(1, 1), 
(2, 2), 
(3, 3), 
(4, 4), 
(5, 5);
