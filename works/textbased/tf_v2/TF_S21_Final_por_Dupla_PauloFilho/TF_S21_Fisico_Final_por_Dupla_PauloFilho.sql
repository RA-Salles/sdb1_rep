-- ---------------------   << Trabalho Final - Salão de Festas (Tema 2)  >>   ---------------------
--
--                                   SCRIPT DE CRIAÇÃO (DDL)                                   
-- 
-- Data Criacao ...........: 06/06/2024
-- Autor(es) ..............: Paulo Andre Valadão de Brito Filho
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: TF2_PauloFilho
-- 
-- 
-- PROJETO => 01 Base de Dados
--         => 13 Tabelas
-- 
-- --------------------------------------------------------------------------------------------


-- Criar a base de dados
CREATE DATABASE IF NOT EXISTS TF2_PauloFilho
	DEFAULT CHARACTER SET utf8
    DEFAULT COLLATE utf8_general_ci;
USE TF2_PauloFilho;


-- Criação da tabela CLIENTE
CREATE TABLE CLIENTE (
    cpf CHAR(11) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    dtNascimento DATE NOT NULL,
 
    CONSTRAINT CLIENTE_PK PRIMARY KEY (cpf)
) ENGINE=InnoDB;


-- Criação da tabela telefoneCliente
CREATE TABLE telefoneCliente(
    cpf CHAR(11) NOT NULL,
    telefone VARCHAR(15) NOT NULL,

    CONSTRAINT telefoneCliente_UK UNIQUE KEY (telefone, cpf),
    CONSTRAINT telefoneCliente_CLIENTE_FK FOREIGN KEY (cpf)
	 REFERENCES CLIENTE(cpf)
) ENGINE=InnoDB;


-- Criação da tabela SALAO
CREATE TABLE SALAO (
    nomeSalao VARCHAR(100) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    rua VARCHAR(50) NOT NULL,
    numero INT(5) NOT NULL,

    CONSTRAINT SALAO_PK PRIMARY KEY (nomeSalao)
) ENGINE=InnoDB;


-- Criação da tabela BUFFET
CREATE TABLE BUFFET (
    nomeBuffet VARCHAR(100) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    rua VARCHAR(50) NOT NULL,
    numero INT(5) NOT NULL,

    CONSTRAINT BUFFET_PK PRIMARY KEY (nomeBuffet)
) ENGINE=InnoDB;


-- Criação da tabela CONTRATO
CREATE TABLE CONTRATO (
    idContrato INT(5) AUTO_INCREMENT NOT NULL,
    tipoContrato VARCHAR(50) NOT NULL,
    valorContrato DECIMAL(10, 2) NOT NULL,
    cpfCliente CHAR(11) NOT NULL,
    nomeSalao VARCHAR(100),
    nomeBuffet VARCHAR(100),

    CONSTRAINT CONTRATO_PK PRIMARY KEY (idContrato),
    CONSTRAINT CONTRATO_CLIENTE_FK FOREIGN KEY (cpfCliente)
	 REFERENCES CLIENTE(cpf),
    CONSTRAINT CONTRATO_SALAO_FK FOREIGN KEY (nomeSalao)
	 REFERENCES SALAO(nomeSalao),
    CONSTRAINT CONTRATO_BUFFET_FK FOREIGN KEY (nomeBuffet)
	 REFERENCES BUFFET(nomeBuffet)
) ENGINE=InnoDB AUTO_INCREMENT = 1;


-- Criação da tabela EMPREGADO
CREATE TABLE EMPREGADO (
    idFuncionario INT(5) AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL,
    dtNascimento DATE NOT NULL,
    nomeBuffet VARCHAR(100),
    nomeSalao VARCHAR(100),

    CONSTRAINT EMPREGADO_PK PRIMARY KEY (idFuncionario),
    CONSTRAINT EMPREGADO_BUFFET_FK FOREIGN KEY (nomeBuffet)
	 REFERENCES BUFFET(nomeBuffet),
    CONSTRAINT EMPREGADO_SALAO_FK FOREIGN KEY (nomeSalao)
	 REFERENCES SALAO(nomeSalao)
) ENGINE=InnoDB AUTO_INCREMENT = 1;


