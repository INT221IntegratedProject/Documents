-- MySQL Script generated by MySQL Workbench
-- Sun May  9 12:41:55 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ProductCase
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ProductCase` ;

-- -----------------------------------------------------
-- Schema ProductCase
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ProductCase` DEFAULT CHARACTER SET utf8 ;
USE `ProductCase` ;

-- -----------------------------------------------------
-- Table `ProductCase`.`brand`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProductCase`.`brand` ;

CREATE TABLE IF NOT EXISTS `ProductCase`.`brand` (
  `codeBrand` INT(5) NOT NULL AUTO_INCREMENT,
  `caseBrand` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`codeBrand`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProductCase`.`products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProductCase`.`products` ;

CREATE TABLE IF NOT EXISTS `ProductCase`.`products` (
  `caseId` INT(5) NOT NULL AUTO_INCREMENT,
  `caseName` VARCHAR(100) NOT NULL,
  `caseDescription` VARCHAR(1000) NOT NULL,
  `casePrice` FLOAT(6,2) NOT NULL,
  `caseImage` VARCHAR(1000) NOT NULL,
  `brand_CodeBrand` INT(5) NOT NULL,
  `caseDate` DATE NOT NULL,
  PRIMARY KEY (`caseId`),
  INDEX `fk_Product_Brand1_idx` (`brand_CodeBrand` ASC) VISIBLE,
  CONSTRAINT `fk_Product_Brand1`
    FOREIGN KEY (`brand_CodeBrand`)
    REFERENCES `ProductCase`.`brand` (`codeBrand`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProductCase`.`color`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProductCase`.`color` ;

CREATE TABLE IF NOT EXISTS `ProductCase`.`color` (
  `codeColor` INT(5) NOT NULL AUTO_INCREMENT,
  `caseColor` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`codeColor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProductCase`.`productcolor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProductCase`.`productcolor` ;

CREATE TABLE IF NOT EXISTS `ProductCase`.`productcolor` (
  `productCaseId` INT(5) NOT NULL,
  `productColorCode` INT(5) NOT NULL,
  INDEX `fk_Product_has_Color_Color1_idx` (`productColorCode` ASC) VISIBLE,
  INDEX `fk_Product_has_Color_Product1_idx` (`productCaseId` ASC) VISIBLE,
  CONSTRAINT `fk_Product_has_Color_Product1`
    FOREIGN KEY (`productCaseId`)
    REFERENCES `ProductCase`.`products` (`caseId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product_has_Color_Color1`
    FOREIGN KEY (`productColorCode`)
    REFERENCES `ProductCase`.`color` (`codeColor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

create role backend;
grant select on ProductCase.* to backend;
grant insert,delete,update on ProductCase.products to backend;
grant insert,delete,update on ProductCase.productcolor to backend;

create user test221@'172.19.0.4' identified by 'test';
grant backend to test221@'172.19.4';