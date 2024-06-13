-- -----------------------------------------------------
-- Crea una Base de datos con el nombre de ht1_g26.
-- -----------------------------------------------------
CREATE DATABASE ht1_g26 CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ht1_g26`;

-- -----------------------------------------------------
-- Crear una tabla “persona” con los campos indicados.
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Persona`(
  `id` INT AUTO_INCREMENT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `edad` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SELECT *FROM Persona;

-- -----------------------------------------------------
-- Insertar 5 registros.
-- -----------------------------------------------------
INSERT INTO Persona(nombre, edad) values
('Henrry',31),('Brayan ',29),('Otto',33),('David',9),('Lucas',8);

SELECT *FROM Persona;

-- -----------------------------------------------------
-- Crear el backup completo 1 e incremental 1.
-- -----------------------------------------------------
-- Full Backup
mysqldump --default-character-set=utf8 -u root -p123abc ht1_g26 > C:\Backupht\backup_completo1.sql

-- Incremental Backup
mysqldump --default-character-set=utf8 -u root -p123abc ht1_g26 Persona > C:\Backupht\backup_incremental1.sql

-- -----------------------------------------------------
-- Insertar 3 registros.
-- -----------------------------------------------------
INSERT INTO Persona(nombre, edad) values
('Roman',26),('Giovanny',19),('Alan',22);

SELECT *FROM Persona;


-- -----------------------------------------------------
-- Crear el backup completo 2 e incremental 2.
-- -----------------------------------------------------
-- Full Backup
mysqldump --default-character-set=utf8 -u root -p123abc ht1_g26 > C:\Backupht\backup_completo2.sql

-- Incremental Backup
mysqldump --default-character-set=utf8 -u root -p123abc ht1_g26 Persona --no-create-info --where="id > 5" > C:\Backupht\backup_incremental2.sql

-- -----------------------------------------------------
-- Eliminar los datos y ejecutar un SELECT *FROM persona.
-- -----------------------------------------------------
TRUNCATE TABLE persona;

SELECT *FROM persona;

-- -----------------------------------------------------
-- Restaurar el backup completo 1.
-- -----------------------------------------------------
mysql --default-character-set=utf8 -u root -p123abc ht1_g26 < C:\Backupht\backup_completo1.sql

-- -----------------------------------------------------
-- Ejecutar un SELECT *FROM persona.
-- -----------------------------------------------------
SELECT *FROM persona;

-- -----------------------------------------------------
-- Eliminar los datos y ejecutar un SELECT *FROM persona.
-- -----------------------------------------------------
TRUNCATE TABLE persona;

SELECT *FROM persona;

-- -----------------------------------------------------
-- Restaurar el backup completo 2.
-- -----------------------------------------------------
mysql --default-character-set=utf8 -u root -p123abc ht1_g26 < C:\Backupht\backup_completo2.sql

-- -----------------------------------------------------
-- Ejecutar un SELECT *FROM persona.
-- -----------------------------------------------------
SELECT *FROM persona;

-- -----------------------------------------------------
-- Eliminar los datos y ejecutar un SELECT *FROM persona.
-- -----------------------------------------------------
TRUNCATE TABLE persona;

SELECT *FROM persona;

-- -----------------------------------------------------
-- Restaurar el backup incremental 1.
-- -----------------------------------------------------
mysql --default-character-set=utf8 -u root -p123abc ht1_g26 < C:\Backupht\backup_incremental1.sql

-- -----------------------------------------------------
-- Ejecutar un SELECT *FROM persona.
-- -----------------------------------------------------
SELECT *FROM persona;

-- -----------------------------------------------------
-- Restaurar el backup incremental 2.
-- -----------------------------------------------------
mysql --default-character-set=utf8 -u root -p123abc ht1_g26 < C:\Backupht\backup_incremental2.sql

-- -----------------------------------------------------
-- Ejecutar un SELECT *FROM persona.
-- -----------------------------------------------------
SELECT *FROM persona;
