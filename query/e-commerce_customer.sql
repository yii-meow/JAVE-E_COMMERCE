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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_ID` int(11) NOT NULL AUTO_INCREMENT,
  `customer_username` varchar(30) DEFAULT NULL,
  `customer_password` varchar(255) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_email` varchar(50) DEFAULT NULL,
  `customer_address` varchar(255) DEFAULT NULL,
  `gender` enum('M','F') DEFAULT NULL,
  PRIMARY KEY (`customer_ID`),
  UNIQUE KEY `customer_username_UNIQUE` (`customer_username`),
  UNIQUE KEY `customer_email_UNIQUE` (`customer_email`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'yiyi','c0fb82c01c336cc6f4ca51b5f7cace0d','yiyi','yiyi@gmail.com','123','F'),(2,'xiaocherk','26ba1749cfa68749e210605e0d79c74f','xiaocherk','xiaocherk@gmail.com','456','F'),(3,'zx','e6c760b3216a51c656c5861d72d5bf62','zx','zx@gmail.com','zx','F'),(4,'xz','e6c760b3216a51c656c5861d72d5bf62','xz','xz@gmail.com','xz','F'),(5,'ab','187ef4436122d1cc2f40dc2b92f0eba0','ab','ab@gmail.com','ab','F'),(6,'qw','006d2143154327a64d86a264aea225f3','qw','qw@gmail.com','qw','M'),(7,'yiyi11','d8b6f2da2bd832ff20eacd0a216bed89','yiyi11','yiyi11@gmail.com','yiyi11','F'),(8,'yiyi22','56909cc00fecc9fe1ec875cc2e308738','yiyi22','yiyi22@gmail.com','yiyi22','F'),(9,'yiyi33','3b5f03326b142ed3766d5be76f36d4e0','yiyi33','yiyi33@gmail.com','yiyi33','F'),(10,'yiyi44','1d39896911966c918280845b0d718283','yiyi44','yiyi44@gmail.com','yiyi44','F'),(11,'ys-01','195c76c2bf21f78371cd6437e694f1a6','ys_01','ys_01@gmail.com','123312','M'),(12,'faker','619dea94b332475cc6271c4db2511f73','faker','faker@gmail.com','Korea','M'),(13,'lasza','b99f5d6e0025cb5021771258aefd79a3','Lasza','lasza@gmail.com','KL','F'),(14,'messi','1463ccd2104eeb36769180b8a0c86bb6','Lionel Messi','messi@gmail.com','Paris','M'),(15,'ronaldo','c5aa3124b1adad080927ce4d144c6b33','CR7','cr7@gmail.com','Manchester','M'),(16,'debruyne','f64ee247538df5cb48574da170deaa77','De Bruyne','debruyne@gmail.com','Manchester','M'),(17,'steph','e8fab42752f318b2b2beb039a57dedcd','Stephen Curry','steph@gmail.com','Golden State','M'),(18,'lebron','021a304869b110c86d032f41fdcd05c7','Lebron James','lebron@gmail.com','Los Angeles','M'),(19,'neymar','70080aa08b4fe2b66aae3baea7e4a99f','Neymar JR','neymar@gmail.com','Paris','M'),(20,'mbappe','455ad4beb47b2970cd7ae57468d3e03e','Kylian Mybappe','mybappe@gmail.com','Paris','M'),(21,'chelsea','91cb315a6405bfcc30e2c4571ccfb8ce','Chelsea','chelsea@gmail.com','123','F'),(22,'java','93f725a07423fe1c889f448b33d21f46','Java','java@gmail.com','123','M'),(23,'xc','3e5608365c35542cb4be21e449ede146','xc','xc22@gmail.com','k80,Taman Saga, 52000,Ampang','F'),(31,'laixiaocherk','13418aab3d3ae9e9c8c72aa5d5b1821a','laixiao','laixiao88@gmail.com','T6,Taman Cheras, 53000, Kuala Lumpur','F');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-16 12:29:49
