-- MySQL dump 10.13  Distrib 5.7.26, for Linux (x86_64)
--
-- Host: localhost    Database: hotelDB
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Hotel`
--

DROP TABLE IF EXISTS `Hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Hotel` (
  `HOTEL_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRICE` double DEFAULT NULL,
  `hotel_name` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(25) DEFAULT NULL,
  `state` varchar(25) DEFAULT NULL,
  `zip` varchar(15) DEFAULT NULL,
  `country` varchar(25) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`HOTEL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hotel`
--

LOCK TABLES `Hotel` WRITE;
/*!40000 ALTER TABLE `Hotel` DISABLE KEYS */;
INSERT INTO `Hotel` VALUES (1,199,'Westin Diplomat','3555 S. Ocean Drive','Hollywood','FL','33019','USA',0,NULL),(2,60,'Jameson Inn','890 Palm Bay Rd NE','Palm Bay','FL','32905','USA',0,NULL),(3,199,'Chilworth Manor','The Cottage, Southampton Business Park','Southampton','Hants','SO16 7JF','UK',0,NULL),(4,120,'Marriott Courtyard','Tower Place, Buckhead','Atlanta','GA','30305','USA',0,NULL),(5,180,'Doubletree','Tower Place, Buckhead','Atlanta','GA','30305','USA',0,NULL),(6,450,'W Hotel','Union Square, Manhattan','NY','NY','10011','USA',0,NULL),(7,450,'W Hotel','Lexington Ave, Manhattan','NY','NY','10011','USA',0,NULL),(8,250,'Hotel Rouge','1315 16th Street NW','Washington','DC','20036','USA',0,NULL),(9,300,'70 Park Avenue Hotel','70 Park Avenue','NY','NY','10011','USA',0,NULL),(10,300,'Conrad Miami','1395 Brickell Ave','Miami','FL','33131','USA',0,NULL),(11,80,'Sea Horse Inn','2106 N Clairemont Ave','Eau Claire','WI','54703','USA',0,NULL),(12,90,'Super 8 Eau Claire Campus Area','1151 W Macarthur Ave','Eau Claire','WI','54701','USA',0,NULL),(13,160,'Marriot Downtown','55 Fourth Street','San Francisco','CA','94103','USA',0,NULL),(14,200,'Hilton Diagonal Mar','Passeig del Taulat 262-264','Barcelona','Catalunya','08019','Spain',0,NULL),(15,210,'Hilton Tel Aviv','Independence Park','Tel Aviv','','63405','Israel',0,NULL),(16,240,'InterContinental Tokyo Bay','Takeshiba Pier','Tokyo','','105','Japan',0,NULL),(17,130,'Hotel Beaulac',' Esplanade L?opold-Robert 2','Neuchatel','','2000','Switzerland',0,NULL),(18,140,'Conrad Treasury Place','William & George Streets','Brisbane','QLD','4001','Australia',0,NULL),(19,230,'Ritz Carlton','1228 Sherbrooke St','West Montreal','Quebec','H3G1H6','Canada',0,NULL),(20,460,'Ritz Carlton','Peachtree Rd, Buckhead','Atlanta','GA','30326','USA',0,NULL),(21,220,'Swissotel','68 Market Street','Sydney','NSW','2000','Australia',0,NULL),(22,250,'Meli? White House','Albany Street','Regents Park London','','NW13UP','Great Britain',0,NULL),(23,210,'Hotel Allegro','171 West Randolph Street','Chicago','IL','60601','USA',0,NULL);
/*!40000 ALTER TABLE `Hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `beds` int(11) NOT NULL,
  `checkinDate` datetime DEFAULT NULL,
  `checkoutDate` datetime DEFAULT NULL,
  `smoking` bit(1) NOT NULL,
  `hotel_id` bigint(20) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_nk9v0qwqw3a619ntg8u8s6t6q` (`user_email`),
  CONSTRAINT `FK_nk9v0qwqw3a619ntg8u8s6t6q` FOREIGN KEY (`user_email`) REFERENCES `users` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,0,'2019-07-19 09:51:19','2019-07-20 09:51:19',_binary '\0',6,'nan@gmail.com'),(2,0,'2019-07-19 09:51:20','2019-07-20 09:51:20',_binary '\0',1,'nan@gmail.com'),(3,0,'2019-07-19 09:51:20','2019-07-20 09:51:20',_binary '\0',6,'nik@gmail.com'),(4,0,'2019-07-19 09:51:20','2019-07-20 09:51:20',_binary '\0',7,'nik@gmail.com'),(5,0,'2019-07-19 10:37:38','2019-07-20 10:37:38',_binary '\0',6,'nan@gmail.com'),(6,0,'2019-07-19 10:37:38','2019-07-20 10:37:38',_binary '\0',1,'nan@gmail.com'),(7,0,'2019-07-19 10:37:38','2019-07-20 10:37:38',_binary '\0',6,'nik@gmail.com'),(8,0,'2019-07-19 10:37:38','2019-07-20 10:37:38',_binary '\0',7,'nik@gmail.com');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `email` varchar(255) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('nan@gmail.com',_binary '','nandini','123','nan'),('nik@gmail.com',_binary '','nikhil','123','nik');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-19 10:46:48
