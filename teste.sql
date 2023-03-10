-- MySQL Script generated by MySQL Workbench
-- ter 14 fev 2023 17:13:01
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`aluno` (
  `prontuario` VARCHAR(15) NOT NULL,
  `nome` TEXT(150) NOT NULL,
  `data_nascimento` DATE NULL,
  `genero` CHAR(1) NOT NULL DEFAULT 'N',
  `etnia` VARCHAR(45) NULL DEFAULT 'NÃO INFORMADO',
  `altura` FLOAT NULL DEFAULT 0,
  `peso` FLOAT NULL,
  PRIMARY KEY (`prontuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`disciplina` (
  `codigo` VARCHAR(15) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `aluno_prontuario` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_disciplina_aluno_idx` (`aluno_prontuario` ASC) VISIBLE,
  CONSTRAINT `fk_disciplina_aluno`
    FOREIGN KEY (`aluno_prontuario`)
    REFERENCES `mydb`.`aluno` (`prontuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`turma` (
  `codigo` VARCHAR(15) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `semestre` TINYINT(30) NOT NULL,
  `ano` YEAR(4) NOT NULL,
  `professor` VARCHAR(100) NOT NULL,
  `aluno_prontuario` VARCHAR(15) NULL,
  PRIMARY KEY (`codigo`, `aluno_prontuario`),
  INDEX `fk_turma_aluno1_idx` (`aluno_prontuario` ASC) VISIBLE,
  CONSTRAINT `fk_turma_aluno1`
    FOREIGN KEY (`aluno_prontuario`)
    REFERENCES `mydb`.`aluno` (`prontuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`registro_nota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`registro_nota` (
)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
