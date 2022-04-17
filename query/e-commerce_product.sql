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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `PRODUCT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRODUCT_NAME` varchar(100) DEFAULT NULL,
  `PRODUCT_DESCRIPTION` varchar(255) DEFAULT NULL,
  `STOCK` int(11) DEFAULT NULL,
  `PRICE` double DEFAULT NULL,
  `POST_DURATION` time DEFAULT NULL,
  `PRODUCT_WEIGHT` double DEFAULT NULL,
  `IS_SHIPMENT_FREE` tinyint(1) DEFAULT NULL,
  `PRODUCT_IMAGE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (5,'TITAN XP','graphis card',1,10000,'02:51:36',0.26,0,'https://i.imgur.com/QPkxcyt.jpeg'),(6,'3A Battery','3A Battery x 12',13,12,NULL,1.2,0,'https://i.imgur.com/uTDd5bA.jpeg'),(8,'CMOS Battery','CMOS Battery x 4',16,30,NULL,1,1,'https://i.imgur.com/FScxqHl.jpeg'),(10,'Keyboard','RGB Razer Keyboard',128,20,NULL,10,0,'https://i.imgur.com/R4JWiTC.jpeg'),(11,'Mousepad','120x80mm mousepad',43,15,NULL,0.5,0,'https://i.imgur.com/6Q7NFwZ.jpeg'),(12,'RTX 4090','RTX 4090',1,5000,NULL,3,0,'https://i.imgur.com/QPkxcyt.jpeg'),(25,'Logitech Mouse','Wirless 2.4 Ghz Mouse',86,50,NULL,0.5,0,'https://i.imgur.com/AwTgGcq.jpeg'),(26,'MSI Monitor','MSI 27 Inch Monitor',29,1800,NULL,2,0,'https://i.imgur.com/6aQHW3C.jpeg'),(27,'RTX 4080','Gigabyte RTX 4080 RGB',5,20000,NULL,3,0,'https://i.imgur.com/LmhH2rt.jpeg'),(28,'Nasi Lemak','Malay Food',99,3,'18:16:23',0.1,0,'https://i.imgur.com/ORS2io9.jpeg'),(29,'Nezuko Figure','Nezuko Figure Decoration',11,150,NULL,0.8,0,'https://i.imgur.com/V1lg1JV.jpeg'),(30,'LG Television','LG 4K Television',5,3000,NULL,5,0,'https://i.imgur.com/AnA7brB.jpeg'),(31,'Tanjiro Figure','Figure for Tanjirong 50 cm',10,200,NULL,0.6,1,'https://i.imgur.com/KYuSD7B.jpeg'),(32,'Rem Figure','Rem Figure',10,250,NULL,0.7,0,'https://i.imgur.com/5b3QnJ0.jpeg'),(33,'Xiao Cherk','Sell xiao cherk',1,100000,NULL,42,0,'https://cdn.discordapp.com/emojis/886883834405212201.webp?size=96&quality=lossless'),(34,'Jen Sien','Sell Jen Sien',1,99999999999999,NULL,35,0,'https://cdn.discordapp.com/emojis/915433069022969919.webp?size=96&quality=lossless'),(35,'Gordon','Gordon Ramsay',0,5000,NULL,70,0,'https://cdn.discordapp.com/emojis/913652088364486666.webp?size=96&quality=lossless'),(36,'Gaming PC Set','Case + i9 10900K + 32 GB RAM + 27.5 Inch Monitor',3,8000,NULL,2,0,'https://i.imgur.com/PK1WFTJ.jpeg'),(38,'PC Case Fan','PC Case Fan RGB x 3',100,50,NULL,0.6,0,'https://i.imgur.com/CAZ81TB.jpeg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-16 12:29:56
