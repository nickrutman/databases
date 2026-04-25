-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Art
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Art` ;

-- -----------------------------------------------------
-- Schema Art
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Art` DEFAULT CHARACTER SET utf8 ;
USE `Art` ;

-- -----------------------------------------------------
-- Table `Art`.`artist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Art`.`artist` ;

CREATE TABLE IF NOT EXISTS `Art`.`artist` (
  `idartist` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `middle_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `dob` INT NULL,
  `dod` INT NULL,
  `country` VARCHAR(45) NULL,
  `local` ENUM('y', 'n') NULL,
  PRIMARY KEY (`idartist`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Art`.`artwork`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Art`.`artwork` ;

CREATE TABLE IF NOT EXISTS `Art`.`artwork` (
  `idartwork` INT NOT NULL,
  `title` VARCHAR(45) NULL,
  `year` INT NULL,
  `period` VARCHAR(45) NULL,
  `type` VARCHAR(45) NULL,
  `file` VARCHAR(45) NULL,
  `artist_idartist` INT NOT NULL,
  PRIMARY KEY (`idartwork`),
  INDEX `fk_artwork_artist1_idx` (`artist_idartist` ASC) VISIBLE,
  CONSTRAINT `fk_artwork_artist1`
    FOREIGN KEY (`artist_idartist`)
    REFERENCES `Art`.`artist` (`idartist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Art`.`Keyword`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Art`.`Keyword` ;

CREATE TABLE IF NOT EXISTS `Art`.`Keyword` (
  `idKeyword` INT NOT NULL,
  `Keyword` VARCHAR(45) NULL,
  PRIMARY KEY (`idKeyword`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Art`.`artwork_w_keyword`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Art`.`artwork_w_keyword` ;

CREATE TABLE IF NOT EXISTS `Art`.`artwork_w_keyword` (
  `Keyword_idKeyword` INT NOT NULL,
  `artwork_idartwork` INT NOT NULL,
  PRIMARY KEY (`Keyword_idKeyword`, `artwork_idartwork`),
  INDEX `fk_artwork_keyword_artwork1_idx` (`artwork_idartwork` ASC) VISIBLE,
  CONSTRAINT `fk_artwork_keyword_Keyword1`
    FOREIGN KEY (`Keyword_idKeyword`)
    REFERENCES `Art`.`Keyword` (`idKeyword`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_artwork_keyword_artwork1`
    FOREIGN KEY (`artwork_idartwork`)
    REFERENCES `Art`.`artwork` (`idartwork`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
