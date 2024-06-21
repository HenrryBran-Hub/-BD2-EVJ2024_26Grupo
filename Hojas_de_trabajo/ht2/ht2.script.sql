-- -----------------------------------------------------
-- Crea una Base de datos con el nombre de ht1_g26.
-- -----------------------------------------------------
CREATE DATABASE BD2T2;
USE `BD2T2`;

- -----------------------------------------------------
-- Crear una tabla “usuario” con los campos indicados.
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Usuario`(
  `id` INT AUTO_INCREMENT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `edad` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SELECT *FROM Usuario;

-- -----------------------------------------------------
-- Insertar al menos 2 registros
-- -----------------------------------------------------
INSERT INTO Usuario(nombre, edad) values
('Henrry',31),('Brayan ',29),('Otto',33),('Erica',28),('Yuri',35);

SELECT *FROM Usuario;

-- -----------------------------------------------------
-- Crear dos usuarios
-- -----------------------------------------------------
CREATE USER 'user1t2'@'localhost' IDENTIFIED BY 'pass1';
CREATE USER 'user2t2'@'localhost' IDENTIFIED BY 'pass2';

SELECT user, host from mysql.user;

SHOW GRANTS FOR 'user1t2'@'localhost';
SHOW GRANTS FOR 'user2t2'@'localhost';


-- -----------------------------------------------------
-- Crear permisos de usuario a user1t2
-- -----------------------------------------------------
GRANT SELECT, INSERT, UPDATE ON bd2t2.Usuario TO  'user1t2'@'localhost';
SHOW GRANTS FOR  'user1t2'@'localhost';

-- -----------------------------------------------------
-- Crear permisos de usuario a user2t2
-- -----------------------------------------------------
GRANT SELECT ON bd2t2.Usuario TO  'user2t2'@'localhost';
SHOW GRANTS FOR  'user2t2'@'localhost';

-- -----------------------------------------------------
-- Eliminacion de un dato con user1t2
-- -----------------------------------------------------
USE `BD2T2`;
DELETE FROM bd2t2.Usuario WHERE id = 4;


-- -----------------------------------------------------
-- Agregacion de un dato con user2t2
-- -----------------------------------------------------
USE `BD2T2`;
INSERT INTO Usuario(nombre, edad) values ('Pedro',18);