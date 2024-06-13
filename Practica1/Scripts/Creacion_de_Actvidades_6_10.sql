-- NOTA: RUTA DONDE COLOCAR LOS ARCHIVOS
-- C:\BackupPractica1
USE `CLINICA`;
-- -----------------------------------------------------
-- ACTIVIDAD 6
-- -----------------------------------------------------
DELETE FROM clinica.log_habitacion;
DELETE FROM clinica.log_actividad;
DELETE FROM clinica.paciente;
DELETE FROM clinica.habitacion;

mysql --default-character-set=utf8 -u root -p123abc CLINICA < C:\BackupPractica1\Actividad1_fullbackup.sql

SELECT * FROM clinica.habitacion;
SELECT COUNT(*) AS TOTAL_HABITACION FROM clinica.habitacion;
SELECT * FROM clinica.paciente;
SELECT COUNT(*) AS TOTAL_PACIENTES FROM clinica.paciente;
SELECT * FROM clinica.log_actividad;
SELECT COUNT(*) AS TOTAL_LOG_ACTIVIDAD FROM clinica.log_actividad;
SELECT * FROM clinica.log_habitacion;
SELECT COUNT(*) AS TOTAL_LOG_HABITACION FROM clinica.log_habitacion;


-- -----------------------------------------------------
-- ACTIVIDAD 7
-- -----------------------------------------------------
DELETE FROM clinica.log_habitacion;
DELETE FROM clinica.log_actividad;
DELETE FROM clinica.paciente;
DELETE FROM clinica.habitacion;

mysql --default-character-set=utf8 -u root -p123abc CLINICA < C:\BackupPractica1\Actividad2_fullbackup.sql

SELECT * FROM clinica.habitacion;
SELECT COUNT(*) AS TOTAL_HABITACION FROM clinica.habitacion;
SELECT * FROM clinica.paciente;
SELECT COUNT(*) AS TOTAL_PACIENTES FROM clinica.paciente;
SELECT * FROM clinica.log_actividad;
SELECT COUNT(*) AS TOTAL_LOG_ACTIVIDAD FROM clinica.log_actividad;
SELECT * FROM clinica.log_habitacion;
SELECT COUNT(*) AS TOTAL_LOG_HABITACION FROM clinica.log_habitacion;


-- -----------------------------------------------------
-- ACTIVIDAD 8
-- -----------------------------------------------------
DELETE FROM clinica.log_habitacion;
DELETE FROM clinica.log_actividad;
DELETE FROM clinica.paciente;
DELETE FROM clinica.habitacion;

mysql --default-character-set=utf8 -u root -p123abc CLINICA < C:\BackupPractica1\Actividad3_fullbackup.sql

SELECT * FROM clinica.habitacion;
SELECT COUNT(*) AS TOTAL_HABITACION FROM clinica.habitacion;
SELECT * FROM clinica.paciente;
SELECT COUNT(*) AS TOTAL_PACIENTES FROM clinica.paciente;
SELECT * FROM clinica.log_actividad;
SELECT COUNT(*) AS TOTAL_LOG_ACTIVIDAD FROM clinica.log_actividad;
SELECT * FROM clinica.log_habitacion;
SELECT COUNT(*) AS TOTAL_LOG_HABITACION FROM clinica.log_habitacion;


-- -----------------------------------------------------
-- ACTIVIDAD 9
-- -----------------------------------------------------
DELETE FROM clinica.log_habitacion;
DELETE FROM clinica.log_actividad;
DELETE FROM clinica.paciente;
DELETE FROM clinica.habitacion;

mysql --default-character-set=utf8 -u root -p123abc CLINICA < C:\BackupPractica1\Actividad4_fullbackup.sql

SELECT * FROM clinica.habitacion;
SELECT COUNT(*) AS TOTAL_HABITACION FROM clinica.habitacion;
SELECT * FROM clinica.paciente;
SELECT COUNT(*) AS TOTAL_PACIENTES FROM clinica.paciente;
SELECT * FROM clinica.log_actividad;
SELECT COUNT(*) AS TOTAL_LOG_ACTIVIDAD FROM clinica.log_actividad;
SELECT * FROM clinica.log_habitacion;
SELECT COUNT(*) AS TOTAL_LOG_HABITACION FROM clinica.log_habitacion;


-- -----------------------------------------------------
-- ACTIVIDAD 10
-- -----------------------------------------------------
DELETE FROM clinica.log_habitacion;
DELETE FROM clinica.log_actividad;
DELETE FROM clinica.paciente;
DELETE FROM clinica.habitacion;

mysql --default-character-set=utf8 -u root -p123abc CLINICA < C:\BackupPractica1\Actividad5_fullbackup.sql

SELECT * FROM clinica.habitacion;
SELECT COUNT(*) AS TOTAL_HABITACION FROM clinica.habitacion;
SELECT * FROM clinica.paciente;
SELECT COUNT(*) AS TOTAL_PACIENTES FROM clinica.paciente;
SELECT * FROM clinica.log_actividad;
SELECT COUNT(*) AS TOTAL_LOG_ACTIVIDAD FROM clinica.log_actividad;
SELECT * FROM clinica.log_habitacion;
SELECT COUNT(*) AS TOTAL_LOG_HABITACION FROM clinica.log_habitacion;