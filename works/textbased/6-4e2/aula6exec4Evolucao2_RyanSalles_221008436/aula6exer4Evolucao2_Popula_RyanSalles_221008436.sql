-- ------- Aula 6 Exercicio 4 Evolucao 2--------
--
--                    SCRIPT DE POPULA (DML)
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
-- 	 17/06/24 => adaptação das inserções para novas tabelas
-- ------------------------------------------------------


USE aula6exer4evolucao2;

INSERT INTO EMPREGADO(matriculaEmpregado, nome, sexo, dataNascimento, bairro, rua, numero, matriculaSupervisor) VALUES 
('100', 'Big johnson da Silva', 'M', '1990-03-20', 'asa norte','110', '38', '100'),
('200', 'Hot Coldman Ferreira', 'M', '1995-05-04', 'asa sul', '204', '20', '100'),
('300', 'Kazuhira Miller', 'M', '1996-06-27', 'asa norte', '208', '40', '100'),
('400', 'Maria Joana Silveira', 'M', '1999-07-13', 'asa norte', '412', '30', '100'),
('500', 'John Smither', 'M', '1988-08-07', 'sobradinho', '3', '28', '100'),
('600', 'Raul Goldman', 'M', '1979-12-03', 'gama', '42', '62', '100');

INSERT INTO DEPENDENTE(idDependente, grauLigacao, dataNascimento, sexo, nome, matriculaEmpregado) VALUES 
(1, 'filho', '2003-04-05', 'M', 'Small Johnson da Silva primeiro', '100'),
(2, 'filho', '2003-04-05', 'M', 'Small Johnson da Silva segundo', '100'),
(3, 'filho', '2004-03-20', 'M', 'Smaller Johnson da Silva', '100'),
(4, 'filho', '2007-08-24', 'M', 'Smalling Johnson da Silva', '100'),
(5, 'filho', '2008-12-25', 'M', 'Biggie Smalls Johnson da Silva', '100'),
(6, 'filho', '2009-06-20', 'M', 'Very Small Johnson da Silva primeiro', '100');

INSERT INTO DEPARTAMENTO(idDepartamento, nome, matriculaEmpregado, dataAssumiu) VALUES
(1, 'Comercial', '100', '2012-03-04'),
(2, 'Segurança', '100', '2013-03-04'),
(3, 'Marketing', '200', '2015-03-04'),
(4, 'Jurídico', '200', '2011-03-04'),
(5, 'SAC', '100', '2020-03-04'),
(6, 'Presidencia', '100', '2017-03-04');

INSERT INTO PROJETO(idProjeto, nome, bairro, rua, numero, idDepartamento) VALUES
(1, 'Produto Novo: Salgadinho de queijo', 'asa norte', '202', '30', 1),
(2, 'Desenvolvimento de capacetes', 'asa norte', '412', '30', 2),
(3, 'Lavagem cerebral de clientes', 'asa norte', '102', '30', 3),
(4, 'Produto Novo: morte instantânea', 'asa sul', '404', '12', 1),
(5, 'Atualização de produto: queijo melhor', 'asa norte', '202', '30', 1),
(6, 'aumento de salário do presidente', 'asa norte', '202', '30', 6);

INSERT INTO trabalha(idProjeto, matriculaEmpregado, horasSemanais) VALUES 
(1, '100', 3),
(2, '200', 4),
(3, '300', 5),
(4, '600', 6),
(5, '400', 4),
(6, '500', 32);