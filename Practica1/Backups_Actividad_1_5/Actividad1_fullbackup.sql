-- MySQL dump 10.13  Distrib 8.0.37, for Win64 (x86_64)
--
-- Host: localhost    Database: CLINICA
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `habitacion`
--

DROP TABLE IF EXISTS `habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habitacion` (
  `idHabitacion` int NOT NULL,
  `habitacion` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idHabitacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitacion`
--

LOCK TABLES `habitacion` WRITE;
/*!40000 ALTER TABLE `habitacion` DISABLE KEYS */;
INSERT INTO `habitacion` VALUES (1,'Sala de examenes 1\r'),(2,'Sala de examenes 2\r'),(3,'Sala de examenes 3\r'),(4,'Sala de examenes 4\r'),(5,'Sala de imagenes 1\r'),(6,'Sala de procedimientos 1\r'),(7,'Sala de procedimientos 2\r'),(8,'Sala de procedimientos 3\r'),(9,'Sala de procedimientos 4\r'),(10,'Recepcion\r'),(11,'Laboratorio\r'),(12,'Estación de revisión 1\r'),(13,'Estación de revisión 2\r'),(14,'Estación de revisión 3\r'),(15,'Estación de revisión 4\r');
/*!40000 ALTER TABLE `habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_actividad`
--

DROP TABLE IF EXISTS `log_actividad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_actividad` (
  `id_log_actividad` int NOT NULL AUTO_INCREMENT,
  `timestampx` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `actividad` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `PACIENTE_idPaciente` int NOT NULL,
  `HABITACION_idHabitacion` int NOT NULL,
  PRIMARY KEY (`id_log_actividad`),
  KEY `PACIENTE_idPaciente` (`PACIENTE_idPaciente`),
  KEY `HABITACION_idHabitacion` (`HABITACION_idHabitacion`),
  CONSTRAINT `log_actividad_ibfk_1` FOREIGN KEY (`PACIENTE_idPaciente`) REFERENCES `paciente` (`idPaciente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `log_actividad_ibfk_2` FOREIGN KEY (`HABITACION_idHabitacion`) REFERENCES `habitacion` (`idHabitacion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_actividad`
--

LOCK TABLES `log_actividad` WRITE;
/*!40000 ALTER TABLE `log_actividad` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_actividad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_habitacion`
--

DROP TABLE IF EXISTS `log_habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_habitacion` (
  `timestampx` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `statuss` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `idHabitacion` int NOT NULL,
  PRIMARY KEY (`timestampx`,`idHabitacion`),
  KEY `idHabitacion` (`idHabitacion`),
  CONSTRAINT `log_habitacion_ibfk_1` FOREIGN KEY (`idHabitacion`) REFERENCES `habitacion` (`idHabitacion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_habitacion`
--

LOCK TABLES `log_habitacion` WRITE;
/*!40000 ALTER TABLE `log_habitacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `idPaciente` int NOT NULL,
  `edad` int NOT NULL,
  `genero` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idPaciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-12 16:45:58