-- Criação da tabela telefoneEmpregado
CREATE TABLE telefoneEmpregado(
    idFuncionario INT(5) NOT NULL,
    telefone VARCHAR(15) NOT NULL,

    CONSTRAINT telefoneEmpregado_UK UNIQUE KEY (telefone, idFuncionario),
    CONSTRAINT telefoneEmpregado_EMPREGADO_FK FOREIGN KEY (idFuncionario)
	 REFERENCES EMPREGADO(idFuncionario)
) ENGINE=InnoDB;


-- Criação da tabela FREELANCERS
CREATE TABLE FREELANCERS (
    idFuncionario INT(5) NOT NULL,
    numeroEstrela INT(2) NOT NULL,

    CONSTRAINT FREELANCERS_PK PRIMARY KEY (idFuncionario),
    CONSTRAINT FREELANCERS_EMPREGADO_FK FOREIGN KEY (idFuncionario)
	 REFERENCES EMPREGADO(idFuncionario)
) ENGINE=InnoDB;


-- Criação da tabela FICHADOS
CREATE TABLE FICHADOS (
    idFuncionario INT(5) NOT NULL,
    CTnumero VARCHAR(20) NOT NULL,
    CTserie VARCHAR(20) NOT NULL,
    cartaoVacina BOOLEAN NOT NULL,
    certidaoNascimento BOOLEAN NOT NULL,
    grauEscolaridade VARCHAR(50) NOT NULL,

    CONSTRAINT FICHADOS_PK PRIMARY KEY (idFuncionario),
    CONSTRAINT FICHADOS_EMPREGADO_FK FOREIGN KEY (idFuncionario)
	 REFERENCES EMPREGADO(idFuncionario)
) ENGINE=InnoDB;


-- Criação da tabela FORNECEDOR
CREATE TABLE FORNECEDOR (
    idFornecedor INT(5) AUTO_INCREMENT NOT NULL,
    nomeFornecedor VARCHAR(100) NOT NULL,
    MateriaPrima VARCHAR(100) NOT NULL,
    quantidadeMateria INT(5) NOT NULL,
    valorMateria DECIMAL(10, 2) NOT NULL,

    CONSTRAINT FORNECEDOR_PK PRIMARY KEY (idFornecedor)
) ENGINE=InnoDB AUTO_INCREMENT = 1;


-- Criação da tabela EVENTO
CREATE TABLE EVENTO (
    idEvento INT(5) AUTO_INCREMENT NOT NULL,
    tipoEvento VARCHAR(50) NOT NULL,
    valorEvento DECIMAL(10, 2) NOT NULL,
    qtdPessoa INT(5) NOT NULL,
    dataEvento DATE NOT NULL,
    horarioEvento TIME NOT NULL,
    nomeSalao VARCHAR(100) NOT NULL,
    nomeBuffet VARCHAR(100) NOT NULL,
    cidade VARCHAR(50),
    estado VARCHAR(2),
    bairro VARCHAR(50),
    rua VARCHAR(50),
    numero INT(5) ,

    CONSTRAINT EVENTO_PK PRIMARY KEY (idEvento),
    CONSTRAINT EVENTO_SALAO_FK FOREIGN KEY (nomeSalao)
	 REFERENCES SALAO(nomeSalao),
    CONSTRAINT EVENTO_BUFFET_FK FOREIGN KEY (nomeBuffet)
	 REFERENCES BUFFET(nomeBuffet)
) ENGINE=InnoDB AUTO_INCREMENT = 1;


-- Criação da tabela CARDAPIO
CREATE TABLE CARDAPIO (
    tipoCardapio VARCHAR(50) NOT NULL,
    precoCardapio DECIMAL(10, 2) NOT NULL,
    nomeBuffet VARCHAR(100) NOT NULL,

    CONSTRAINT CARDAPIO_PK PRIMARY KEY (tipoCardapio),
    CONSTRAINT CARDAPIO_BUFFET_FK FOREIGN KEY (nomeBuffet)
	 REFERENCES BUFFET(nomeBuffet)
) ENGINE=InnoDB;


-- Criação da tabela possui (relacionamento N:M entre BUFFET e FORNECEDOR)
CREATE TABLE possui (
    nomeBuffet VARCHAR(100) NOT NULL,
    idFornecedor INT(5) NOT NULL,
    
    CONSTRAINT possui_BUFFET_FK FOREIGN KEY (nomeBuffet)
	 REFERENCES BUFFET(nomeBuffet),
    CONSTRAINT possui_FORNECEDOR_FK FOREIGN KEY (idFornecedor)
	 REFERENCES FORNECEDOR(idFornecedor)
) ENGINE=InnoDB;




