-- -------- < aula 6 - SubConsultas> --------
--
--                    SCRIPT DE SUBCONSULTAS
--
-- Data Criacao ...........: 24/06/2024
-- Autor(es) ..............: Ryan Salles
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula4exer6Evolucao3
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
-- 
-- Ultimas Alteracoes
--   06/05/2024 => Criação de 4 consultas
-- ---------------------------------------------------------

-- SCRIPT DEVE SER RODADO APÓS SCRIPTS FISICO E POPULA DA AULA 4, EXER 6, EVO 3 DE AUTORIA DE LUCAS GABRIEL

--  1) Instrução SQL que realiza uma operação de INSERÇÃO através de uma CONSULTA (SELECT) integrada na instrução INSERT;
-- criação de tabela auxiliar 
CREATE TABLE IF NOT EXISTS TEMP_INF(
	placa				CHAR(7)    	NOT NULL, 
	dataHora			DATETIME	NOT NULL,
	codInfracao			INT(4)		NOT NULL,
	codLocal			INT(6)		NOT NULL,
	matriculaAgente		INT(10)		NOT NULL,
    velocidadeAferida	DECIMAL(3)
);

-- seguinte tabela puxa infrações somete do agente cuja matrícula é 1 e salva na tabela TEMP_INF (infrações temporárias)
INSERT INTO TEMP_INF(placa, dataHora, codInfracao, codLocal, matriculaAgente, velocidadeAferida) 
	SELECT INFRACAO.placa, INFRACAO.dataHora, INFRACAO.codInfracao, INFRACAO.codLocal, INFRACAO.matriculaAgente, INFRACAO.velocidadeAferida
    FROM INFRACAO 
    WHERE INFRACAO.matriculaAgente = 1;

-- SELECT * FROM TEMP_INF; -- Retirar do comentário para ver resultado.

-- 2) Instrução SQL que realiza uma operação de ALTERAÇÃO envolvendo uma CONSULTA (SELECT) integrada na instrução UPDATE;
-- Seguinte instrução muda para 0 toda a velocidade aferida cujo agente tinha uma matrícula menor que 3.
UPDATE INFRACAO 
	SET velocidadeAferida = 0 
    WHERE matriculaAgente in (select matriculaAgente from AGENTE WHERE matriculaAgente < 3);

-- SELECT * FROM INFRACAO;
-- 3) Instrução SQL que realiza uma operação de EXCLUSÃO envolvendo uma CONSULTA (SELECT) integrada na instrução DELETE;
DELETE FROM INFRACAO 
	WHERE velocidadeAferida 
    IN (SELECT velocidadeAferida 
		FROM INFRACAO 
        WHERE velocidadeAferida < 30);
        
-- SELECT * FROM INFRACAO;
-- 4) Instrução SQL que realiza uma CONSULTA (SELECT) possuindo uma SUBCONSULTA (outro SELECT) integrada na instrução SELECT 
-- select puxa das tuplas com grandes velocidades apenas as placas.
SELECT gVel.p as placas 
	FROM (SELECT i.placa as p , i.velocidadeAferida as v 
			from INFRACAO i 
            where velocidadeAferida > 100) AS gVel