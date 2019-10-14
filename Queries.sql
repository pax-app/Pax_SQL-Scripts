-- --------     << Pax - V1 >>     ------------
-- 
--                    SCRIPT DE PEQUISA (DML)
-- 
-- Data Criacao ...........: 03/10/2019
-- Autor(es) ..............: Lucas Dutra
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: PaxDB
-- 
-- Data Ultima Alteracao ..: 03/10/2019
--   => Consultas em algumas bases para verificação de integridade
-- 
-- PROJETO => 01 Base de Dados
--         => 14 Tabelas
-- -----------------------------------------------------------------

USE PaxDB;

SELECT * FROM GENERAL_CATEGORY; 

SELECT 
    *
FROM
    PROVIDER_CATEGORY
WHERE
    general_category_id = 1;

-- -----------------------------------------------------------------

SELECT 
    *
FROM
    PROVIDER_CATEGORY
WHERE
    general_category_id = 2;
    
-- -----------------------------------------------------------------

SELECT 
    *
FROM
    PROVIDER_CATEGORY
WHERE
    general_category_id = 3;
    
-- -----------------------------------------------------------------
    
SELECT 
    *
FROM
    PROVIDER_CATEGORY
WHERE
    general_category_id = 4;