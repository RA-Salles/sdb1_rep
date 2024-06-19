-- -------- < dbDetran - descrição em tabelas > --------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 01/05/2024
-- Autor(es) ..............: Ryan Salles
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: bdDETRAN
--
-- PROJETO => 1) DESCRIÇÃO DE TABELAS
--
-- ---------------------------------------------------------

CREATE TABLE PROPRIETARIO (
    cpf VARCHAR PRIMARY KEY,
    nome VARCHAR,
    FK_telefone_telefone_PK INTEGER,
    cidade VARCHAR,
    endereco VARCHAR,
    estado VARCHAR,
    sexo CHARACTER,
    dataNascimento DATE,
    bairro VARCHAR,
    idade INTEGER
);

CREATE TABLE MODELO (
    codigoModelo INTEGER PRIMARY KEY,
    nomeModelo VARCHAR
);

CREATE TABLE VEICULO (
    placa VARCHAR,
    renavam VARCHAR PRIMARY KEY,
    FK_categoria_categoria_PK INTEGER
);

CREATE TABLE INFRACAO_LOCAL_AGENTE (
    idInfracao INTEGER,
    data DATE,
    tipo VARCHAR,
    valor INTEGER,
    velocidade INTEGER,
    hora VARCHAR,
    longitude DOUBLE,
    velMax INTEGER,
    latitude DOUBLE,
    codLocal INTEGER,
    tServico INTEGER,
    dataInicio DATE,
    nome VARCHAR,
    matricula VARCHAR,
    PRIMARY KEY (idInfracao, matricula)
);

CREATE TABLE telefone (
    telefone INTEGER PRIMARY KEY
);

CREATE TABLE categoria (
    codCategoria INTEGER PRIMARY KEY,
    nomeCategoria VARCHAR
);

CREATE TABLE possui (
    fk_PROPRIETARIO_cpf VARCHAR,
    fk_VEICULO_renavam VARCHAR
);

CREATE TABLE possui (
    fk_VEICULO_renavam VARCHAR,
    fk_INFRACAO_LOCAL_AGENTE_idInfracao INTEGER
);

CREATE TABLE tem (
    fk_VEICULO_renavam VARCHAR,
    fk_MODELO_codigoModelo INTEGER
);
 
ALTER TABLE PROPRIETARIO ADD CONSTRAINT FK_PROPRIETARIO_2
    FOREIGN KEY (FK_telefone_telefone_PK???)
    REFERENCES telefone (???)
    ON DELETE NO ACTION;
 
ALTER TABLE VEICULO ADD CONSTRAINT FK_VEICULO_2
    FOREIGN KEY (FK_categoria_categoria_PK???)
    REFERENCES categoria (???)
    ON DELETE SET NULL;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_1
    FOREIGN KEY (fk_PROPRIETARIO_cpf)
    REFERENCES PROPRIETARIO (cpf)
    ON DELETE RESTRICT;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_2
    FOREIGN KEY (fk_VEICULO_renavam)
    REFERENCES VEICULO (renavam)
    ON DELETE RESTRICT;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_1
    FOREIGN KEY (fk_VEICULO_renavam)
    REFERENCES VEICULO (renavam)
    ON DELETE RESTRICT;
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_2
    FOREIGN KEY (fk_INFRACAO_LOCAL_AGENTE_idInfracao, ???)
    REFERENCES INFRACAO_LOCAL_AGENTE (idInfracao, ???)
    ON DELETE RESTRICT;
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_1
    FOREIGN KEY (fk_VEICULO_renavam)
    REFERENCES VEICULO (renavam)
    ON DELETE RESTRICT;
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_2
    FOREIGN KEY (fk_MODELO_codigoModelo)
    REFERENCES MODELO (codigoModelo)
    ON DELETE RESTRICT;