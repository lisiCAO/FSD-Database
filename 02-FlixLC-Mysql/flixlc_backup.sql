-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: flixlc
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
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customers` (
  `CustID` smallint NOT NULL AUTO_INCREMENT,
  `Custfn` varchar(20) NOT NULL,
  `Custmn` varchar(20) DEFAULT NULL,
  `Custln` varchar(20) NOT NULL,
  PRIMARY KEY (`CustID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` VALUES (1,'Ralph','Frederick','Johnson'),(2,'Hubert','T.','Weatherby'),(3,'Anne',NULL,'Thomas'),(4,'Mona','J.','Cavenaugh'),(5,'Peter',NULL,'Taylor'),(6,'Ginger','Meagan','Delaney');
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DVDParticipants`
--

DROP TABLE IF EXISTS `DVDParticipants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DVDParticipants` (
  `DVDID` smallint NOT NULL,
  `PartID` smallint NOT NULL,
  `RoleID` varchar(4) NOT NULL,
  PRIMARY KEY (`DVDID`,`PartID`,`RoleID`),
  KEY `fk_DVDParticipants_Participants` (`PartID`),
  KEY `fk_DVDParticipants_Roles` (`RoleID`),
  CONSTRAINT `fk_DVDParticipants_DVDs` FOREIGN KEY (`DVDID`) REFERENCES `DVDs` (`DVDID`),
  CONSTRAINT `fk_DVDParticipants_Participants` FOREIGN KEY (`PartID`) REFERENCES `Participants` (`PartID`),
  CONSTRAINT `fk_DVDParticipants_Roles` FOREIGN KEY (`RoleID`) REFERENCES `Roles` (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DVDParticipants`
--

LOCK TABLES `DVDParticipants` WRITE;
/*!40000 ALTER TABLE `DVDParticipants` DISABLE KEYS */;
INSERT INTO `DVDParticipants` VALUES (3,1,'r102'),(3,1,'r103'),(3,2,'r101'),(3,3,'r101'),(3,4,'r108'),(2,5,'r107'),(4,6,'r101'),(1,7,'r101'),(1,8,'r101'),(1,9,'r108'),(1,10,'r102'),(1,11,'r101');
/*!40000 ALTER TABLE `DVDParticipants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DVDs`
--

DROP TABLE IF EXISTS `DVDs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DVDs` (
  `DVDID` smallint NOT NULL AUTO_INCREMENT,
  `DVDName` varchar(60) NOT NULL,
  `NumDisks` tinyint NOT NULL DEFAULT '1',
  `YearRlsd` char(4) NOT NULL,
  `MTypeID` varchar(4) NOT NULL,
  `StudID` char(4) NOT NULL,
  `RatingID` varchar(4) NOT NULL,
  `FormID` char(2) NOT NULL,
  `StatID` char(2) NOT NULL,
  PRIMARY KEY (`DVDID`),
  UNIQUE KEY `uq_DVDName_DVDs` (`DVDName`),
  KEY `fk_DVDs_MovieTypes` (`MTypeID`),
  KEY `fk_DVDs_Studios` (`StudID`),
  KEY `fk_DVDs_Ratings` (`RatingID`),
  KEY `fk_DVDs_Formats` (`FormID`),
  KEY `fk_DVDs_Status` (`StatID`),
  CONSTRAINT `fk_DVDs_Formats` FOREIGN KEY (`FormID`) REFERENCES `Formats` (`FormID`),
  CONSTRAINT `fk_DVDs_MovieTypes` FOREIGN KEY (`MTypeID`) REFERENCES `MovieTypes` (`MTypeID`),
  CONSTRAINT `fk_DVDs_Ratings` FOREIGN KEY (`RatingID`) REFERENCES `Ratings` (`RatingID`),
  CONSTRAINT `fk_DVDs_Status` FOREIGN KEY (`StatID`) REFERENCES `Status` (`StatusID`),
  CONSTRAINT `fk_DVDs_Studios` FOREIGN KEY (`StudID`) REFERENCES `Studios` (`StudID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DVDs`
--

LOCK TABLES `DVDs` WRITE;
/*!40000 ALTER TABLE `DVDs` DISABLE KEYS */;
INSERT INTO `DVDs` VALUES (1,'White Christmas',1,'2000','mt16','s105','NR','f1','s1'),(2,'What\'s Up, Doc?',1,'2001','mt12','s103','G','f1','s2'),(3,'Out of Africa',1,'2000','mt11','s101','PG','f1','s1'),(4,'The Maltese Falcon',1,'2000','mt11','s103','NR','f1','s2'),(5,'Amadeus',1,'1997','mt11','s103','PG','f1','s2'),(6,'The Rocky Horror Picture Show',2,'2000','mt12','s106','NR','f1','s2'),(7,'A Room with a View',1,'2000','mt11','s107','NR','f1','s1'),(8,'Mash',2,'2001','mt12','s106','R','f1','s2'),(9,'Can You Keep a Secret?',1,'2019','mt03','s107','G','f1','s2'),(10,'Toy Story 4',1,'2019','mt24','s117','PG','f2','s2'),(11,'Spider-Man: Far from Home',1,'2019','mt18','s105','PG13','f1','s2'),(12,'The Lighthouse',1,'2019','mt09','s105','PG13','f3','s2'),(13,'Paradise Hills ',1,'2019','mt06','s105','PG13','f4','s2');
/*!40000 ALTER TABLE `DVDs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employees`
--

DROP TABLE IF EXISTS `Employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employees` (
  `EmpID` smallint NOT NULL AUTO_INCREMENT,
  `EmpFN` varchar(20) NOT NULL,
  `EmpMN` varchar(20) DEFAULT NULL,
  `EmpLN` varchar(20) NOT NULL,
  PRIMARY KEY (`EmpID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employees`
--

LOCK TABLES `Employees` WRITE;
/*!40000 ALTER TABLE `Employees` DISABLE KEYS */;
INSERT INTO `Employees` VALUES (1,'John','P.','Smith'),(2,'Robert',NULL,'Schroader'),(3,'Mary','Marie','Michaels'),(4,'John',NULL,'Laguci'),(5,'Rita','C.','Carter'),(6,'George',NULL,'Brooks');
/*!40000 ALTER TABLE `Employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Formats`
--

DROP TABLE IF EXISTS `Formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Formats` (
  `FormID` char(2) NOT NULL,
  `FormDescrip` varchar(15) NOT NULL,
  PRIMARY KEY (`FormID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Formats`
--

LOCK TABLES `Formats` WRITE;
/*!40000 ALTER TABLE `Formats` DISABLE KEYS */;
INSERT INTO `Formats` VALUES ('f1','Widescreen'),('f2','Fullscreen'),('f3','Digital HD'),('f4','Blu-ray');
/*!40000 ALTER TABLE `Formats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MovieTypes`
--

DROP TABLE IF EXISTS `MovieTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MovieTypes` (
  `MTypeID` varchar(4) NOT NULL,
  `MTypeDescrip` varchar(30) NOT NULL,
  PRIMARY KEY (`MTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MovieTypes`
--

LOCK TABLES `MovieTypes` WRITE;
/*!40000 ALTER TABLE `MovieTypes` DISABLE KEYS */;
INSERT INTO `MovieTypes` VALUES ('mt01','Action'),('mt02','Adventure'),('mt03','Comedy'),('mt04','Crime'),('mt05','Drama'),('mt06','Fantasy'),('mt07','Historical'),('mt08','Historical fiction'),('mt09','Horror'),('mt10','Magical realism'),('mt11','Mystery'),('mt12','Paranoid fiction'),('mt13','Philosophical'),('mt14','Political'),('mt15','Romance'),('mt16','Saga'),('mt17','Satire'),('mt18','Science fiction'),('mt19','Social'),('mt20','Speculative'),('mt21','Thriller'),('mt22','Urban'),('mt23','Western'),('mt24','Animation'),('mt25','Musical');
/*!40000 ALTER TABLE `MovieTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `CustID` smallint NOT NULL,
  `EmpID` smallint NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `fk_Orders_Employees` (`EmpID`),
  KEY `fk_Orders_Customers` (`CustID`),
  CONSTRAINT `fk_Orders_Customers` FOREIGN KEY (`CustID`) REFERENCES `Customers` (`CustID`),
  CONSTRAINT `fk_Orders_Employees` FOREIGN KEY (`EmpID`) REFERENCES `Employees` (`EmpID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,3),(2,1,2),(3,2,5),(4,3,6),(5,4,1),(6,3,3),(7,5,2),(8,6,4),(9,4,5),(10,6,2),(11,3,1),(12,1,6),(13,5,4);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Participants`
--

DROP TABLE IF EXISTS `Participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Participants` (
  `PartID` smallint NOT NULL AUTO_INCREMENT,
  `PartFN` varchar(20) NOT NULL,
  `PartMN` varchar(20) DEFAULT NULL,
  `PartLN` varchar(20) NOT NULL,
  PRIMARY KEY (`PartID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Participants`
--

LOCK TABLES `Participants` WRITE;
/*!40000 ALTER TABLE `Participants` DISABLE KEYS */;
INSERT INTO `Participants` VALUES (1,'Sydney','S.','Pollack'),(2,'Robert',NULL,'Redford'),(3,'Meryl',NULL,'Streep'),(4,'John',NULL,'Barry'),(5,'Henry',NULL,'Buck'),(6,'Humphrey','P.','Bogart'),(7,'Danny',NULL,'Kaye'),(8,'Rosemary',NULL,'Clooney'),(9,'Irving',NULL,'Berlin'),(10,'Michael',NULL,'Curtiz'),(11,'Bing',NULL,'Crosby');
/*!40000 ALTER TABLE `Participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ratings`
--

DROP TABLE IF EXISTS `Ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ratings` (
  `RatingID` varchar(4) NOT NULL,
  `RatingDescrip` varchar(30) NOT NULL,
  PRIMARY KEY (`RatingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ratings`
--

LOCK TABLES `Ratings` WRITE;
/*!40000 ALTER TABLE `Ratings` DISABLE KEYS */;
INSERT INTO `Ratings` VALUES ('G','General audiences'),('NR','Not rated'),('PG','Parental guidance suggested'),('PG13','Parents strongly cautioned'),('R','Under 17 requires adult'),('X','No one 17 and under');
/*!40000 ALTER TABLE `Ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Roles`
--

DROP TABLE IF EXISTS `Roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Roles` (
  `RoleID` varchar(4) NOT NULL,
  `RoleDescrip` varchar(30) NOT NULL,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Roles`
--

LOCK TABLES `Roles` WRITE;
/*!40000 ALTER TABLE `Roles` DISABLE KEYS */;
INSERT INTO `Roles` VALUES ('r101',' Actor'),('r102',' Director'),('r103',' Producer'),('r104',' Executive Producer'),('r105',' Co-Producer'),('r106',' Assistant Producer'),('r107',' Screenwriter'),('r108',' Composer'),('r109',' Line producer'),('r110',' Unit manager'),('r111',' Production coordinator'),('r112',' First assistant director'),('r113',' Second assistant director'),('r114',' Other assistant directors'),('r115',' Production accountant'),('r116',' Location manager'),('r117',' Assistant location manager'),('r118',' Legal counsel'),('r119',' Script supervisor'),('r120',' Casting director');
/*!40000 ALTER TABLE `Roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Status`
--

DROP TABLE IF EXISTS `Status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Status` (
  `StatusID` char(2) NOT NULL,
  `StatDescrip` varchar(20) NOT NULL,
  PRIMARY KEY (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Status`
--

LOCK TABLES `Status` WRITE;
/*!40000 ALTER TABLE `Status` DISABLE KEYS */;
INSERT INTO `Status` VALUES ('s1','Checked out'),('s2','Available'),('s3','Damaged'),('s4','Lost');
/*!40000 ALTER TABLE `Status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Studios`
--

DROP TABLE IF EXISTS `Studios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Studios` (
  `StudID` char(4) NOT NULL,
  `StudDescript` varchar(40) NOT NULL,
  PRIMARY KEY (`StudID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Studios`
--

LOCK TABLES `Studios` WRITE;
/*!40000 ALTER TABLE `Studios` DISABLE KEYS */;
INSERT INTO `Studios` VALUES ('s101','Universal Pictures'),('s102','Paramount Pictures'),('s103','Warner Bros.'),('s104','Walt Disney Pictures'),('s105','Columbia Pictures'),('s106','Metro-Goldwyn-Mayer Pictures'),('s107','Sony Pictures Motion Picture Group'),('s108','20th Century Fox'),('s109','Lionsgate Films'),('s110','DreamWorks Pictures'),('s111','The Weinstein Company'),('s112','Netflix Production'),('s113','Illumination'),('s114','New Line Cinema'),('s115','HBO Films'),('s116','TriStar Pictures'),('s117','Pixar Animation Studios'),('s118','ABC'),('s119','Blue Sky Studios');
/*!40000 ALTER TABLE `Studios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Suppliers`
--

DROP TABLE IF EXISTS `Suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Suppliers` (
  `SupplierID` smallint NOT NULL,
  `CompanyName` varchar(40) NOT NULL,
  `Phone` varchar(15) NOT NULL,
  `City` varchar(15) NOT NULL DEFAULT 'Montreal',
  PRIMARY KEY (`SupplierID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Suppliers`
--

LOCK TABLES `Suppliers` WRITE;
/*!40000 ALTER TABLE `Suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `Suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transactions`
--

DROP TABLE IF EXISTS `Transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transactions` (
  `TransID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int NOT NULL,
  `DVDID` smallint NOT NULL,
  `DateOut` date NOT NULL,
  `DateDue` date NOT NULL,
  `DateIn` date DEFAULT NULL,
  PRIMARY KEY (`TransID`),
  KEY `fk_Transactions_Orders` (`OrderID`),
  KEY `fk_Transactions_DVDs` (`DVDID`),
  CONSTRAINT `fk_Transactions_DVDs` FOREIGN KEY (`DVDID`) REFERENCES `DVDs` (`DVDID`),
  CONSTRAINT `fk_Transactions_Orders` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transactions`
--

LOCK TABLES `Transactions` WRITE;
/*!40000 ALTER TABLE `Transactions` DISABLE KEYS */;
INSERT INTO `Transactions` VALUES (1,1,1,'2023-08-09','2023-08-12',NULL),(2,1,4,'2023-08-09','2023-08-12',NULL),(3,1,8,'2023-08-09','2023-08-12',NULL),(4,2,3,'2023-08-09','2023-08-12',NULL),(5,3,4,'2023-08-09','2023-08-12',NULL),(6,3,1,'2023-08-09','2023-08-12',NULL),(7,3,7,'2023-08-09','2023-08-12',NULL),(8,4,4,'2023-08-09','2023-08-12',NULL),(9,5,3,'2023-08-09','2023-08-12',NULL),(10,6,2,'2023-08-09','2023-08-12',NULL),(11,6,1,'2023-08-09','2023-08-12',NULL),(12,7,4,'2023-08-09','2023-08-12',NULL),(13,8,2,'2023-08-09','2023-08-12',NULL),(14,8,1,'2023-08-09','2023-08-12',NULL),(15,8,3,'2023-08-09','2023-08-12',NULL),(16,9,7,'2023-08-09','2023-08-12',NULL),(17,9,1,'2023-08-09','2023-08-12',NULL),(18,10,5,'2023-08-09','2023-08-12',NULL),(19,11,6,'2023-08-09','2023-08-12',NULL),(20,11,2,'2023-08-09','2023-08-12',NULL),(21,11,8,'2023-08-09','2023-08-12',NULL),(22,12,5,'2023-08-09','2023-08-12',NULL),(23,13,7,'2023-08-09','2023-08-12',NULL);
/*!40000 ALTER TABLE `Transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-09 11:14:31
