-- -------- TF2_PAULO--------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 23/05/2024
-- Autor(es) ..............: Paulo Victor Fonseca Sousa
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF_2S22_PAULO_SOUSA
--
-- PROJETO => 01 Base de Dados
--         => 17 Tabelas
-- 
-- Ultimas Alteracoes
-- 05/06/2024 => Criação das 17 tabelas da estrutura inicial
-- 07/06/2024 =>  adicionando unique as tabelas de  funcionario, pessoa fisica e pessoa juridica
-- 17/06/2024 Adicionando  novos atributos criados em funcionarios fichados e em espaço (carteiraVacina,valorEspaço)

CREATE DATABASE IF NOT EXISTS TF_2S22_PAULO_SOUSA;
USE TF_2S22_PAULO_SOUSA;


-- Tabela de TelefoneCliente
CREATE TABLE telefoneCliente (
    idTelefoneCliente INT NOT NULL,
    telefoneFornecedor VARCHAR(14) NOT NULL,
    CONSTRAINT TelefoneCliente_PK PRIMARY KEY(idTelefoneCliente)
)Engine = INNODB;

-- Tabela de Cliente
CREATE TABLE CLIENTE (
    idCliente INT NOT NULL AUTO_INCREMENT,
    nomeCliente VARCHAR(60) NOT NULL,
    rua VARCHAR(60) NOT NULL,
    bairro VARCHAR(60) NOT NULL,
    cep VARCHAR(9) NOT NULL,
    cidade VARCHAR(60) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    idTelefoneCliente INT NOT NULL,
    CONSTRAINT CLIENTE_telefoneCliente_FK FOREIGN KEY (idTelefoneCliente) REFERENCES telefoneCliente(idTelefoneCliente),
    CONSTRAINT CLIENTE_PK PRIMARY KEY(idCliente)
)Engine = INNODB, auto_increment = 1;

-- Tabela de PessoaFisica
CREATE TABLE PESSOAFISICA (
    cpfCliente VARCHAR(14) NOT NULL,
    idCliente INT NOT NULL,
    dataNascimento DATE NOT NULL,
    CONSTRAINT PESSOAFISICA_UK UNIQUE(cpfCliente),
    CONSTRAINT PESSOAFISICA_PK PRIMARY KEY(idCliente),
    CONSTRAINT PESSOAFISICA_CLIENTE_FK FOREIGN KEY (idCliente) REFERENCES CLIENTE(idCliente)
)Engine = INNODB;

-- Tabela de PessoaJuridica
CREATE TABLE PESSOAJURIDICA (
    cnpj VARCHAR(18) NOT NULL,
    idCliente INT NOT NULL,
    razaoSocial VARCHAR(100) NOT NULL,
    nomeFantasia VARCHAR(60) NOT NULL,
    CONSTRAINT PESSOAJURIDICA_UK UNIQUE(cnpj),
    CONSTRAINT PESSOAJURIDICA_PK PRIMARY KEY(idCliente),
    CONSTRAINT PESSOAJURIDICA_CLIENTE_FK FOREIGN KEY (idCliente) REFERENCES CLIENTE(idCliente)
)Engine = INNODB;

CREATE TABLE TIPOCONTRATO (
    idTipoContrato INT NOT NULL AUTO_INCREMENT,
    tipoPagamento VARCHAR(20) NOT NULL,
    valorBase DECIMAL(10, 2) NOT NULL,
    CONSTRAINT TIPOCONTRATO_PK PRIMARY KEY(idTipoContrato)
)Engine = INNODB, auto_increment = 1;

-- Tabela de Contrato
CREATE TABLE CONTRATO (
    idContrato INT NOT NULL AUTO_INCREMENT,
    valorContrato DECIMAL(10, 2) NOT NULL,
    formaPagamento VARCHAR(20) NOT NULL,
    clausulasAdicionais VARCHAR(100),
    dataAssinatura DATE NOT NULL,
    idCliente INT NOT NULL,
    idTipoContrato INT NOT NULL,
    CONSTRAINT CONTRATO_PK PRIMARY KEY(idContrato),
    CONSTRAINT CONTRATO_CLIENTE_FK FOREIGN KEY (idCliente) REFERENCES CLIENTE(idCliente),
    CONSTRAINT CONTRATO_TIPOCONTRATO_FK FOREIGN KEY (idTipoContrato) REFERENCES TIPOCONTRATO(idTipoContrato)
)Engine = INNODB, auto_increment = 1;

-- Tabela de Espaco
CREATE TABLE ESPACO (
    idEspaco INT NOT NULL AUTO_INCREMENT,
    nomeEspaco VARCHAR(60) NOT NULL,
    capacidadePessoas INT NOT NULL,
    rua VARCHAR(60) NOT NULL,
    bairro VARCHAR(60) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    cidade VARCHAR(60) NOT NULL,
    valorEspaco DECIMAL(10,2) NOT NULL,
    CONSTRAINT ESPACO_PK PRIMARY KEY(idEspaco)
)Engine = INNODB, auto_increment = 1;

-- Tabela de Buffet
CREATE TABLE BUFFET (
    idBuffet INT NOT NULL AUTO_INCREMENT,
    itensMenu VARCHAR(100) NOT NULL,
    CONSTRAINT BUFFET_PK PRIMARY KEY(idBuffet)
)Engine = INNODB, auto_increment = 1;

