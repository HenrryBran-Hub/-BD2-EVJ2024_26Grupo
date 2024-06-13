-- NOTA: RUTA DONDE COLOCAR LOS ARCHIVOS
-- C:\BackupPractica1
USE `CLINICA`;
-- -----------------------------------------------------
-- ACTIVIDAD 11
-- -----------------------------------------------------
TRUNCATE TABLE clinica.log_habitacion;
TRUNCATE TABLE clinica.log_actividad;
DELETE FROM clinica.habitacion;
DELETE FROM clinica.paciente;

mysql --default-character-set=utf8 -u root -p123abc CLINICA < C:\BackupPractica1\Actividad1_incremental_backup_habitacion.sql

SELECT * FROM clinica.habitacion;
SELECT COUNT(*) AS TOTAL_HABITACION FROM clinica.habitacion;
SELECT * FROM clinica.paciente;
SELECT COUNT(*) AS TOTAL_PACIENTES FROM clinica.paciente;
SELECT * FROM clinica.log_actividad;
SELECT COUNT(*) AS TOTAL_LOG_ACTIVIDAD FROM clinica.log_actividad;
SELECT * FROM clinica.log_habitacion;
SELECT COUNT(*) AS TOTAL_LOG_HABITACION FROM clinica.log_habitacion;


-- -----------------------------------------------------
-- ACTIVIDAD 12
-- -----------------------------------------------------
mysql --default-character-set=utf8 -u root -p123abc CLINICA < C:\BackupPractica1\Actividad2_incremental_backup_paciente.sql

SELECT * FROM clinica.habitacion;
SELECT COUNT(*) AS TOTAL_HABITACION FROM clinica.habitacion;
SELECT * FROM clinica.paciente;
SELECT COUNT(*) AS TOTAL_PACIENTES FROM clinica.paciente;
SELECT * FROM clinica.log_actividad;
SELECT COUNT(*) AS TOTAL_LOG_ACTIVIDAD FROM clinica.log_actividad;
SELECT * FROM clinica.log_habitacion;
SELECT COUNT(*) AS TOTAL_LOG_HABITACION FROM clinica.log_habitacion;


-- -----------------------------------------------------
-- ACTIVIDAD 13
-- -----------------------------------------------------
mysql --default-character-set=utf8 -u root -p123abc CLINICA < C:\BackupPractica1\Actividad3_incremental_backup_log_activadad_1.sql

SELECT * FROM clinica.habitacion;
SELECT COUNT(*) AS TOTAL_HABITACION FROM clinica.habitacion;
SELECT * FROM clinica.paciente;
SELECT COUNT(*) AS TOTAL_PACIENTES FROM clinica.paciente;
SELECT * FROM clinica.log_actividad;
SELECT COUNT(*) AS TOTAL_LOG_ACTIVIDAD FROM clinica.log_actividad;
SELECT * FROM clinica.log_habitacion;
SELECT COUNT(*) AS TOTAL_LOG_HABITACION FROM clinica.log_habitacion;


-- -----------------------------------------------------
-- ACTIVIDAD 14
-- -----------------------------------------------------
mysql --default-character-set=utf8 -u root -p123abc CLINICA < C:\BackupPractica1\Actividad4_incremental_backup_log_actividad_2.sql

SELECT * FROM clinica.habitacion;
SELECT COUNT(*) AS TOTAL_HABITACION FROM clinica.habitacion;
SELECT * FROM clinica.paciente;
SELECT COUNT(*) AS TOTAL_PACIENTES FROM clinica.paciente;
SELECT * FROM clinica.log_actividad;
SELECT COUNT(*) AS TOTAL_LOG_ACTIVIDAD FROM clinica.log_actividad;
SELECT * FROM clinica.log_habitacion;
SELECT COUNT(*) AS TOTAL_LOG_HABITACION FROM clinica.log_habitacion;


-- -----------------------------------------------------
-- ACTIVIDAD 15
-- -----------------------------------------------------
mysql --default-character-set=utf8 -u root -p123abc CLINICA < C:\BackupPractica1\Actividad5_incremental_backup_log_habitacion.sql

SELECT * FROM clinica.habitacion;
SELECT COUNT(*) AS TOTAL_HABITACION FROM clinica.habitacion;
SELECT * FROM clinica.paciente;
SELECT COUNT(*) AS TOTAL_PACIENTES FROM clinica.paciente;
SELECT * FROM clinica.log_actividad;
SELECT COUNT(*) AS TOTAL_LOG_ACTIVIDAD FROM clinica.log_actividad;
SELECT * FROM clinica.log_habitacion;
SELECT COUNT(*) AS TOTAL_LOG_HABITACION FROM clinica.log_habitacion;