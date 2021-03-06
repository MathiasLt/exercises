-- MySQL Script generated by MySQL Workbench
-- Thu 18 Jan 2018 11:08:31 CET
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema exercise4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema exercise4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `exercise4` DEFAULT CHARACTER SET utf8 ;
USE `exercise4` ;

-- -----------------------------------------------------
-- Table `exercise4`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise4`.`Payment` (
  `idPayment` INT NOT NULL AUTO_INCREMENT,
  `Details` VARCHAR(45) NULL,
  `Method` VARCHAR(45) NULL,
  PRIMARY KEY (`idPayment`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise4`.`Bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise4`.`Bill` (
  `idBill` INT NOT NULL AUTO_INCREMENT,
  `Total` DOUBLE NULL,
  PRIMARY KEY (`idBill`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise4`.`Payment_Bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise4`.`Payment_Bill` (
  `idPayment_Bill` INT NOT NULL AUTO_INCREMENT,
  `idPayment` INT NULL,
  `idBill` INT NULL,
  `idMedical` INT NULL,
  PRIMARY KEY (`idPayment_Bill`),
  INDEX `fk_Payment_Bill_2_idx` (`idBill` ASC),
  INDEX `fk_Payment_Bill_1_idx` (`idPayment` ASC),
  CONSTRAINT `fk_Payment_Bill_1`
    FOREIGN KEY (`idPayment`)
    REFERENCES `exercise4`.`Payment` (`idPayment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Payment_Bill_2`
    FOREIGN KEY (`idBill`)
    REFERENCES `exercise4`.`Bill` (`idBill`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise4`.`Doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise4`.`Doctor` (
  `idDoctor` INT NOT NULL AUTO_INCREMENT,
  `Doctor_Name` VARCHAR(45) NULL,
  `Doctor_date_of_birth` DATE NULL,
  `Doctor_Address` VARCHAR(45) NULL,
  `Doctor_phone_number` INT(13) NULL,
  `Salary` INT NULL,
  PRIMARY KEY (`idDoctor`),
  INDEX `fk_Doctor_1_idx` (`Salary` ASC),
  CONSTRAINT `fk_Doctor_1`
    FOREIGN KEY (`Salary`)
    REFERENCES `exercise4`.`Payment_Bill` (`idPayment_Bill`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise4`.`Medical`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise4`.`Medical` (
  `idMedical` INT NOT NULL,
  `Overtime_rate` VARCHAR(45) NULL,
  PRIMARY KEY (`idMedical`),
  CONSTRAINT `fk_Medical_1`
    FOREIGN KEY (`idMedical`)
    REFERENCES `exercise4`.`Doctor` (`idDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise4`.`Specialist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise4`.`Specialist` (
  `idSpecialist` INT NOT NULL AUTO_INCREMENT,
  `Field_area` VARCHAR(45) NULL,
  PRIMARY KEY (`idSpecialist`),
  CONSTRAINT `fk_Specialist_1`
    FOREIGN KEY (`idSpecialist`)
    REFERENCES `exercise4`.`Doctor` (`idDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise4`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise4`.`Patient` (
  `idPatient` INT NOT NULL AUTO_INCREMENT,
  `Patient_Name` VARCHAR(45) NULL,
  `Patient_date_of_birth` DATE NULL,
  `Patient_Address` VARCHAR(45) NULL,
  `Patient_phone_No` INT(13) NULL,
  PRIMARY KEY (`idPatient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise4`.`Appointment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise4`.`Appointment` (
  `idAppointment` INT NOT NULL,
  `Appointment_date` DATE NULL,
  `Appointment_time` TIME(24) NULL,
  PRIMARY KEY (`idAppointment`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercise4`.`Patient_appointment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercise4`.`Patient_appointment` (
  `idPatient_appointment` INT NOT NULL AUTO_INCREMENT,
  `idPatient` INT NULL,
  `idAppointment` INT NULL,
  PRIMARY KEY (`idPatient_appointment`),
  INDEX `fk_Patient_appointment_1_idx` (`idPatient` ASC),
  INDEX `fk_Patient_appointment_2_idx` (`idAppointment` ASC),
  CONSTRAINT `fk_Patient_appointment_1`
    FOREIGN KEY (`idPatient`)
    REFERENCES `exercise4`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Patient_appointment_2`
    FOREIGN KEY (`idAppointment`)
    REFERENCES `exercise4`.`Appointment` (`idAppointment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Patient_appointment_3`
    FOREIGN KEY (`idPatient_appointment`)
    REFERENCES `exercise4`.`Doctor` (`idDoctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
