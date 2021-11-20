SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema siteCiclismo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema siteCiclismo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS siteCiclismo DEFAULT CHARACTER SET utf8 ;
USE siteCiclismo ;

-- -----------------------------------------------------
-- Table ciclista
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ciclista (
  idciclista INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(150) NOT NULL,
  idade INT NOT NULL,
  nomeUsuario VARCHAR(45) NOT NULL,
  senha VARCHAR(45) NOT NULL,
  sexo VARCHAR(20) NOT NULL,
  PRIMARY KEY (idciclista),
  UNIQUE INDEX senha_UNIQUE (senha ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table ciclismo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ciclismo (
  idciclismo INT NOT NULL AUTO_INCREMENT,
  rota VARCHAR(500) NOT NULL,
  data DATE NOT NULL,
  horariosSaidaChegada VARCHAR(45) NOT NULL,
  numeroVagas INT NOT NULL,
  requisitosParaParticipar VARCHAR(45) NULL,
  PRIMARY KEY (idciclismo))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table chat
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS chat (
  idchat INT NOT NULL,
  mensagem VARCHAR(200) NULL,
  ciclista_idciclista INT NOT NULL,
  ciclismo_idciclismo INT NOT NULL,
  PRIMARY KEY (idchat, ciclista_idciclista, ciclismo_idciclismo),
  INDEX fk_chat_ciclista1_idx (ciclista_idciclista ASC) VISIBLE,
  INDEX fk_chat_ciclismo1_idx (ciclismo_idciclismo ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table ciclista_has_ciclismo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ciclista_has_ciclismo (
  ciclista_idciclista INT NOT NULL,
  ciclismo_idciclismo INT NOT NULL,
  PRIMARY KEY (ciclista_idciclista, ciclismo_idciclismo),
  INDEX fk_ciclista_has_ciclismo_ciclismo1_idx (ciclismo_idciclismo ASC) VISIBLE,
  INDEX fk_ciclista_has_ciclismo_ciclista_idx (ciclista_idciclista ASC) VISIBLE)
ENGINE = InnoDB;
