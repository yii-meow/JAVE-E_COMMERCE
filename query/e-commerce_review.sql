-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: java-database.mysql.database.azure.com    Database: e-commerce
-- ------------------------------------------------------
-- Server version	5.7.32-log

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
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `REVIEW_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRODUCT_ID` int(11) NOT NULL,
  `PRODUCT_NAME` varchar(100) DEFAULT NULL,
  `REVIEW_DATE` date DEFAULT NULL,
  `RATING` int(11) DEFAULT NULL,
  `REVIEW_COMMENT` varchar(255) DEFAULT NULL,
  `Customer_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`REVIEW_ID`),
  KEY `PRODUCT_ID` (`PRODUCT_ID`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,5,'TITAN XP','2022-04-10',5,'It\'s too expensive! But it\'s good for gaming',1),(2,6,'3A Battery','2022-04-10',5,'I love the Logitech brand of products! This is my favourite brand.',4),(3,8,'CMOS Battery','2022-04-10',5,'Delivery Very Fast',8),(4,5,'TITAN XP','2022-04-10',3,'The product quality not really good',2),(5,5,'TITAN XP','2022-04-11',4,'Overall is good, but the shipment too expensive',4),(13,27,'RTX 4080','2022-04-13',5,'This graphic card quality is da best!!',1),(14,25,'Logitech Mouse','2022-04-15',1,'is fake',22),(15,25,'Logitech Mouse','2022-04-15',1,'is fake',22),(16,25,'Logitech Mouse','2022-04-15',1,'',22),(17,11,'Mousepad','2022-04-15',5,'fast delivery mousepad',22),(18,10,'Keyboard','2022-04-15',4,'the keyboard sound is quick good',22),(19,6,'3A Battery','2022-04-15',4,'FAST DELIVERY !!!!',22),(20,6,'3A Battery','2022-04-15',3,'good delivery service',22),(21,6,'3A Battery','2022-04-15',4,'good delivery service!!',22),(22,10,'Keyboard','2022-04-15',4,'Fast delivery',22),(23,29,'Nezuko Figure','2022-04-15',5,'I love all of the nezuko product!!!! The product quality is very good!!!!!',22),(24,25,'Logitech Mouse','2022-04-16',4,'the mouse quality is very good!!',22),(25,25,'Logitech Mouse','2022-04-16',5,'No device tot test mouse',22),(26,25,'Logitech Mouse','2022-04-16',5,'No device tot test mouse',22),(27,25,'Logitech Mouse','2022-04-16',5,'No device tot test mouse',22),(28,29,'Nezuko Figure','2022-04-16',5,'I love all about the nezuko product!! The product quality also quick good.',31),(29,6,'3A Battery','2022-04-16',4,'Fast delivery service and product quality is good!',31);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-16 12:29:58
