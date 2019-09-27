-- --------     << Pax - V1 >>     ------------
-- 
--                    SCRIPT DE POPULAÇÃO (DML)
-- 
-- Data Criacao ...........: 24/09/2019
-- Autor(es) ..............: Rogério Júnior, Youssef Muhamad e Lucas Dutra
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: bdPax
-- 
-- Data Ultima Alteracao ..: 24/09/2019
--   => Criação do modelo físico do banco
-- 
-- PROJETO => 01 Base de Dados
--         => 14 Tabelas
-- -----------------------------------------------------------------
USE PaxDB;

-- INSERT INTO USER 
--             (name, 
--              email, 
--              cpf, 
--              password, 
--              url_avatar) 
-- VALUES      ('youssef', 
--              'email@gmail.com', 
--              9595877, 
--              'avs', 
--              'url.com'); 
             
-- ------------------------------------------------------------

-- INSERT INTO PROVIDER 
--             (bio, 
--              minimum_price, 
--              maximum_price, 
--              url_rg_photo, 
--              issuing_organ, 
--              uf, 
--              number, 
--              user_id) 
-- VALUES      ('bio', 
--              12.34, 
--              100.40, 
--              'url.com', 
--              'ssp-df', 
--              '23', 
--              123213333, 
--              1); 

-- ------------------------------------------------------------

-- INSERT INTO REVIEW 
--             (evaluated_id, 
--              evaluator_id, 
--              charisma_rate, 
--              commentary) 
-- VALUES     (1, 
--             1, 
--             '5', 
--             'muito bom'); 
            
-- ------------------------------------------------------------

-- INSERT INTO SERVICE 
--             (evaluated_id, 
--              evaluator_id, 
--              service_rate, 
--              review_id) 
-- VALUES     (1, 
--             1, 
--             '5', 
--             1); 
            
-- ------------------------------------------------------------

-- INSERT INTO ADDRESS 
--             (cep, 
--              street, 
--              neighborhood, 
--              city, 
--              state, 
--              number, 
--              complement, 
--              reference_point) 
-- VALUES     (71965888, 
--             'rua', 
--             'bairro', 
--             'cidadezinha', 
--             'D', 
--             7, 
--             'apt 2220', 
--             'palacio');
            
-- ------------------------------------------------------------
            
-- INSERT INTO lives 
--             (user_id, 
--              address_id) 
-- VALUES     (1, 
--             1); 
            
-- ------------------------------------------------------------
    
            
-- INSERT INTO CHAT 
--             (user_id, 
--              provider_id) 
-- VALUES     (1, 
--             1); 
-- 
-- ------------------------------------------------------------

-- INSERT INTO MESSAGE 
--             (chat_id, 
--              sender_id, 
--              date_time_sent, 
--              text_message) 
-- VALUES     (1, 
--             1, 
--             '2008-01-01 00:00:01', 
--             'ola'); 
            
-- ------------------------------------------------------------

-- INSERT INTO PAX 
--             (user_id, 
--              provider_id, 
--              chat_id, 
--              address_id, 
--              price, 
--              name, 
--              description, 
--              date) 
-- VALUES     (1, 
--             1, 
--             1, 
--             1, 
--             26.99, 
--             'contrato pintura', 
--             'pintura de casa', 
--             '2019-09-01'); 

-- ------------------------------------------------------------

-- INSERT INTO pax_photos 
--             (pax_id, 
--              photo_id) 
-- VALUES     (1, 
--             'loa.com'); 

-- ------------------------------------------------------------

-- INSERT INTO REPORT 
--             (pax_id, 
--              status, 
--              description) 
-- VALUES     (1, 
--             'P', 
--             'muito ruim'); 


-- ------------------------------------------------------------

-- INSERT INTO report_photos 
--             (report_id, 
--              photo) 
-- VALUES     (1, 
--             'op/op');     



INSERT INTO GENERAL_CATEGORY 
            (name) 
VALUES     ('general'); 

-- ------------------------------------------------------------

INSERT INTO PROVIDER_CATEGORY 
            (name, 
             general_category_id) 
VALUES     ('provider', 
            1); 

-- ------------------------------------------------------------

INSERT INTO works 
            (provider_category_id, 
             provider_id) 
VALUES     (1, 
            1);         