

CREATE DATABASE aula6exer4;

USE aula6exer4;


CREATE TABLE EMPREGADO (
    idEmpregado BIGINT PRIMARY KEY,
    nome VARCHAR(128),
    sexo ENUM('M', 'F'),
    salario FLOAT(10,2),
    dataNascimento DATE,
    idDepartamento BIGINT,
    CONSTRAINT FK_DEPARTAMENTO
    FOREIGN KEY (idDepartamento)
    REFERENCES DEPARTAMENTO (idDepartamento)
);

CREATE TABLE DEPENDENTE (
    idDependente BIGINT PRIMARY KEY,
    nome VARCHAR(128),
    sexo ENUM('M', 'F'),
    dataNascimento DATE,
    tipo VARCHAR(128),
    idEmpregado BIGINT,
    CONSTRAINT FK_EMPREGADO_DEPARTAMENTO FOREIGN KEY (idEmpregado) REFERENCES EMPREGADO(idEmpregado) ON DELETE RESTRICT
);

CREATE TABLE LOCALIZACAO (
    idLocalizacao BIGINT PRIMARY KEY,
    rua VARCHAR(128),
    bairro VARCHAR(128),
    numero INT,
    idDepartamento BIGINT,
    CONSTRAINT FK_LOCALIZACAO_DEPARTAMENTO FOREIGN KEY (idDepartamento)
    REFERENCES DEPARTAMENTO(idDepartamento);
);

CREATE TABLE PROJETO (
    idProjeto BIGINT PRIMARY KEY,
    nome VARCHAR(128),
    rua VARCHAR(128),
    bairro VARCHAR(128),
    numero INT,
    idDepartamento BIGINT,
    CONSTRAINT FK_PROJETO_DEPARTAMENTO FOREIGN KEY (idDepartamento) REFERENCES DEPARTAMENTO(idDepartamento) ON DELETE RESTRICT
); ENGINE Innodb

CREATE TABLE supervisiona (
    idEmpregado_supervisionado BIGINT,
    idEmpregado_supervisor BIGINT,
    CONSTRAINT FK_supervisiona_1
    FOREIGN KEY (idEmpregado_supervisionado)
    REFERENCES EMPREGADO(idEmpregado)
    ON DELETE RESTRICT,
    CONSTRAINT FK_supervisiona_2
    FOREIGN KEY (fk_EMPREGADO_supervisor)
    REFERENCES EMPREGADO (idEmpregado)
    ON DELETE RESTRICT;
);

CREATE TABLE executa (
    idEmpregado BIGINT,
    idProjeto BIGINT,
    horaSemana INT
);

CREATE TABLE DEPARTAMENTO (
    idDepartamento BIGINT PRIMARY KEY,
    nome VARCHAR(128) UNIQUE
);

CREATE TABLE gerencia (
    idDepartamento BIGINT,
    idEmpregado BIGINT,
    dataGerente DATE
);

 
ALTER TABLE executa ADD CONSTRAINT FK_executa_1
    FOREIGN KEY (idEmpregado)
    REFERENCES EMPREGADO(idEmpregado)
    ON DELETE RESTRICT;
 
ALTER TABLE executa ADD CONSTRAINT FK_executa_2
    FOREIGN KEY (idProjeto)
    REFERENCES PROJETO(idProjeto)
    ON DELETE RESTRICT;
 
ALTER TABLE gerencia ADD CONSTRAINT FK_gerencia_1
    FOREIGN KEY (idDepartamento)
    REFERENCES DEPARTAMENTO (idDepartamento);
 
ALTER TABLE gerencia ADD CONSTRAINT FK_gerencia_2
    FOREIGN KEY (idEmpregado)
    REFERENCES EMPREGADO (idEmpregado);