-- --------     << Pax - V1 >>     ------------
-- 
--                    SCRIPT DE CRIACAO (DDL)
-- 
-- Data Criacao ...........: 24/09/2019
-- Autor(es) ..............: Rogério Júnior, Youssef Muhamad e Lucas Dutra
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: PaxDB
-- 
-- Data Ultima Alteracao ..: 24/09/2019
--   => Criação do modelo físico do banco
-- 
-- PROJETO => 01 Base de Dados
--         => 14 Tabelas
-- -----------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS PaxDB
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;
USE PaxDB;

CREATE TABLE IF NOT EXISTS USER (
    user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(50) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    password VARCHAR(255) NOT NULL,
    url_avatar VARCHAR(50) NOT NULL,
    UNIQUE (cpf, email)
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8, DEFAULT CHARSET utf8 ;

CREATE TABLE IF NOT EXISTS PROVIDER (
    provider_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    bio VARCHAR(500),
    minimum_price DOUBLE NOT NULL,
    maximum_price DOUBLE NOT NULL,
    url_rg_photo VARCHAR(50) NOT NULL,
    number BIGINT NOT NULL,
    user_id INT NOT NULL,

    CONSTRAINT PROVIDER_UK UNIQUE (user_id),

    CONSTRAINT PROVIDER_USER_FK FOREIGN KEY (user_id)
        REFERENCES USER(user_id)
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE IF NOT EXISTS REVIEW (
    review_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    charisma_rate ENUM('1','2','3','4','5') NOT NULL,
    commentary VARCHAR(300),
    evaluator_id INT NOT NULL,
    evaluated_id INT NOT NULL,

    CONSTRAINT REVIEW_USER_FK FOREIGN KEY (evaluated_id)
        REFERENCES USER(user_id),
    CONSTRAINT REVIEW_PROVIDER_FK FOREIGN KEY (evaluator_id)
        REFERENCES PROVIDER(provider_id)
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE IF NOT EXISTS SERVICE (
    review_service_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    service_rate ENUM('1','2','3','4','5') NOT NULL,
    evaluator_id INT NOT NULL,
    evaluated_id INT NOT NULL,
    review_id INT NOT NULL,

    CONSTRAINT SERVICE_REVIEW_FK FOREIGN KEY (review_id)
        REFERENCES REVIEW(review_id)
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE IF NOT EXISTS ADDRESS (
    address_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(30) NOT NULL,
    neighborhood VARCHAR(30) NOT NULL,
    number INT NOT NULL,
    complement VARCHAR(50),
    city VARCHAR(20) NOT NULL,
    cep BIGINT NOT NULL,
    state CHAR(2) NOT NULL,
    reference_point VARCHAR(50)
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE IF NOT EXISTS lives (
    user_id INT NOT NULL,
    address_id INT NOT NULL,

    CONSTRAINT lives_USER_FK FOREIGN KEY (user_id)
        REFERENCES USER(user_id),
    CONSTRAINT lives_ADDRESS_FK FOREIGN KEY (address_id)
        REFERENCES ADDRESS(address_id),
        
	PRIMARY KEY(user_id, address_id)
) ENGINE = InnoDB, DEFAULT CHARSET utf8 ;

CREATE TABLE IF NOT EXISTS CHAT (
    chat_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    provider_id INT NOT NULL,

    CONSTRAINT CHAT_USER_FK FOREIGN KEY (user_id)
        REFERENCES USER(user_id),
    CONSTRAINT CHAT_PROVIDER_FK FOREIGN KEY (provider_id)
        REFERENCES PROVIDER(provider_id)
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE IF NOT EXISTS MESSAGE (
    message_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sender ENUM('U','P') NOT NULL,
    date_time_sent TIMESTAMP NOT NULL,
    text_message VARCHAR(500) NOT NULL,
    chat_id INT NOT NULL,

    CONSTRAINT MESSAGE_CHAT_FK FOREIGN KEY (chat_id)
        REFERENCES CHAT(chat_id) ON DELETE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE IF NOT EXISTS PAX (
    pax_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    price DOUBLE NOT NULL,
    name VARCHAR(150) NOT NULL,
    date DATE NOT NULL,
    description VARCHAR(500) NOT NULL,
    status ENUM('F','P','C') NOT NULL,
    user_id INT NOT NULL,
    provider_id INT NOT NULL,
    chat_id INT NOT NULL,
    address_id INT NOT NULL,

    CONSTRAINT PAX_USER_FK FOREIGN KEY (user_id)
        REFERENCES USER(user_id),
    CONSTRAINT PAX_PROVIDER_FK FOREIGN KEY (provider_id)
        REFERENCES PROVIDER(provider_id),
    CONSTRAINT PAX_CHAT_FK FOREIGN KEY (chat_id)
        REFERENCES CHAT(chat_id),
    CONSTRAINT PAX_ADDRESS_FK FOREIGN KEY (address_id)
        REFERENCES ADDRESS(address_id)
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE IF NOT EXISTS pax_photos (
    pax_id INT,
    photo_id VARCHAR(50),

    CONSTRAINT pax_photos_PAX FOREIGN KEY (pax_id)
        REFERENCES PAX(pax_id)
)ENGINE = InnoDB, DEFAULT CHARSET utf8 ;

CREATE TABLE IF NOT EXISTS REPORT (
    report_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(500) NOT NULL,
    status ENUM('A','R','P') NOT NULL,
    pax_id INT NOT NULL,

    CONSTRAINT REPORT_PAX_FK FOREIGN KEY (pax_id)
        REFERENCES PAX(pax_id)
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE IF NOT EXISTS report_photos (
    report_id INT NOT NULL,
    photo VARCHAR(50) NOT NULL,

    CONSTRAINT report_photos_REPORT_FK FOREIGN KEY (report_id)
        REFERENCES REPORT(report_id)
)ENGINE = InnoDB, DEFAULT CHARSET utf8 ;

CREATE TABLE IF NOT EXISTS GENERAL_CATEGORY (
    general_category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE IF NOT EXISTS PROVIDER_CATEGORY (
    provider_category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    general_category_id INT NOT NULL,

    CONSTRAINT PROVIDER_CATEGORY_GENERAL_CATEGORY_FK 
        FOREIGN KEY (general_category_id)
        REFERENCES GENERAL_CATEGORY(general_category_id)
) ENGINE = InnoDB AUTO_INCREMENT = 1, DEFAULT CHARSET utf8 ;

CREATE TABLE IF NOT EXISTS works (
    provider_category_id INT NOT NULL,
    provider_id INT NOT NULL,

	PRIMARY KEY  (provider_id, provider_category_id),

    CONSTRAINT works_PROVIDER_CATEGORY_FK
        FOREIGN KEY (provider_category_id)
        REFERENCES PROVIDER_CATEGORY(provider_category_id),

    CONSTRAINT works_PROVIDER_FK FOREIGN KEY (provider_id)
        REFERENCES PROVIDER(provider_id)
)ENGINE = InnoDB, DEFAULT CHARSET utf8 ;