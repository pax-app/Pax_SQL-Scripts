-- --------     << Pax - V1 >>     ------------
-- 
--                    SCRIPT DE POPULAÇÃO (DML)
-- 
-- Data Criacao ...........: 14/10/2019
-- Autor(es) ..............: Lucas Dutra
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: PaxDB
-- 
-- Data Ultima Alteracao ..: 14/10/2019
--   => Criação reviews e service reviews para popular o banco
-- 
-- PROJETO => 01 Base de Dados
--         => 14 Tabelas
-- -----------------------------------------------------------------


use paxdb;

INSERT INTO REVIEW(charisma_rate, commentary, evaluator_id, evaluated_id) VALUES('4', 'muito legal', 1, 1);
INSERT INTO REVIEW(charisma_rate, commentary, evaluator_id, evaluated_id) VALUES('5', 'Amei demais', 1, 1);
INSERT INTO REVIEW(charisma_rate, commentary, evaluator_id, evaluated_id) VALUES('3', 'Ok', 1, 1);

INSERT INTO SERVICE(service_rate, evaluator_id, evaluated_id, review_id) VALUES('4', 1, 1, 1);
INSERT INTO SERVICE(service_rate, evaluator_id, evaluated_id, review_id) VALUES('4', 1, 1, 2);
INSERT INTO SERVICE(service_rate, evaluator_id, evaluated_id, review_id) VALUES('4', 1, 1, 3);


SELECT * FROM REVIEW;
SELECT * FROM SERVICE;

