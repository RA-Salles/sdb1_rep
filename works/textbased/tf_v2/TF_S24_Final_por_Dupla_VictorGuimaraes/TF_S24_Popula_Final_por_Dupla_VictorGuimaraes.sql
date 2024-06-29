-- -------- <Trabalho Final Tema 2 Sozinho 24> --------
--
--           SCRIPT DE INSERÇÃO (DML)
--
-- DATA DE CRIAÇÃO: 16/06/2024
-- BANCO DE DADOS.: MySQL 8.4
-- AUTOR..........: Victor Hugo Rodrigues Guimarães, 211063256
-- BASE DE DADOS..: TF_S24_victorguimaraes
--
-- PROJETO => 01 base de dados 
--         => 25 tabelas
-- 		   => 02 Perfis (role)
-- ------------------------------------

 use TF_S24_victorguimaraes;
 
 INSERT INTO ENDERECO (logradouro, numero, cep) VALUES
('Rua A', 101, '12345-678'),
('Rua B', 202, '23456-789'),
('Rua C', 303, '34567-890'),
('Rua D', 404, '45678-901'),
('Rua E', 505, '56789-012'),
('Rua F', 606, '67890-123'),
('Rua G', 707, '78901-234'),
('Rua H', 808, '89012-345'),
('Rua I', 909, '90123-456'),
('Rua J', 100, '01234-567'),
('Rua K', 111, '12345-678'),
('Rua L', 122, '23456-789'),
('Rua M', 133, '34567-890'),
('Rua N', 144, '45678-901'),
('Rua O', 155, '56789-012'),
('Rua P', 166, '67890-123'),
('Rua Q', 177, '78901-234'),
('Rua R', 188, '89012-345'),
('Rua S', 199, '90123-456'),
('Rua T', 200, '01234-567');

INSERT INTO PESSOA (cpf, nomePessoa, enderecoPessoa) VALUES
(47829019301, 'João Silva', 1),
(22222222202, 'Maria Oliveira', 2),
(33333333303, 'Carlos Souza', 3),
(44444444404, 'Ana Santos', 4),
(55555555505, 'Paulo Almeida', 5),
(66666666606, 'Clara Ferreira', 6),
(77777777707, 'Rafael Lima', 7),
(88888888808, 'Bianca Costa', 8),
(99999999909, 'Gustavo Moreira', 9),
(10101010101, 'Mariana Rocha', 10),
(11111111111, 'Felipe Gonçalves', 11),
(12121212121, 'Lucas Ramos', 12),
(13131313131, 'Gabriel Pereira', 13),
(14141414141, 'Natália Mendes', 14),
(15151515151, 'Camila Barbosa', 15);

INSERT INTO FUNCAO (nomeFuncao, valorDiaria) VALUES
('Garçom', 100.00),
('Cozinheiro', 120.00),
('Segurança', 100.00),
('Organizador', 110.00),
('Recepcionista', 100.00);

INSERT INTO GRAUESCOLARIDADE (nomeGrauEscolaridade) VALUES
('Ensino Fundamental'),
('Ensino Médio'),
('Ensino Técnico'),
('Ensino Superior'),
('Pós-Graduação');

INSERT INTO FUNCIONARIO (cpf, chavePIX, agencia, conta, funcao) VALUES
(11111111101, 'pixjoao01', '1234', '567890', 1),
(22222222202, 'pixmaria02', '2345', '678901', 2),
(33333333303, 'pixcarlos03', '3456', '789012', 3),
(44444444404, 'pixana04', '4567', '890123', 4),
(55555555505, 'pixpaulo05', '5678', '901234', 5),
(66666666606, 'pixclara06', '6789', '012345', 1),
(77777777707, 'pixrafael07', '7890', '123456', 2),
(88888888808, 'pixbianca08', '8901', '234567', 3),
(99999999909, 'pixgustavo09', '9012', '345678', 4),
(10101010101, 'pixmariana10', '0123', '456789', 5);

INSERT INTO FIXO (ctps, grauEscolaridade, cpf) VALUES
('12345678901', 1, 11111111101),
('23456789012', 2, 22222222202),
('34567890123', 3, 33333333303),
('45678901234', 4, 44444444404),
('56789012345', 5, 55555555505);

INSERT INTO FREELANCER (cpf, nota) VALUES
(66666666606, 9),
(77777777707, 8),
(88888888808, 7),
(99999999909, 10),
(10101010101, 9);

INSERT INTO CLIENTE VALUES 
(11111111111, 'feli@gmail.com', NULL),
(12121212121, 'lucas@gmail.com', 11111111111),
(13131313131, 'gabriel@gmail.com', 12121212121),
(14141414141, 'natalia@gmail.com', 13131313131),
(15151515151, 'camila@gmail.com', 14141414141);

INSERT INTO CATEGORIA (nomeCategoria) VALUES
('Sociedade Anônima'),
('Sociedade Simples'),
('Sociedade Limitada'),
('Microempreendedor Individual'),
('Empresário Individual');

