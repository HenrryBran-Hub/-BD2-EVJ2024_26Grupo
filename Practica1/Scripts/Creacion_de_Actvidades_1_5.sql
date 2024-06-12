-- NOTA: RUTA DONDE COLOCAR LOS ARCHIVOS
-- C:\ProgramData\MySQL\MySQL Server 8.0\Uploads

-- -----------------------------------------------------
-- ACTIVIDAD 1
-- -----------------------------------------------------
LOAD DATA LOCAL INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Habitaciones.csv'
INTO TABLE HABITACION
CHARACTER SET utf8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(idHabitacion, habitacion);

SELECT * FROM clinica.habitacion;
SELECT COUNT(*) AS TOTAL_HABITACION FROM clinica.habitacion;
SELECT * FROM clinica.paciente;
SELECT COUNT(*) AS TOTAL_PACIENTES FROM clinica.paciente;
SELECT * FROM clinica.log_actividad;
SELECT COUNT(*) AS TOTAL_LOG_ACTIVIDAD FROM clinica.log_actividad;
SELECT * FROM clinica.log_habitacion;
SELECT COUNT(*) AS TOTAL_LOG_HABITACION FROM clinica.log_habitacion;

-- Full Backup
mysqldump -u practica -p1234.abcd CLINICA > C:\BackupPractica1\Actividad1_fullbackup.sql

-- Incremental Backup

mysqldump -u practica -p1234.abcd CLINICA HABITACION >  C:\BackupPractica1\Actividad1\incremental_backup_habitacion.sql

-- -----------------------------------------------------
-- ACTIVIDAD 2
-- -----------------------------------------------------
LOAD DATA LOCAL INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Pacientes.csv'
INTO TABLE PACIENTE
CHARACTER SET utf8
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(idPaciente, edad, genero);

SELECT * FROM clinica.habitacion;
SELECT COUNT(*) AS TOTAL_HABITACION FROM clinica.habitacion;
SELECT * FROM clinica.paciente;
SELECT COUNT(*) AS TOTAL_PACIENTES FROM clinica.paciente;
SELECT * FROM clinica.log_actividad;
SELECT COUNT(*) AS TOTAL_LOG_ACTIVIDAD FROM clinica.log_actividad;
SELECT * FROM clinica.log_habitacion;
SELECT COUNT(*) AS TOTAL_LOG_HABITACION FROM clinica.log_habitacion;

-- Full Backup
mysqldump -u root -p123abc CLINICA > C:\BackupPractica1\Actividad2_fullbackup.sql

-- Incremental Backup

mysqldump -u root -p123abc CLINICA PACIENTE >  C:\BackupPractica1\Actividad2_incremental_backup_paciente.sql


-- -----------------------------------------------------
-- ACTIVIDAD 3
-- -----------------------------------------------------
LOAD DATA LOCAL INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\LogActividades1.csv'
INTO TABLE LOG_ACTIVIDAD
CHARACTER SET utf8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var_timestampx, @var_actividad, @var_HABITACION_idHabitacion, @var_PACIENTE_idPaciente)
SET 
    timestampx = @var_timestampx, 
    actividad = @var_actividad, 
    PACIENTE_idPaciente = @var_PACIENTE_idPaciente, 
    HABITACION_idHabitacion = @var_HABITACION_idHabitacion;

SELECT * FROM clinica.habitacion;
SELECT COUNT(*) AS TOTAL_HABITACION FROM clinica.habitacion;
SELECT * FROM clinica.paciente;
SELECT COUNT(*) AS TOTAL_PACIENTES FROM clinica.paciente;
SELECT * FROM clinica.log_actividad;
SELECT COUNT(*) AS TOTAL_LOG_ACTIVIDAD FROM clinica.log_actividad;
SELECT * FROM clinica.log_habitacion;
SELECT COUNT(*) AS TOTAL_LOG_HABITACION FROM clinica.log_habitacion;

-- Full Backup
mysqldump -u root -p123abc CLINICA > C:\BackupPractica1\Actividad3_fullbackup.sql

-- Incremental Backup

mysqldump -u root -p123abc CLINICA LOG_ACTIVIDAD >  C:\BackupPractica1\Actividad3_incremental_backup_log_activadad_1.sql

-- -----------------------------------------------------
-- ACTIVIDAD 4
-- -----------------------------------------------------
LOAD DATA LOCAL INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\LogActividades2.csv'
INTO TABLE LOG_ACTIVIDAD
CHARACTER SET utf8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var_timestampx, @var_actividad, @var_HABITACION_idHabitacion, @var_PACIENTE_idPaciente)
SET 
    timestampx = @var_timestampx, 
    actividad = @var_actividad, 
    PACIENTE_idPaciente = @var_PACIENTE_idPaciente, 
    HABITACION_idHabitacion = @var_HABITACION_idHabitacion;
    
SELECT * FROM clinica.habitacion;
SELECT COUNT(*) AS TOTAL_HABITACION FROM clinica.habitacion;
SELECT * FROM clinica.paciente;
SELECT COUNT(*) AS TOTAL_PACIENTES FROM clinica.paciente;
SELECT * FROM clinica.log_actividad;
SELECT COUNT(*) AS TOTAL_LOG_ACTIVIDAD FROM clinica.log_actividad;
SELECT * FROM clinica.log_habitacion;
SELECT COUNT(*) AS TOTAL_LOG_HABITACION FROM clinica.log_habitacion;


-- Full Backup
mysqldump -u root -p123abc CLINICA > C:\BackupPractica1\Actividad4_fullbackup.sql

-- Incremental Backup
mysqldump -u root -p123abc CLINICA LOG_ACTIVIDAD --no-create-info --where="id_log_actividad > 33845" > C:\BackupPractica1\Actividad4_incremental_backup_log_actividad_2.sql

-- -----------------------------------------------------
-- ACTIVIDAD 5
-- -----------------------------------------------------
LOAD DATA LOCAL INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\LogHabitacion.csv'
INTO TABLE LOG_HABITACION
CHARACTER SET utf8
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var_idHabitacion, @var_timestampx, @var_statusS)
SET 
    timestampx = @var_timestampx, 
    statuss = @var_statusS, 
    idHabitacion = @var_idHabitacion;
    
SELECT * FROM clinica.habitacion;
SELECT COUNT(*) AS TOTAL_HABITACION FROM clinica.habitacion;
SELECT * FROM clinica.paciente;
SELECT COUNT(*) AS TOTAL_PACIENTES FROM clinica.paciente;
SELECT * FROM clinica.log_actividad;
SELECT COUNT(*) AS TOTAL_LOG_ACTIVIDAD FROM clinica.log_actividad;
SELECT * FROM clinica.log_habitacion;
SELECT COUNT(*) AS TOTAL_LOG_HABITACION FROM clinica.log_habitacion;

-- Full Backup
mysqldump -u root -p123abc CLINICA > C:\BackupPractica1\Actividad5_fullbackup.sql

-- Incremental Backup

mysqldump -u root -p123abc CLINICA LOG_HABITACION >  C:\BackupPractica1\Actividad5_incremental_backup_log_habitacion.sql
