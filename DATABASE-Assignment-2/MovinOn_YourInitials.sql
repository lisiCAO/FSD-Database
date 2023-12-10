-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: movinon
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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `cust_id` int unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_f_n` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_l_n` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Piazza Real Estate','Terry','Ramadani','1897 Gary Ave','Spokane','WA','99204','(509) 324-8213',0.00),(3,'Douglas Law Firm','Susan','Suarez','375 56th St','Spokane','WA','99245','(509) 857-2465',0.00),(4,'','Felicia','Pursifull','61 Virginian Ln','Jackson Hole','WY','83001','(307) 224-9633',0.00),(5,'','Rebecca','Leighty','1803 Nora Ave W','Spokane','WA','99202','(509) 546-3133',0.00),(6,'Woodman Furniture','Jeff','Booker','156 Fourth St SW','Seattle','WA','98145','(206) 354-6785',0.00),(7,'','Zarra','Thomas','9390 Marilu Rd','Jackson Hole','WY','83001','(307) 555-6547',0.00),(8,'','Deidre','Haferson','201 North River Dr W','Spokane','WA','99201','(509) 648-3132',0.00),(9,'Limited Partners','Yeon','Wung','14588 25th St NW','Spokane','WA','99203','(509) 487-3574',0.00),(10,'Brody & Karnall, PC','Darla','Barbar','6755 Forestview Dr W','Portland','OR','97215','(503) 546-5465',0.00),(11,'','Brandy','Jonaitis','955 Simon Ln','Jackson Hole','WY','83003','(307) 541-2216',0.00),(12,'Partners in Health','Josephine','Miazga','6133 Highland Park','Spokane','WA','99203','(509) 324-6542',0.00),(13,'County Booksellers','Roselina','Smith','655 Ponderosa Dr','Jackson Hole','WY','83005','(307) 685-3211',0.00),(14,'','Mary','Pyo','8534 Klondike Lane NW','Seattle','WA','98152','(206) 345-7122',0.00),(16,'','Walter','Garth','78 Beloit Ave','Spokane','WA','99210','(509) 324-9213',0.00),(18,'County Hospital','Angela','Areba','6308 24th Ave NW','Seattle','WA','98001','(206) 574-2111',0.00),(19,'','Melissa','Doezal','15607 Timberwood Ct N','Spokane','WA','99205','(509) 232-4682',0.00),(20,'Ruby Booksellers','Nora','Rittmeyer','3122 Mountain View Rd','Seattle','WA','98102','(206) 334-6564',0.00),(21,'','Paul','Rabideaux','10024 Colfax Rd N','Spokane','WA','99203','(509) 432-3546',0.00),(22,'Hannah\'s Antiques','Marcia','Harrison','14228 S US Highway 191','Jackson Hole','WY','83001','(307) 541-2231',0.00),(23,'Buck\'s Bikes','Melinda','Harper','5259 Mithun Pl NE','Seattle','WA','98012','(206) 467-8885',0.00),(24,'','Robert','Soorbine','2467 Fifth St','Spokane','WA','99204','(509) 352-5635',0.00),(25,'','Andrea','Franklin','8978 Fullerton Rd','Jackson Hole','WY','83001','(307) 841-2300',0.00),(26,'','Judy','Boehme','5690 Riceville Rd','Portland','OR','97201','(503) 465-7955',0.00),(27,'Houseman Realtors','Angela','Sokovich','638 25th Ave E','Spokane','WA','99216','(509) 642-1115',0.00),(28,'','Scott','Cooperstein','523 Mansfield Ave W','Spokane','WA','99262','(509) 365-4683',0.00),(29,'','Laura','Young','2925 N Aspen Wood Ln','Jackson Hole','WY','83004','(307) 542-1346',0.00),(30,'','Dora','Castillo','6308 24th Ave NW','Seattle','WA','98016','(206) 345-1145',0.00),(32,'Boat Storage Systems','Oswald','Coates','620 Olympic Pl W','Seattle','WA','98048','(206) 452-1352',0.00),(33,'','Jerry','Murillo','4789 E. G Street','Jackson Hole','WY','83002','(307) 249-5555',0.00),(34,'','Garth','Ferraro','5314 Sunset Hwy W','Spokane','WA','99201','(509) 345-1247',0.00),(35,'Vanway Accounting','Charlene','Leong','2172 Corner Creek Ln','Jackson Hole','WY','83001','(307) 274-9233',0.00),(36,'','Rinn','Rucker','7420 Rambling Rd','Portland','OR','97212','(503) 541-3338',0.00),(37,'','Irene','Stakline','7200 Riverbrook Lane','Spokane','WA','99215','(509) 654-1246',0.00);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver` (
  `driver_id` int unsigned NOT NULL AUTO_INCREMENT,
  `l_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `f_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cell` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ssn` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `d_birth` date DEFAULT NULL,
  `d_hire` date NOT NULL,
  `d_end` date DEFAULT NULL,
  `mileage_rate` decimal(5,2) NOT NULL,
  `d_review` date DEFAULT NULL,
  `driving_record` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`driver_id`),
  UNIQUE KEY `UNIQUE_ssn_dri` (`ssn`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (1,'Lo','Jerry','600 East 22nd Street','Jackson Hole','WY','83001','3076435512','3075745444','124002465','1986-09-12','2014-01-22','2014-06-15',0.35,NULL,'A'),(2,'Samson','John','9708 Manchaca Road','Spokane','WA','99213','5095422212','5095741115','725461340','1984-12-16','2015-11-22',NULL,0.30,'2015-05-20','A'),(3,'Spichalla','Virginia','2120 53rd Street SW','Seattle','WA','98102','2067415132','2064571544','728224333','1986-10-24','2014-10-21',NULL,0.35,'2014-08-16','B'),(4,'Nabinger','Jonathan','11215 87th Avenue NE','Seattle','WA','98103','2065431542','2064852461','901543211','1995-02-14','2013-09-12',NULL,0.35,'2013-01-05','C'),(7,'Snowden','Byron','300 Promontory Drive','Portland','OR','97204','5034514541','5034875544','321560000','1993-08-14','2008-06-14',NULL,0.35,'2008-06-15','C'),(8,'Solquim','Cindy','755 Cherry Valley Drive','Jackson Hole','WY','83002','3075712241','3078974541','915424687','1985-10-06','2006-03-14',NULL,0.40,'2007-10-01','A'),(9,'Able','Manuel','3010 W Anderson Lane','Portland','OR','97201','5032121574','5034571544','987352000','1995-11-24','2011-04-05',NULL,0.40,'2012-11-01','B'),(10,'Condon','Jackie','620 East Empire Street','Spokane','WA','99216','5097415741','5097842456','953102431','1996-07-30','2009-10-15',NULL,0.45,'2009-02-15','A'),(11,'Vandre','Ned','10611 Freidrich Lane SW','Seattle','WA','98116','2062487468','2068745441','908754641','1997-04-05','2016-09-10','2017-03-22',0.45,'2016-10-29','A'),(12,'Lindsey','Nathan','861 Loop 337 E','Portland','OR','97207','5034571541','5037877771','983567899','1996-12-31','2016-02-24',NULL,0.50,'2016-03-01','A'),(13,'O\'Reilly','John','2520 Longview Drive E','Seattle','WA','98127','2065741241','2063127489','724135755','1984-07-04','2015-01-29',NULL,0.50,'2015-03-15','A'),(14,'Mahata','Charles','101 Shady Lane','Jackson Hole','WY','83004','3079856455','3078973544','000267544','1991-03-01','2012-01-29',NULL,0.50,'2012-11-15','A'),(15,'Strong','Victor','5421 Bee Cave Road','Spokane','WA','99216','5096451354','5095473123','721246721','1992-04-24','2014-08-14',NULL,0.40,'2014-10-15','A'),(16,'Avalon','Robert','35741 Steck Avenue #498','Seattle','WA','98108','2064783457','2064354132','704246572','1984-04-10','2014-10-29',NULL,0.35,'2014-10-15','B'),(17,'Reingold','Abbie','623 South Hampton Way','Portland','OR','97204','5035497241','5063789855','724354544','1987-06-21','2013-11-24','2013-02-02',0.30,'2013-12-10','D'),(18,'Smith','Luke','1322 Buckeye Trail NW','Portland','OR','97207','5035716575','5039785432','701234900','1987-09-28','2010-06-14',NULL,0.40,'2010-06-15','C'),(19,'Nicholson','Alberto','707 W 21st Street #68','Portland','OR','97215','5035853589','5037897124','703264978','1989-05-30','2014-12-23',NULL,0.35,'2014-01-15','A'),(20,'Nesson','Roy','105 Gattis School Road','Seattle','WA','99217','2064873245','2067741445','705364444','1989-12-12','2014-02-03',NULL,0.45,'2014-09-10','B'),(21,'Donaldson','Turner','277 Woodway Drive','Jackson Hole','WY','83010','3075713575','3078645732','812450000','1988-10-14','2015-06-30',NULL,0.40,'2015-09-01','B'),(22,'Minton','Dawson','780 North Loop #298','Seattle','WA','99217','2068745765','2067843541','709531277','1987-06-20','2015-07-15',NULL,0.35,'2015-01-04','A');
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `emp_id` int NOT NULL AUTO_INCREMENT,
  `l_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `f_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cell` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ssn` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `d_birth` date DEFAULT NULL,
  `d_start` date DEFAULT NULL,
  `d_end` date DEFAULT NULL,
  `pos_id` smallint unsigned DEFAULT NULL,
  `salary` decimal(20,2) DEFAULT NULL,
  `hourly_rate` decimal(5,2) DEFAULT NULL,
  `d_review` date DEFAULT NULL,
  `wh_id` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `memo` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT 'N/A',
  PRIMARY KEY (`emp_id`),
  UNIQUE KEY `UNIQUE_ssn_emp` (`ssn`),
  KEY `FK_emp_pos` (`pos_id`),
  KEY `FK_emp_wh` (`wh_id`),
  CONSTRAINT `FK_emp_pos` FOREIGN KEY (`pos_id`) REFERENCES `employee_position` (`pos_id`),
  CONSTRAINT `FK_emp_wh` FOREIGN KEY (`wh_id`) REFERENCES `warehouse` (`wh_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Bowers','David','10124 Metropolitan Drive','Seattle','WA','98117','2062465132','2065754321','154003785','1985-09-12','1998-01-22',NULL,1,72000.00,NULL,NULL,'WA-1',''),(2,'Iko','Robert','698 Round Mountain','Seattle','WA','98124','2065472315','2064875312','705246513','1994-12-16','2006-12-15',NULL,7,59500.00,NULL,'2007-06-15','WA-1',''),(3,'Sanchez','Virginia','201 River Road','Spokane','WA','99215','5093451687','5096348732','724568132','1988-10-24','2004-06-10',NULL,2,48500.00,NULL,'2007-12-15','WA-1','Emergency contact for alarm company'),(7,'Castillo','Brian','52 Denton Drive #49','Portland','OR','97205','5035742742','5035647154','923546124','1990-08-14','2001-06-14',NULL,3,NULL,12.75,'2008-06-14','OR-1',''),(8,'Cox','Cynthia','1515 Patterson Road','Portland','OR','97210','5032412423','5035496113','854230000','1985-10-06','2006-12-30',NULL,2,50000.00,NULL,'2007-06-30','OR-1',''),(9,'Maestas','John','5506 Beach Street West','Spokane','WA','99216','5096741543','5093782312','487002468','1995-11-24','2001-11-15',NULL,4,42500.00,NULL,'2007-11-01','WA-1','Speaks fluent Spanish'),(11,'Colmenero','Darnell','6000 Balcones Drive','Seattle','WA','98113','2063475354','2063547215','723549785','1997-04-05','2002-09-02',NULL,3,NULL,15.00,'2008-09-15','WA-1',''),(12,'Lu','James','5003 Mallard Avenue #587','Jackson Hole','WY','83001','3076784513','3072468732','709564321','1999-12-31','2005-02-24',NULL,2,48500.00,NULL,'2007-02-24','WY-1','Speaks fluent Chinese'),(14,'Hargadon','Richard','901 Great Oaks Cove','Seattle','WA','98154','2063547987','2063541287','984651372','1991-03-01','2006-07-15',NULL,6,NULL,10.50,'2007-08-15','WA-1',''),(15,'Nader','John','321 Sturgis','Jackson Hole','WY','83001','3075467135','3072468731','905346755','1992-04-24','2001-08-01',NULL,3,NULL,11.25,'2008-08-01','WY-1',''),(16,'Medrano','George','3987 NW 87th Street #8','Seattle','WA','98124','2063412024','2063241200','546570000','1994-04-10','2006-10-15',NULL,6,NULL,11.25,'2008-10-15','WA-1',''),(17,'Goodman','Rachel','9876 Parker Street','Portland','OR','97204','5032415756','5032175613','978451342','1997-06-21','2004-11-03',NULL,5,NULL,12.75,'2008-01-15','OR-1','On maternity leave through 12/2008'),(18,'Anderson','Shayla','4321 Barton Cliff Drive','Seattle','WA','98124','2063214571','2063218756','926543210','1988-09-28','2003-09-24',NULL,6,NULL,12.50,'2008-09-15','WA-1',''),(19,'Ozmun','Alfonso','510 Immanuel Avenue','Seattle','WA','98126','2063124024','2062497513','946532100','1990-05-30','2005-06-15',NULL,5,NULL,12.00,'2008-02-28','WA-1',''),(20,'Nunis','Sophia','5471 Wyoming Springs Way','Spokane','WA','99214','5093478992','5098973246','987451372','1989-12-12','2006-10-20',NULL,6,NULL,12.00,'2008-01-15','WA-1',''),(21,'Nettles','Dora','24 Frontier Trail NE','Seattle','WA','98123','2067546512','2065795462','723246512','1988-10-14','2002-10-21',NULL,3,NULL,14.75,'2008-02-15','WA-1',''),(22,'Romano','Kristina','8 Anderson Loop','Seattle','WA','98113','2062449876','2062748648','704513547','1997-06-20','2001-05-20',NULL,4,45000.00,NULL,'2008-05-01','WA-1',''),(23,'Hearne','Doug','11 Lost Pine Trail','Portland','OR','97204','5032462465','5037654354','722154321','1982-05-21','2004-01-15',NULL,6,NULL,12.75,'2008-01-15','OR-1',''),(24,'Murphy','Tom','4007 James White Avenue','Portland','OR','97214','5032471355','5037543257','701543216','1977-06-05','2004-02-16',NULL,6,NULL,13.00,'2008-03-15','OR-1',''),(25,'Castro','Felicia','611 Montclaire Street','Portland','OR','97226','5037543871','5034757135','724216452','1980-09-14','2005-03-16',NULL,6,NULL,12.50,'2008-03-15','OR-1',''),(26,'Chiles','Gene','2506 Ferguson Lane #411','Portland','OR','97215','5032798246','5032467835','954321642','1982-07-05','2004-03-01',NULL,6,NULL,12.50,'2008-03-01','OR-1',''),(27,'Meyer','Kirby','110 Ponderosa','Portland','OR','97209','5032716579','5032795132','984651357','1980-11-12','2005-05-31',NULL,4,42500.00,NULL,'2007-12-15','OR-1',''),(28,'Bostic','Jim','1201 Chestnut Avenue #2','Portland','OR','97211','5032715496','5032164573','454006543','1979-12-12','2005-07-06',NULL,6,NULL,11.75,'2008-07-01','OR-1',''),(29,'McKeeman','Leland','79513 Airport Blvd.','Jackson Hole','WY','83005','3072462135','3072462465','963124672','1978-11-01','2004-09-25',NULL,3,NULL,14.50,'2008-09-01','WY-1',''),(30,'Ragland','Wade','9714 Circle Drive','Jackson Hole','WY','83005','3072749264','3072243241','706324675','1980-03-01','2004-09-25',NULL,4,43500.00,NULL,'2008-09-01','WY-1',''),(31,'Zucker','Cynthia','304 Ridgewood Drive #1','Jackson Hole','WY','83002','3075556432','3072465796','705315790','1967-08-22','2001-06-22',NULL,6,NULL,11.50,'2007-06-01','WY-1',''),(32,'Virr','Lisa','10086 Wells Parkway','Jackson Hole','WY','83010','3072746313','3072154324','421001579','1980-11-28','2006-11-16',NULL,5,NULL,11.50,'2007-11-15','WY-1',''),(33,'Pichardo','Shane','8301 Alvin High Blvd.','Jackson Hole','WY','83011','3075553216','3072468763','987465137','1983-12-14','2006-01-29',NULL,6,NULL,11.50,'2007-01-15','WY-1',''),(34,'Pena','Richard','5713 Mystic Street','Jackson Hole','WY','83012','3072456876','3072132762','716543272','1981-02-24','2006-04-26',NULL,6,NULL,11.75,'2007-11-25','WY-1',''),(35,'Collins','Jason','10275 Sam Bass Road','Jackson Hole','WY','83012','3072623546','3072664533','722165711','1980-10-14','2005-08-01',NULL,6,NULL,11.85,'2007-08-01','WY-1','');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_position`
