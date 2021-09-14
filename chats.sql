-- MySQL dump 10.19  Distrib 10.2.40-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: chats
-- ------------------------------------------------------
-- Server version	10.2.40-MariaDB-1:10.2.40+maria~bionic

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
-- Table structure for table `site_reports`
--

DROP TABLE IF EXISTS `site_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT '0000-00-00',
  `site_name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT 'N/A',
  `dial_acc` int(11) DEFAULT 0,
  `call_acc` int(11) DEFAULT 0,
  `dial_not_acc` int(11) DEFAULT 0,
  `call_not_acc` int(11) DEFAULT 0,
  `dial_noreply` int(11) DEFAULT 0,
  `offline_msg` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_reports`
--

LOCK TABLES `site_reports` WRITE;
/*!40000 ALTER TABLE `site_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL,
  `age` time DEFAULT '00:00:00',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `closed` datetime DEFAULT '0000-00-00 00:00:00',
  `first_block` datetime DEFAULT '0000-00-00 00:00:00',
  `first_repl` datetime DEFAULT '0000-00-00 00:00:00',
  `state` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT 'N/A',
  `priority` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'N/A',
  `queue` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT 'N/A',
  `to_block` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT 'N/A',
  `owner` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'N/A',
  `first_name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT 'N/A',
  `last_name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT 'N/A',
  `company_id` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `customer_name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT 'N/A',
  `sender` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT 'N/A',
  `subject` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT 'N/A',
  `spent_time` int(11) DEFAULT 0,
  `message_tree` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT 'N/A',
  `solution_in_min` int(11) DEFAULT 0,
  `solution_diff_min` int(11) DEFAULT 0,
  `first_response_in_min` int(11) DEFAULT 0,
  `first_response_diff_min` int(11) DEFAULT 0,
  PRIMARY KEY (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-14 13:38:29
