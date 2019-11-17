-- -----------------------------     << Pax - V4 >>     -----------------------------
-- 
--                    SCRIPT DE CRIACAO (DDL)
-- 
-- Data Criacao ...........: 24/09/2019
-- Autor(es) ..............: Rogério Júnior, Youssef Muhamad, Lucas Dutra e Fabiana
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: PaxDB
-- 
-- Data Ultima Alteracao ..: 17/11/2019
--   => Atualização do script do banco
--   => Adição de 'description' na tabela GENERAL_CATEGORY 
--   => Remoção da tabela MESSAGE (agora no Firebase)
--   => Adição do canceled_motive na tabela PAX
-- 
-- PROJETO => 01 Base de Dados
--         => 14 Tabelas
-- ------------------------------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS PaxDB
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

USE PaxDB;

CREATE TABLE USER (
    user_id   INT (11) NOT NULL AUTO_INCREMENT,
    name  VARCHAR (100) NOT NULL,
    email  VARCHAR (50) NOT NULL,
    cpf  VARCHAR (11) NOT NULL,
    password  VARCHAR (255) NOT NULL,
    url_avatar  VARCHAR (300) NOT NULL,
    
    CONSTRAINT PAX_PK PRIMARY KEY ( user_id ),
    CONSTRAINT PAX_UK UNIQUE ( email )

) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE PROVIDER
( 
    provider_id   INT (11) NOT NULL AUTO_INCREMENT,
    user_id   INT (11) NOT NULL,
    bio  VARCHAR (500) DEFAULT NULL,
    minimum_price  DOUBLE NOT NULL,
    maximum_price  DOUBLE NOT NULL,
    url_rg_photo  VARCHAR (300) NOT NULL,
    rg_number  INT (10) NOT NULL,

    CONSTRAINT PROVIDER_PK PRIMARY KEY ( provider_id ),
    CONSTRAINT PROVIDER_UK UNIQUE (user_id),

    CONSTRAINT  PROVIDER_USER_FK  FOREIGN KEY ( user_id )
        REFERENCES  USER ( user_id )
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE REVIEW
( 
    review_id   INT (11) NOT NULL AUTO_INCREMENT,
    charisma_rate  ENUM ('1','2','3','4','5') NOT NULL,
    commentary  VARCHAR (300) DEFAULT NULL,
    evaluator_id   INT (11) NOT NULL,
    evaluated_id   INT (11) NOT NULL,

    CONSTRAINT  REVIEW_PK PRIMARY KEY ( review_id ),

    CONSTRAINT  REVIEW_PROVIDER_FK  FOREIGN KEY ( evaluator_id )
        REFERENCES  PROVIDER ( provider_id ),
    CONSTRAINT  REVIEW_USER_FK  FOREIGN KEY ( evaluated_id )
        REFERENCES  USER ( user_id )
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE SERVICE
( 
    review_service_id   INT (11) NOT NULL AUTO_INCREMENT,
    service_rate  ENUM ('1','2','3','4','5') NOT NULL,
    evaluator_id   INT (11) NOT NULL,
    evaluated_id   INT (11) NOT NULL,
    review_id   INT (11) NOT NULL,

    CONSTRAINT SERVICE_PK PRIMARY KEY ( review_service_id ),

    CONSTRAINT  SERVICE_USER_FK  FOREIGN KEY ( evaluator_id )
        REFERENCES  USER ( user_id ),
    CONSTRAINT  SERVICE_PROVIDER_FK  FOREIGN KEY ( evaluated_id )
        REFERENCES  PROVIDER ( provider_id ),
    CONSTRAINT SERVICE_REVIEW_FK  FOREIGN KEY ( review_id )
        REFERENCES  REVIEW ( review_id )
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE ADDRESS
( 
    address_id   INT (11) NOT NULL AUTO_INCREMENT,
    street  VARCHAR (30) NOT NULL,
    neighborhood  VARCHAR (30) NOT NULL,
    number   INT (5) NOT NULL,
    complement  VARCHAR (50) NULL,
    city  VARCHAR (20) NOT NULL,
    cep  BIGINT (8) NOT NULL,
    state  char (2) NOT NULL,
    reference_point  VARCHAR (50) NULL,

    CONSTRAINT ADDRESS_PK PRIMARY KEY ( address_id )
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE lives
(
    user_id   INT (11) NOT NULL,
    address_id   INT (11) NOT NULL,

    CONSTRAINT lives_PK PRIMARY KEY ( user_id , address_id ),
    
    CONSTRAINT  lives_ADDRESS_FK  FOREIGN KEY ( address_id )
        REFERENCES  ADDRESS ( address_id ),
    CONSTRAINT  lives_USER_FK  FOREIGN KEY ( user_id )
        REFERENCES  USER ( user_id )
) ENGINE = InnoDB, DEFAULT CHARSET utf8 ;

CREATE TABLE CHAT
(   
    chat_id   INT (11) NOT NULL AUTO_INCREMENT,
    user_id   INT (11) NOT NULL,
    provider_id   INT (11) NOT NULL,
    user_address   INT (11) DEFAULT NULL,

    CONSTRAINT CHAT_PK PRIMARY KEY ( chat_id ),

    CONSTRAINT  CHAT_ADDRESS_FK  FOREIGN KEY ( user_address )
        REFERENCES  ADDRESS ( address_id ),
    CONSTRAINT  CHAT_PROVIDER_FK  FOREIGN KEY ( provider_id )
        REFERENCES  PROVIDER ( provider_id ),
    CONSTRAINT  CHAT_USER_FK  FOREIGN KEY ( user_id )
        REFERENCES  USER ( user_id )
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE PAX
( 
    pax_id   INT (11) NOT NULL AUTO_INCREMENT,
    price  DOUBLE NOT NULL,
    name  VARCHAR (150) NOT NULL,
    date  DATE NOT NULL,
    description  VARCHAR (500) NOT NULL,
    status  ENUM ('F','P','C','I') DEFAULT NULL,
    user_id   INT (11) NOT NULL,
    provider_id   INT (11) NOT NULL,
    chat_id   INT (11) DEFAULT NULL,
    address_id   INT (11) NOT NULL,
    canceled_motive varchar(500) DEFAULT NULL,

    CONSTRAINT PAX_PK PRIMARY KEY ( pax_id ),
    CONSTRAINT PAX_UK UNIQUE  ( chat_id ),

    CONSTRAINT  PAX_ADDRESS_FK  FOREIGN KEY ( address_id ) 
        REFERENCES  ADDRESS ( address_id ),
    CONSTRAINT  PAX_CHAT_FK  FOREIGN KEY ( chat_id ) 
        REFERENCES  CHAT ( chat_id ) ON DELETE SET NULL,
    CONSTRAINT  PAX_PROVIDER_FK  FOREIGN KEY ( provider_id ) 
        REFERENCES  PROVIDER ( provider_id ),
    CONSTRAINT  PAX_USER_FK  FOREIGN KEY ( user_id )
        REFERENCES  USER ( user_id )
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE pax_photos
( 
   pax_id   INT (11) DEFAULT NULL,
   photo_id  VARCHAR (50) DEFAULT NULL,

  CONSTRAINT  pax_photos_PAX  FOREIGN KEY ( pax_id )
    REFERENCES  PAX ( pax_id )
)ENGINE = InnoDB, DEFAULT CHARSET utf8 ;

CREATE TABLE REPORT
(   
    report_id   INT (11) NOT NULL AUTO_INCREMENT,
    description  VARCHAR (500) NOT NULL,
    status  ENUM ('A','R','P') NOT NULL,
    pax_id   INT (11) NOT NULL,

    CONSTRAINT REPORT_PK PRIMARY KEY ( report_id ),

    CONSTRAINT  REPORT_PAX_FK  FOREIGN KEY ( pax_id )
        REFERENCES  PAX ( pax_id )
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE report_photos
(  
    report_id   INT (11) NOT NULL,
    photo  VARCHAR (50) NOT NULL,

    CONSTRAINT  report_photos_REPORT_FK  FOREIGN KEY ( report_id )
        REFERENCES  REPORT ( report_id )
)ENGINE = InnoDB, DEFAULT CHARSET utf8 ;

CREATE TABLE GENERAL_CATEGORY
(
    general_category_id   INT (11) NOT NULL AUTO_INCREMENT,
    name  VARCHAR (50)   NOT NULL,
    description  VARCHAR (500) NOT NULL,

    CONSTRAINT GENERAL_CATEGORY_PK PRIMARY KEY ( general_category_id )
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE PROVIDER_CATEGORY
(   
    provider_category_id INT (11) NOT NULL AUTO_INCREMENT,
    name  VARCHAR (50) NOT NULL,
    general_category_id INT (11) NOT NULL,

    CONSTRAINT PROVIDER_CATEGORY_PK PRIMARY KEY ( provider_category_id ),

    CONSTRAINT  PROVIDER_CATEGORY_GENERAL_CATEGORY_FK  FOREIGN KEY ( general_category_id )
        REFERENCES  GENERAL_CATEGORY ( general_category_id )
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE works
(   
    provider_category_id   INT (11) NOT NULL,
    provider_id   INT (11) NOT NULL,

    CONSTRAINT works_PK PRIMARY KEY ( provider_id , provider_category_id ),

    CONSTRAINT  works_PROVIDER_CATEGORY_FK  FOREIGN KEY ( provider_category_id )
        REFERENCES  PROVIDER_CATEGORY ( provider_category_id ),
    CONSTRAINT  works_PROVIDER_FK  FOREIGN KEY ( provider_id )
        REFERENCES  PROVIDER ( provider_id )
)ENGINE = InnoDB, DEFAULT CHARSET utf8 ;
