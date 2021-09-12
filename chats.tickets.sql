-- MySQL dump 10.19  Distrib 10.2.40-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: chats
-- ------------------------------------------------------
-- Server version	10.2.40-MariaDB-1:10.2.40+maria~bionic

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL,
  `age` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'N/A',
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
INSERT INTO `tickets` VALUES (10101171,'23 ч 12 мин','2021-09-01 09:00:11','2021-09-01 09:03:22','2021-09-01 09:03:16',NULL,'закрыта успешно','3 normal','BSC Support::Urgent','разблокировано','GAR5KSN','Regina','Gainullina',NULL,NULL,'Robot <landing@boschcarservice.ru>','Заполнена форма с сайта',0,NULL,3,26,NULL,NULL),(10101173,'22 ч 52 мин','2021-09-01 09:20:11','2021-09-01 09:32:52','2021-09-01 09:31:55',NULL,'закрыта успешно','3 normal','BSC Support::Urgent','разблокировано','GAR5KSN','Regina','Gainullina',NULL,NULL,'cb29032@vh112.timeweb.ru','Онлайн-запись с Boschcarservice',0,NULL,12,17,NULL,NULL),(10101175,'22 ч 32 мин','2021-09-01 09:40:13','2021-09-01 09:48:20','2021-09-01 09:48:16',NULL,'закрыта успешно','3 normal','BSC Support::Urgent','разблокировано','GAR5KSN','Regina','Gainullina',NULL,NULL,'Robot <landing@boschcarservice.ru>','Заполнена форма с сайта',0,NULL,8,21,NULL,NULL),(10101176,'22 ч 32 мин','2021-09-01 09:40:13','2021-09-01 09:53:50','2021-09-01 09:53:45',NULL,'закрыта успешно','3 normal','BSC Support::Urgent','разблокировано','GAR5KSN','Regina','Gainullina',NULL,NULL,'Robot <landing@boschcarservice.ru>','Заполнена форма с сайта',0,NULL,13,16,NULL,NULL),(10101213,'18 ч 32 мин','2021-09-01 13:40:17','2021-09-01 13:51:28','2021-09-01 13:51:22',NULL,'закрыта успешно','3 normal','BSC Support::Urgent','разблокировано','GAR5KSN','Regina','Gainullina',NULL,NULL,'Robot <landing@boschcarservice.ru>','Заполнена форма с сайта',0,NULL,11,18,NULL,NULL),(10101216,'18 ч 12 мин','2021-09-01 14:00:17','2021-09-01 14:16:34','2021-09-01 14:16:29',NULL,'закрыта успешно','3 normal','BSC Support::Urgent','разблокировано','GAR5KSN','Regina','Gainullina',NULL,NULL,'Robot <landing@boschcarservice.ru>','Заполнена форма с сайта',0,NULL,16,13,NULL,NULL),(10101223,'17 ч 32 мин','2021-09-01 14:40:21','2021-09-01 14:59:29','2021-09-01 14:59:20',NULL,'закрыта успешно','3 normal','BSC Support::Urgent','разблокировано','GAR5KSN','Regina','Gainullina',NULL,NULL,'cb29032@vh112.timeweb.ru','Онлайн-запись с Boschcarservice',0,NULL,19,10,NULL,NULL),(10101224,'17 ч 32 мин','2021-09-01 14:40:21','2021-09-01 15:00:48','2021-09-01 15:00:41',NULL,'закрыта успешно','3 normal','BSC Support::Urgent','разблокировано','GAR5KSN','Regina','Gainullina',NULL,NULL,'cb29032@vh112.timeweb.ru','Онлайн-запись с Boschcarservice',0,NULL,20,9,NULL,NULL),(10101243,'15 ч 52 мин','2021-09-01 16:20:19','2021-09-01 16:32:15','2021-09-01 16:32:09',NULL,'закрыта успешно','3 normal','BSC Support::Urgent','разблокировано','GAR5KSN','Regina','Gainullina',NULL,NULL,'cb29032@vh112.timeweb.ru','Онлайн-запись с Boschcarservice',0,NULL,11,18,NULL,NULL),(10101246,'15 ч 22 мин','2021-09-01 16:50:22','2021-09-01 16:58:20','2021-09-01 16:58:14',NULL,'закрыта успешно','3 normal','BSC Support::Urgent','разблокировано','GAR5KSN','Regina','Gainullina',NULL,NULL,'cb29032@vh112.timeweb.ru','Онлайн-запись с Boschcarservice',0,NULL,7,22,NULL,NULL),(10101258,'2 ч 52 мин','2021-09-02 05:20:23','2021-09-02 06:15:03','2021-09-02 06:14:52',NULL,'закрыта успешно','3 normal','BSC Support::Urgent','разблокировано','GAR5KSN','Regina','Gainullina',NULL,NULL,'Robot <landing@boschcarservice.ru>','Заполнена форма с сайта',0,NULL,15,14,NULL,NULL),(10101259,'1 ч 52 мин','2021-09-02 06:20:24','2021-09-02 06:37:04','2021-09-02 06:36:58',NULL,'закрыта успешно','3 normal','BSC Support::Urgent','разблокировано','GAR5KSN','Regina','Gainullina',NULL,NULL,'Robot <landing@boschcarservice.ru>','Заполнена форма с сайта',0,NULL,16,13,NULL,NULL);
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

-- Dump completed on 2021-09-12 18:46:22