-- Tabela de Evento
CREATE TABLE EVENTO (
    idEvento INT NOT NULL AUTO_INCREMENT,
    nomeEvento VARCHAR(60) NOT NULL,
    dataEvento DATE NOT NULL,
    horarioEvento TIME NOT NULL,
    idContrato INT NOT NULL,
    idEspaco INT NOT NULL,
    idBuffet INT NOT NULL,
    quantidadePessoas INT NOT NULL,
    CONSTRAINT EVENTO_PK PRIMARY KEY(idEvento),
    CONSTRAINT EVENTO_CONTRATO_FK FOREIGN KEY (idContrato) REFERENCES CONTRATO(idContrato),
    CONSTRAINT EVENTO_espaco_FK FOREIGN KEY (idEspaco) REFERENCES ESPACO(idEspaco),
    CONSTRAINT EVENTO_buffet_FK FOREIGN KEY (idBuffet) REFERENCES BUFFET(idBuffet)
)Engine = INNODB, auto_increment = 1;

-- Tabela de TelefoneFornecedor
CREATE TABLE telefoneFornecedor (
    idTelefoneFornecedor INT NOT NULL,
    telefoneFornecedor VARCHAR(14) NOT NULL,
    CONSTRAINT TelefoneFornecedor_PK PRIMARY KEY(idTelefoneFornecedor)
)Engine = INNODB;

-- Tabela de Fornecedor
CREATE TABLE FORNECEDOR (
    idFornecedor INT AUTO_INCREMENT,
    nomeFornecedor VARCHAR(60) NOT NULL,
    idTelefoneFornecedor INT NOT NULL,
    agencia VARCHAR(20) NOT NULL,
    banco VARCHAR(60) NOT NULL,
    conta VARCHAR(20) NOT NULL,
    produtosFornecidos VARCHAR(100) NOT NULL,
    CONSTRAINT FORNECEDOR_PK PRIMARY KEY(idFornecedor),
    CONSTRAINT FORNECEDOR_telefoneFornecedor_FK FOREIGN KEY (idTelefoneFornecedor) REFERENCES telefoneFornecedor(idTelefoneFornecedor)
)Engine = INNODB, auto_increment = 1;

-- Tabela de Telefone
CREATE TABLE telefone (
    idTelefone INT NOT NULL AUTO_INCREMENT,
    telefone VARCHAR(14) NOT NULL,
    CONSTRAINT TELEFONE_PK PRIMARY KEY(idTelefone)
)Engine = INNODB, auto_increment = 1;

-- Tabela de Funcionario
CREATE TABLE FUNCIONARIO (
    idFuncionario INT NOT NULL AUTO_INCREMENT,
    nomeFuncionario VARCHAR(60) NOT NULL,
    cpfFuncionario VARCHAR(14) NOT NULL,
    dataNascimento DATE NOT NULL,
    idtelefone INT NOT NULL,
    CONSTRAINT FUNCIONARIO_PK PRIMARY KEY(idFuncionario),
    CONSTRAINT FUNCIONARIO_UK UNIQUE(cpfFuncionario),
    CONSTRAINT FUNCIONARIO_telefone_FK FOREIGN KEY (idTelefone) REFERENCES telefone(idTelefone)
)Engine = INNODB, auto_increment = 1;

-- Tabela de Freelancer
CREATE TABLE FREELANCER (
    idFuncionario INT NOT NULL,
    pagamentoEvento DECIMAL(10, 2) NOT NULL,
    avaliacao INT NOT NULL,
    CONSTRAINT FREELANCER_PK PRIMARY KEY(idFuncionario),
    CONSTRAINT FREELANCER_FUNCIONARIO_FK FOREIGN KEY (idFuncionario) REFERENCES FUNCIONARIO(idFuncionario)
)Engine = INNODB;

-- Tabela de FuncionarioFichado
CREATE TABLE FICHADO (
    idFuncionario INT NOT NULL,
    salario DECIMAL(10, 2) NOT NULL,
    carteiraTrabalho VARCHAR(15) NOT NULL,
    grauEscolaridade VARCHAR(50) NOT NULL,
    tituloEleitor VARCHAR(12) NOT NULL,
    carteiraVacina VARCHAR(200) NOT NULL,
    CONSTRAINT FICHADO_PK PRIMARY KEY(idFuncionario),
    CONSTRAINT FICHADO_FUNCIONARIO_FK FOREIGN KEY (idFuncionario) REFERENCES FUNCIONARIO(idFuncionario)
)Engine = INNODB;

-- Relacionamentos Many-to-Many entre Evento e Funcionarios
CREATE TABLE trabalha (
    idEvento INT NOT NULL,
    idFuncionario INT NOT NULL,
    idContrato INT NOT NULL,
    CONSTRAINT trabalha_EVENTO_FK FOREIGN KEY (idEvento) REFERENCES EVENTO(idEvento),
    CONSTRAINT trabalha_CONTRATO_FK FOREIGN KEY (idContrato) REFERENCES CONTRATO(idContrato),
    CONSTRAINT trabalha_FUNCIONARIO_FK FOREIGN KEY (idFuncionario) REFERENCES FUNCIONARIO(idFuncionario)
)Engine = INNODB;

CREATE TABLE possui (
    idBuffet INT NOT NULL,
    idFornecedor INT NOT NULL,
    CONSTRAINT possui_BUFFET_FK FOREIGN KEY (idBuffet) REFERENCES BUFFET(idBuffet),
    CONSTRAINT possui_Fornecedor_FK FOREIGN KEY (idFornecedor) REFERENCES FORNECEDOR(idFornecedor)
)Engine = INNODB;








 