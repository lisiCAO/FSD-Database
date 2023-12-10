-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: omi_attendance
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `absence`
--

DROP TABLE IF EXISTS `absence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `absence` (
  `abs_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `emp_id` smallint unsigned NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `abs_type_id` smallint unsigned NOT NULL,
  `note` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT 'N/A',
  PRIMARY KEY (`abs_id`),
  KEY `fk_absence_emp` (`emp_id`),
  KEY `fk_absence_type` (`abs_type_id`),
  CONSTRAINT `fk_absence_emp` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_absence_type` FOREIGN KEY (`abs_type_id`) REFERENCES `absence_type` (`abs_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `absence`
--

LOCK TABLES `absence` WRITE;
/*!40000 ALTER TABLE `absence` DISABLE KEYS */;
/*!40000 ALTER TABLE `absence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `absence_type`
--

DROP TABLE IF EXISTS `absence_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `absence_type` (
  `abs_type_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `abs_type_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_paid` tinyint(1) NOT NULL,
  `acquisition_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `is_convertible` tinyint(1) DEFAULT NULL,
  `max_days_allowed` smallint DEFAULT NULL,
  PRIMARY KEY (`abs_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `absence_type`
--

LOCK TABLES `absence_type` WRITE;
/*!40000 ALTER TABLE `absence_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `absence_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `dept_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `emp_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `last_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address1` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_code` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sin` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_id` smallint unsigned NOT NULL,
  `hourly_wage` float unsigned NOT NULL,
  `seniority` tinyint NOT NULL DEFAULT '0',
  `dept_id` smallint unsigned NOT NULL,
  `emp_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Full-time',
  PRIMARY KEY (`emp_id`),
  KEY `fk_employee_job` (`job_id`),
  KEY `fk_employee_debt` (`dept_id`),
  CONSTRAINT `fk_employee_debt` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`),
  CONSTRAINT `fk_employee_job` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `job_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `job_cat` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job_desc` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `overtime`
--

DROP TABLE IF EXISTS `overtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `overtime` (
  `overtime_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `emp_id` smallint unsigned NOT NULL,
  `date` date NOT NULL,
  `hours_worked` float NOT NULL,
  `overtime_mul` enum('1','1.5','2','-1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1.5',
  `new_balance` float NOT NULL,
  `note` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT 'N/A',
  PRIMARY KEY (`overtime_id`),
  CONSTRAINT `chk_positive_hours` CHECK ((`hours_worked` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `overtime`
--

LOCK TABLES `overtime` WRITE;
/*!40000 ALTER TABLE `overtime` DISABLE KEYS */;
/*!40000 ALTER TABLE `overtime` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-11  9:35:20
