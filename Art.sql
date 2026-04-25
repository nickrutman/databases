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

insert into artist
	(1, 'Vincent', null, 'van Gogh', 1853, 1890, 'France', 'n')
    (2, 'Rembrandt', 'Harmenszoon', 'van Rijn', 1606, 1699, 'Netherlands', 'n')
    (3, 'Leonardo', null, 'da Vinci', 1452, 1519, 'Italy', 'n') 
    (4, 'Venture', 'Lonzo', 'Coy', 1965, null, 'United States', 'y')
    (5,'Deborah', null, 'Gill', 1970, null, 'United States', 'y')
    (6, 'Claude', null, 'Monet', 1840, 1926, 'France', 'n')
    (7, 'Pablo', null, 'Picasso', 1904, 1973, 'Spain', 'n')
    (8, 'Michelangelo', 'di Lodovico', 'Simoni', 1475, 1564, 'Italy', 'n')
    
insert into artwork
	(1, 'Irises', 1889, 'Impressionism', 'Oil', 'irises.jpg', 1)
    (2, 'The Starry Night', 1889, 'Post-Impressionism', 'Oil', 'starrynight.jpg', 1)
    (3, 'Sunflowers', 1888, 'Post-Impressionism', 'Oil', 'sunflowers.jpg', 1)
    (4, 'Night Watch', 1642, 'Baroque', 'Oil', 'nightwatch.jpg', 2)
    (5, 'Storm on the Sea of Galilee', 1633, 'Dutch Golden Age', 'Oil', 'stormgalilee.jpg', 2)
    (6, 'Head of a Woman', 1508, 'High Renaissance', 'Oil', 'headwoman.jpg', 3)
    (7, 'Last Supper', 1498, 'Renaissance', 'Tempra', 'lastsupper.jpg', 3)
    (8, 'Mona Lisa', 1517, 'Renaissance', 'Oil', 'monalisa.jpg', 3)
    (9, 'Hillside Stream', 2005, 'Modern', 'Oil', 'hillsidestream.jpg', 4)
    (10, 'Old Barn', 1992, 'Modern', 'Oil', 'oldbarn.jpg', 4)
    (11, 'Beach Baby', 1999, 'Modern', 'Watercolor', 'beachbaby.jpg', 5)
    (12, 'Women in the Garden', 1866, 'Impressionism', 'Oil', 'womengarden.jpg', 6)
    (13, 'Old Guitarist', 1904, 'Modern', 'Oil', 'guitarist.jpg', 7)
    
insert into keyword
	(1, 'flowers')
    (2, 'blue, landscape')
    (3, 'flowers')
    (4, 'girl, people, battle')
    (5, 'boat, water, people, Christ')
    (6, 'girl, people')
    (7'food, people, Christ')
    (8, 'girl, people')
    (9, 'water, landscape')
    (10, 'landscape')
    (11, 'water, people, baby')
    (12, 'landscape, people, flowers')
    (13, 'blue, people')
    