-- --------     << Pax - V1 >>     ------------
-- 
--                    SCRIPT DE POPULAÇÃO (DML)
-- 
-- Data Criacao ...........: 26/09/2019
-- Autor(es) ..............: Lucas Dutra
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: PaxDB
-- 
-- Data Ultima Alteracao ..: 27/09/2019
--   => Criação categorias necessárias para o serviço de category
-- 
-- PROJETO => 01 Base de Dados
--         => 14 Tabelas
-- -----------------------------------------------------------------

USE PaxDB;

INSERT INTO GENERAL_CATEGORY(name) VALUES('Assistência Técnica');
INSERT INTO GENERAL_CATEGORY(name) VALUES('Reformas');
INSERT INTO GENERAL_CATEGORY(name) VALUES('Serviços Domésticos');
INSERT INTO GENERAL_CATEGORY(name) VALUES('Design e Tecnologia');

-- ---------------------------------------------------------------------------------------------------------------------------------

INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(1, 'Aparelho de Som');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(1, 'Ar Condicionado');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(1, 'Cabeamento e Redes');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(1, 'Celular');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(1, 'Computador Desktop');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(1, 'Câmera');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(1, 'Eletrodomésticos');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(1, 'Geladeira e Freezer');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(1, 'Lava Louça');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(1, 'Lava Roupa');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(1, 'Notebooks e Laptops');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(1, 'Tablet');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(1, 'Televisão');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(1, 'Vídeo Game');

-- ---------------------------------------------------------------------------------------------------------------------------------

INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(2, 'Antenista');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(2, 'Arquiteto');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(2, 'Chaveiro');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(2, 'Decorador');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(2, 'Desentupidor');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(2, 'Eletricista');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(2, 'Encanador');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(2, 'Engenheiro');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(2, 'Marceneiro');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(2, 'Montador de Móveis');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(2, 'Pedreiro');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(2, 'Pintor');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(2, 'Vidraceiro');

-- ---------------------------------------------------------------------------------------------------------------------------------

INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(3, 'Adestrador de Cães');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(3, 'Babá');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(3, 'Cozinheira');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(3, 'Cuidador de Idoso');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(3, 'Diarista');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(3, 'Limpeza de Piscina');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(3, 'Motorista');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(3, 'Passadeira');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(3, 'Passeador de Cães');

-- ---------------------------------------------------------------------------------------------------------------------------------

INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(4, 'Animação');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(4, 'Aplicativos para Celular');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(4, 'Autocad e Modelagem 3D');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(4, 'Convites');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(4, 'Criação de Logos');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(4, 'Desenvolvimento de Sites');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(4, 'Edição de Fotos');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(4, 'Ilustração');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(4, 'Marketing Online');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(4, 'Web Design');
INSERT INTO PROVIDER_CATEGORY(general_category_id, name) VALUES(4, 'Áudio e Vídeo');
