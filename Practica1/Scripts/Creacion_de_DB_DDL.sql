CREATE DATABASE CLINICA CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `CLINICA`;

-- DROP DATABASE CLINICA;
-- -----------------------------------------------------
-- CREACION TABLA PACIENTE
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PACIENTE`(
  `idPaciente` INT NOT NULL,
  `edad` INT NOT NULL,
  `genero` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idPaciente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- CREACION TABLA HABITACION
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HABITACION` (
  `idHabitacion` INT NOT NULL,
  `habitacion` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idHabitacion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- CRAECION TABLA LOG_ACTIVIDAD
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LOG_ACTIVIDAD` (
  `id_log_actividad` INT AUTO_INCREMENT NOT NULL,
  `timestampx` VARCHAR(100) NOT NULL,
  `actividad` VARCHAR(500) NOT NULL,
  `PACIENTE_idPaciente` INT NOT NULL,
  `HABITACION_idHabitacion` INT NOT NULL,
  PRIMARY KEY (`id_log_actividad`),
  FOREIGN KEY (`PACIENTE_idPaciente`) REFERENCES `PACIENTE` (`idPaciente`)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`HABITACION_idHabitacion`) REFERENCES `HABITACION` (`idHabitacion`)
  ON DELETE CASCADE ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- CREACION TABLA LOG_HABITACION
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LOG_HABITACION` (
  `timestampx` VARCHAR(100) NOT NULL,
  `statuss` VARCHAR(45) NOT NULL,
  `idHabitacion` INT NOT NULL,
  PRIMARY KEY (`timestampx`, `idHabitacion`),
  FOREIGN KEY (`idHabitacion`) REFERENCES `HABITACION` (`idHabitacion`)
  ON DELETE CASCADE ON UPDATE CASCADE)
ENGINE = InnoDB;