--

DROP TABLE IF EXISTS `employee_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_position` (
  `pos_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `pos_cat` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pos_desc` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`pos_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_position`
--

LOCK TABLES `employee_position` WRITE;
/*!40000 ALTER TABLE `employee_position` DISABLE KEYS */;
INSERT INTO `employee_position` VALUES (1,'owner','manage the company'),(2,'office staff','deal with orders'),(3,'moving assistant','help move'),(4,'finance manager','manage company finances'),(5,'HR specialist','handle recruitment and employee relations'),(6,'IT technician','manage and maintain IT infrastructure'),(7,'marketing executive','promote company products and services');
/*!40000 ALTER TABLE `employee_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_detail`
--

DROP TABLE IF EXISTS `job_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_detail` (
  `order_id` int unsigned NOT NULL,
  `vehicle_id` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `driver_id` int unsigned NOT NULL,
  `mileage_actual` decimal(10,2) NOT NULL,
  `weight_actual` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK_jd_vehicle` (`vehicle_id`),
  KEY `FK_jd_driver` (`driver_id`),
  CONSTRAINT `FK_jd_driver` FOREIGN KEY (`driver_id`) REFERENCES `driver` (`driver_id`),
  CONSTRAINT `FK_jd_order` FOREIGN KEY (`order_id`) REFERENCES `job_order` (`order_id`),
  CONSTRAINT `FK_jd_vehicle` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_detail`
--

LOCK TABLES `job_detail` WRITE;
/*!40000 ALTER TABLE `job_detail` DISABLE KEYS */;
INSERT INTO `job_detail` VALUES (2,'TRK-003',4,68.00,1300.00),(4,'TRK-002',3,115.00,1175.00),(5,'TRK-003',4,129.00,5675.00),(6,'TRK-003',4,56.00,5575.00),(7,'TRK-004',1,225.00,5286.00),(8,'TRK-006',1,356.00,3275.00),(9,'TRK-007',1,220.00,6000.00),(10,'TRK-005',2,138.00,4275.00),(11,'TRK-005',2,115.00,4257.00);
/*!40000 ALTER TABLE `job_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_order`
--

DROP TABLE IF EXISTS `job_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_order` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `cust_id` int unsigned NOT NULL,
  `emp_id` int NOT NULL,
  `d_order` date NOT NULL,
  `d_move` date NOT NULL,
  `from_address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_city` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_state` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_city` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_state` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `distance_est` int unsigned NOT NULL,
  `weight_est` int unsigned NOT NULL,
  `has_packing` tinyint(1) NOT NULL,
  `has_heavy_items` tinyint(1) NOT NULL,
  `has_storage` tinyint(1) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK_jo_cust` (`cust_id`),
  KEY `FK_jo_emp` (`emp_id`),
  CONSTRAINT `FK_jo_cust` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`),
  CONSTRAINT `FK_jo_emp` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_order`
--

LOCK TABLES `job_order` WRITE;
/*!40000 ALTER TABLE `job_order` DISABLE KEYS */;
INSERT INTO `job_order` VALUES (1,1,7,'2016-10-11','2016-10-15','9001 Shady Lane','Bend','OR','9000 Smith Avenue','Eugene','OR',115,5500,1,1,0),(2,3,8,'2016-07-18','2016-10-18','87998 McDonald Road','Eugene','OR','78987 Garrison Way','Salem','OR',65,2000,0,0,0),(4,9,17,'2016-05-08','2016-10-08','8900 Washington Street','Astoria','OR','6755 Garrison Park Road','Pendleton','OR',300,7000,1,1,0),(5,16,23,'2016-01-15','2016-10-15','2344 Grandview St','Portland','OR','309 Fifth Street S','Bremeton','WA',175,5500,1,1,1),(6,13,24,'2016-06-15','2016-11-15','1200 Haven Street','Salem','OR','10928 Garrison Rd','Medford','OR',225,5000,1,1,0),(7,7,25,'2016-06-15','2016-11-15','2099 Nature Walk Rd','Salem','OR','8378 Eighth Ave S','Medford','OR',225,2000,1,0,0),(8,4,26,'2016-06-15','2016-11-15','1200 College Street','Salem','OR','7898 Gergory Court','Medford','OR',225,3500,1,0,0),(9,4,27,'2016-06-18','2016-11-18','1098 Keystone St','Bend','OR','8798 Hannah Way','Eugene','OR',115,3000,1,1,0),(10,10,28,'2016-06-20','2016-11-20','20005 Perking Rd','Pendleton','OR','8777 Austin Lea Road','Bend','OR',243,2500,1,0,0),(11,10,1,'2016-09-05','2016-09-05','1789 Eighth Avenue','Spokane','WA','7899 Grandview Apt #5','Pullman','WA',60,1250,1,1,0),(12,26,2,'2016-08-15','2016-09-15','4433 Grindstaff St','Kennewick','WA','#3 Madison Ct','Richmond','WA',10,2000,0,0,0),(13,36,3,'2016-08-20','2016-09-20','9000 Greely Pkwy','Seattle','WA','6788 Fifth Avenue','Tacoma','WA',15,1200,1,1,0),(14,18,9,'2016-08-30','2016-09-30','143 Faulkner Lane','Bellingham','WA','6788 Carson Road','Tacoma','WA',120,5500,1,1,0),(15,27,11,'2016-09-01','2016-10-01','7990 Bellington Road','Mount Vernon','WA','78661 Davidson Drive','Marysville','WA',35,5500,1,1,0),(21,13,29,'2016-10-02','2016-10-20','7890 Grapevine Court','Riverton','WY','666 Grand Pead Drive','Casper','WY',120,2500,0,1,0),(22,22,30,'2016-10-04','2016-10-14','1290 Franklin Street','Rock Springs','WY','3409 Greelee St','Cheyenne','WY',260,6000,1,1,1),(23,22,31,'2016-10-02','2016-10-22','# 3 Madison Ct','Rock Springs','WY','2456 Faulkner Road','Cheyenne','WY',260,5000,1,1,0),(27,10,35,'2016-10-05','2016-11-05','1200 Greenlee Way','Cheyenne','WY','39098 Scotland Court','Jackson','WY',436,2000,1,1,1);
/*!40000 ALTER TABLE `job_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lease`
--

DROP TABLE IF EXISTS `lease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lease` (
  `lease_id` int unsigned NOT NULL AUTO_INCREMENT,
  `cust_id` int unsigned NOT NULL,
  `unit_id` tinyint unsigned NOT NULL,
  `d_in` date NOT NULL,
  `d_out` date DEFAULT NULL,
  PRIMARY KEY (`lease_id`),
  KEY `FK_lease_cust` (`cust_id`),
  KEY `FK_lease_unit` (`unit_id`),
  CONSTRAINT `FK_lease_cust` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`),
  CONSTRAINT `FK_lease_unit` FOREIGN KEY (`unit_id`) REFERENCES `storage_unit` (`unit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lease`
--

LOCK TABLES `lease` WRITE;
/*!40000 ALTER TABLE `lease` DISABLE KEYS */;
INSERT INTO `lease` VALUES (3,4,3,'2016-02-15',NULL),(4,6,5,'2016-01-01',NULL),(5,7,6,'2016-01-15',NULL),(7,9,10,'2016-02-15',NULL),(8,10,6,'2016-02-01',NULL),(9,10,7,'2016-02-01',NULL),(10,10,8,'2016-02-15',NULL),(11,11,2,'2016-01-15',NULL),(12,12,2,'2016-02-15',NULL),(13,12,6,'2016-02-01',NULL),(14,13,4,'2016-02-01',NULL),(15,13,5,'2016-02-01',NULL),(16,14,4,'2016-02-15',NULL),(19,18,7,'2016-02-01',NULL),(20,20,6,'2016-01-15',NULL),(21,26,2,'2016-02-01',NULL),(22,27,8,'2016-02-01',NULL),(24,32,9,'2016-01-05',NULL),(25,36,10,'2016-02-15',NULL);
/*!40000 ALTER TABLE `lease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage_unit`
--

DROP TABLE IF EXISTS `storage_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storage_unit` (
  `unit_id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `wh_id` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_size` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rent` decimal(10,2) NOT NULL,
  PRIMARY KEY (`unit_id`,`wh_id`),
  KEY `FK_su_wh` (`wh_id`),
  CONSTRAINT `FK_su_wh` FOREIGN KEY (`wh_id`) REFERENCES `warehouse` (`wh_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage_unit`
--

LOCK TABLES `storage_unit` WRITE;
/*!40000 ALTER TABLE `storage_unit` DISABLE KEYS */;
INSERT INTO `storage_unit` VALUES (1,'OR-1','8 x 8',25.00),(1,'WA-1','12 x 12',35.00),(1,'WY-1','12 x 12',45.00),(2,'OR-1','8 x 12',30.00),(2,'WA-1','12 x 12',35.00),(2,'WY-1','12 x 12',45.00),(3,'OR-1','8 x 8',25.00),(3,'WA-1','9 x 12',30.00),(3,'WY-1','12 x 12',45.00),(4,'OR-1','8 x 12',30.00),(4,'WA-1','9 x 12',30.00),(4,'WY-1','12 x 18',70.00),(5,'OR-1','8 x 8',25.00),(5,'WA-1','12 x 12',85.00),(5,'WY-1','12 x 18',70.00),(6,'OR-1','8 x 12',30.00),(6,'WA-1','12 x 12',85.00),(6,'WY-1','12 x 12',45.00),(7,'OR-1','8 x 10',25.00),(7,'WA-1','12 x 10',80.00),(7,'WY-1','12 x 12',85.00),(8,'OR-1','15 x 15',95.00),(8,'WA-1','12 x 10',80.00),(8,'WY-1','12 x 8',35.00),(9,'OR-1','15 x 15',95.00),(9,'WA-1','18 x 18',115.00),(9,'WY-1','15 x 15',95.00),(10,'OR-1','15 x 15',95.00),(10,'WA-1','18 x 18',115.00),(10,'WY-1','18 x 18',115.00);
/*!40000 ALTER TABLE `storage_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle` (
  `vehicle_id` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plate_num` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `axles` tinyint NOT NULL,
  `color` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`vehicle_id`),
  UNIQUE KEY `UNIQUE_plate_num` (`plate_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES ('TRK-001','JFG 899',4,'Green'),('TRK-002','KKL 900',4,'Blue'),('TRK-003','YTT 899',1,'Blue'),('TRK-004','RYH 900',1,'Red'),('TRK-005','MLK 441',4,'Blue'),('TRK-006','LNS 550',2,'Red'),('TRK-007','KRN 001',2,'Blue'),('TRK-008','KVV 879',4,'Red'),('TRK-009','XXV 898',4,'Green'),('TRK-010','LLO 689',4,'Blue'),('TRK-011','LMN 899',4,'White'),('VAN-001','KVJ 555',2,'White'),('VAN-002','UJK 444',2,'White'),('VAN-003','JKL 133',2,'White'),('VAN-004','VNN 890',2,'White'),('VAN-005','JKL 898',2,'White'),('VAN-009','RLL 909',2,'White');
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse` (
  `wh_id` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_climate_control` tinyint(1) NOT NULL,
  `has_security_gate` tinyint(1) NOT NULL,
  PRIMARY KEY (`wh_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES ('OR-1','#3 Industrial Park Way','Portland','OR','97212','5035512423',0,1),('WA-1','8798 Warehouse Rd','Seattle','WA','98121','2063242312',1,1),('WY-1','54781 Hixson Pike','Jackson Hole','WY','83001','3075413571',1,0);
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-13  2:34:40
