-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: m-mail
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.2

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
-- Table structure for table `mails`
--

DROP TABLE IF EXISTS `mails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mails` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mails`
--

LOCK TABLES `mails` WRITE;
/*!40000 ALTER TABLE `mails` DISABLE KEYS */;
INSERT INTO `mails` VALUES (10,'1','to','Павел','fg@dfdf.com','TEST','TESTTESTTESTTESTTEST','2017-07-05 16:06:41',NULL),(16,'1','to','Павел','grosesdorf@gmail.com','grgrgr','grgrgrgrg','2017-07-05 16:57:56',NULL),(17,'1','to','Valeriy jdTKxVNlF44DkCF','bdwWMPcJgufAHUJ@gmail.com','5kRytruaBy theme_subject','Что то очень важное и срочное!!','2017-07-05 17:00:06',NULL),(18,'1','to','Valeriy JLXmeLGFBkg2hLV','QABFgT4U1Jd23oS@gmail.com','tv6UmJQ6l2 theme_subject','Что то очень важное и срочное!!','2017-07-05 17:00:06',NULL),(19,'1','from','Valeriy nUcbovSsK7xfx4X','LZcoXadVjQ7e7bb@gmail.com','corZ4jlCvf theme_subject','Что то очень важное и срочное!!','2017-07-05 17:00:06',NULL),(20,'1','from','Valeriy fPe74y581FNYlKn','k4tDsmMK9uwvoJz@gmail.com','jCg4cMunEo theme_subject','Что то очень важное и срочное!!','2017-07-05 17:00:06',NULL),(21,'1','from','Valeriy fNRnN0BP9wANYlt','NkiU7PjEOIDrHql@gmail.com','MiUhRZZOQ7 theme_subject','Что то очень важное и срочное!!','2017-07-05 17:00:06',NULL),(23,'1','to','Valeriy 0TIR0VjdpheQepu','Vp8hC75a7qbqbiQ@gmail.com','jcBHJTMQws theme_subject','Что то очень важное и срочное!!','2017-07-05 17:00:49',NULL),(24,'1','from','Valeriy ebQ6GX4yRhYDFLD','5jDI7GWrhNjXVw9@gmail.com','a1xIYfP60R theme_subject','Что то очень важное и срочное!!','2017-07-05 17:00:49',NULL),(25,'1','from','Valeriy IIpvbF7K3cgNCuo','4TLP1sPMpZ8z78F@gmail.com','Yr1WaSUW23 theme_subject','Что то очень важное и срочное!!','2017-07-05 17:00:49',NULL),(26,'1','from','Valeriy EiidR0sukFcZcqC','mKYF90Y0jJWgrj0@gmail.com','1vtmeFJ4Hs theme_subject','Что то очень важное и срочное!!','2017-07-05 17:00:49',NULL),(27,'1','to','Павел','grosesdorf@gmail.com','test','hjkghjkghjkghjk','2017-07-05 17:37:44',NULL);
/*!40000 ALTER TABLE `mails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(5,'2017_07_04_173041_create_mails_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Павел','grosesdorf@gmail.com','$2y$10$CjSSxIe54t9.CQCDqqTvaOjEstYWrj27bKBL0EwTrSAj3rA3xahYC','qBxI9TdowaizyPXvSoibtE5aTYN4ANYDk6qdHiFpyyxtvcylqnpnFs6NwOf9','2017-07-04 12:54:06','2017-07-04 12:54:06'),(2,'Shureg','shureg@gmail.com','$2y$10$mkJSHVJTFkEB3G6vA9MeZuB0oMxhjGhPauvRIbHX6Y/wnUc.Ng5Oy','oAFzNaSgc9JYZZhLjPl6JQcDq1VAtkQVy45adFQKFkHpAqNyBcMAz8OShikF','2017-07-04 12:56:47','2017-07-04 12:56:47');
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

-- Dump completed on 2017-07-05 18:02:57
