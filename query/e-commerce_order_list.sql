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
-- Table structure for table `order_list`
--

DROP TABLE IF EXISTS `order_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_list` (
  `ORDER_ID` int(11) NOT NULL,
  `PRODUCT_ID` int(11) NOT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  `SUBTOTAL` double DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`,`PRODUCT_ID`),
  UNIQUE KEY `ORDER_ID` (`ORDER_ID`,`PRODUCT_ID`),
  KEY `order_list_ibfk_2` (`PRODUCT_ID`),
  CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`ORDER_ID`) REFERENCES `orders` (`ORDER_ID`),
  CONSTRAINT `order_list_ibfk_2` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `product` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_list`
--

LOCK TABLES `order_list` WRITE;
/*!40000 ALTER TABLE `order_list` DISABLE KEYS */;
INSERT INTO `order_list` VALUES (1,5,5,50000),(1,6,3,36),(2,5,4,40000),(2,10,3,60),(2,11,6,90),(3,5,4,40000),(4,6,4,48),(4,10,4,80),(5,10,1,20),(5,11,2,30),(6,6,2,24),(7,5,1,10000),(7,6,2,24),(8,8,1,30),(8,11,1,15),(9,6,2,24),(10,11,3,45),(67,5,4,39200),(67,6,4,47.04),(67,8,4,117.6),(67,26,5,8820),(70,6,2,23.52),(71,5,1,9800),(71,6,2,23.52),(72,5,1,9800),(72,6,2,23.52),(73,5,1,9800),(73,6,2,23.52),(74,5,1,9800),(74,6,2,23.52),(75,6,2,23.52),(76,5,1,9800),(77,5,2,19600),(78,5,1,9800),(79,27,1,19600),(80,28,1,2.94),(81,26,1,1764),(82,32,1,245),(83,11,1,14.7),(84,11,1,14.7),(85,6,2,23.52),(86,8,3,88.2),(86,10,2,39.2),(87,5,2,19600),(87,8,2,58.8),(88,5,3,29400),(89,5,1,9800),(96,6,3,35.28),(97,6,3,35.28),(98,6,2,23.52),(99,6,2,23.52),(100,5,1,9800),(101,5,1,9800),(102,5,1,9800),(103,5,1,9800),(104,6,1,11.76),(105,6,1,11.76),(106,6,1,11.76),(107,8,2,58.8),(108,8,1,29.4),(109,8,2,58.8),(109,10,3,58.8),(110,8,3,88.2),(110,25,2,98),(111,6,1,11.76),(112,25,1,49),(113,11,2,29.4),(114,5,9,88200),(115,5,2,19600),(116,6,4,47.04),(117,25,3,147),(118,5,2,19600),(118,10,4,78.4),(119,10,3,58.8),(120,5,3,29400),(121,5,1,9800),(122,10,5,98),(123,10,4,78.4),(128,6,1,11.76),(129,8,1,29.4),(130,8,2,58.8),(131,25,2,98),(132,6,2,23.52),(133,11,3,42.75),(134,5,1,9800),(135,11,2,29.4),(135,29,2,294),(136,10,2,39.2),(148,25,1,49),(149,25,1,49),(150,25,1,49),(151,25,1,49),(152,25,1,49),(153,25,1,49),(154,29,1,147),(155,6,1,11.76);
/*!40000 ALTER TABLE `order_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-16 12:29:52