INSERT INTO EMPRESA (cnpj, nomeFantasia, enderecoEmpresa, categoriaEmpresa, representante) VALUES
('01.234.567/0001-01', 'Tech Innovators', 16, 1, '12121212121'),
('02.345.678/0002-02', 'Green Energy Solutions', 17, 2, '13131313131'),
('03.456.789/0003-03', 'Creative Marketing', 18, 3, '14141414141'),
('04.567.890/0004-04', 'Global Logistics', 19, 4, '15151515151'),
('05.678.901/0005-05', 'Elegant Events Planners', 20, 5, '11111111111');

INSERT INTO FORMAPAGAMENTO (nomeFormaPagamento) VALUES
('Dinheiro'),
('Cartão de Crédito'),
('Cartão de Débito'),
('Transferência Bancária'),
('Pix');

INSERT INTO TIPOITEM (nomeTipoItem) VALUES
('Mesa'),
('Cadeira'),
('Toalha'),
('Prato'),
('Talher');

INSERT INTO MATERIAPRIMA (nomeMateriaPrima, quantidadeEstoque) VALUES
('Papel', 50),
('Plástico', 40),
('Madeira', 30),
('Metal', 20),
('Tecido', 10);

INSERT INTO DECORACAO (descricaoDecoracao, valorDecoracao) VALUES
('Decoração Floral', 200.00),
('Decoração com Balões', 150.00),
('Decoração Temática', 300.00),
('Decoração Minimalista', 100.00),
('Decoração Luxuosa', 500.00);


INSERT INTO FORNECEDOR (chavePIX, nomeFornecedor, enderecoFornecedor) VALUES
('pixfornecedor1', 'Fornecedor A', 1),
('pixfornecedor2', 'Fornecedor B', 2),
('pixfornecedor3', 'Fornecedor C', 3),
('pixfornecedor4', 'Fornecedor D', 4),
('pixfornecedor5', 'Fornecedor E', 5);

INSERT INTO ITEM (nomeItem, valorItem, tipo) VALUES
('Mesa Redonda', 50.00, 1),
('Cadeira Dobrável', 20.00, 2),
('Toalha de Mesa', 10.00, 3),
('Prato de Porcelana', 5.00, 4),
('Talher de Inox', 3.00, 5);

INSERT INTO INFRACAO (nomeInfracao, gravidadeInfracao) VALUES
('Atraso', 1),
('Falta', 2),
('Desrespeito', 3),
('Danos Materiais', 4),
('Roubo', 5);

INSERT INTO EVENTO (dtEvento, hora, quantidadePessoas, decoracao, cliente, enderecoEvento) VALUES
('2024-07-01', '18:00:00', 100, 1, 12121212121, 1),
('2024-07-02', '19:00:00', 150, 2, 13131313131, 2),
('2024-07-03', '20:00:00', 200, 3, 14141414141, 3),
('2024-07-04', '21:00:00', 250, 4, 15151515151, 4),
('2024-07-05', '22:00:00', 300, 5, 11111111111, 5);

INSERT INTO CONTRATO (evento, formaPagamento, valorContrato) VALUES
(1, 1, 1000.00),
(2, 2, 1500.00),
(3, 3, 2000.00),
(4, 4, 2500.00),
(5, 5, 3000.00);

INSERT INTO TRABALHO (idEvento, idFuncionario, idInfracao) VALUES
(1, 11111111101, 1),
(2, 22222222202, 2),
(3, 33333333303, 3),
(4, 44444444404, 4),
(5, 55555555505, 5);

INSERT INTO telefoneFornecedor (fornecedor, telefone) VALUES
(1, '1234567890'),
(2, '2345678901'),
(3, '3456789012'),
(4, '4567890123'),
(5, '5678901234');

INSERT INTO telefonePessoa (pessoa, telefonePessoa) VALUES
(11111111101, '9876543210'),
(22222222202, '8765432109'),
(33333333303, '7654321098'),
(44444444404, '6543210987'),
(55555555505, '5432109876'),
(66666666606, '4321098765'),
(77777777707, '3210987654'),
(88888888808, '2109876543'),
(99999999909, '1098765432'),
(10101010101, '0987654321'),
(11111111111, '8765432198'),
(12121212121, '7654321987'),
(13131313131, '6543219876'),
(14141414141, '5432198765'),
(15151515151, '4321987654');

INSERT INTO serve (idItem, idEvento, descricao, valor) VALUES
(1, 1, 'Serviço de Buffet', 500.00),
(2, 2, 'Serviço de Decoração', 300.00),
(3, 3, 'Serviço de Segurança', 200.00),
(4, 4, 'Serviço de Som', 400.00),
(5, 5, 'Serviço de Fotografia', 250.00);

INSERT INTO compoe (item, materiaPrima, quantidade) VALUES
(1, 1, 10),
(2, 2, 20),
(3, 3, 30),
(4, 4, 40),
(5, 5, 50);

INSERT INTO fornece (fornecedor, materiaPrima, valor) VALUES
(1, 1, 100.00),
(2, 2, 200.00),
(3, 3, 300.00),
(4, 4, 400.00),
(5, 5, 500.00);