


-- Arquivo gerado automaticamente com o mysqldump



-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: 172.17.0.2    Database: api_mysql
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `api_conta`
--

DROP TABLE IF EXISTS `api_conta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_conta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `saldo` decimal(12,2) NOT NULL,
  `limiteSaqueDiario` decimal(10,2) NOT NULL,
  `flagAtivo` tinyint(1) NOT NULL,
  `tipoConta` smallint(5) unsigned NOT NULL,
  `dataCriacao` datetime(6) NOT NULL,
  `idPessoa_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_conta_idPessoa_id_ddb5821f_fk_api_pessoa_id` (`idPessoa_id`),
  CONSTRAINT `api_conta_idPessoa_id_ddb5821f_fk_api_pessoa_id` FOREIGN KEY (`idPessoa_id`) REFERENCES `api_pessoa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_conta`
--

LOCK TABLES `api_conta` WRITE;
/*!40000 ALTER TABLE `api_conta` DISABLE KEYS */;
INSERT INTO `api_conta` VALUES (1,150897.55,500.00,1,1,'2017-05-15 13:20:59.000000',1),(2,180.02,500.00,1,1,'2015-06-05 11:15:02.000000',2),(3,985110.65,1500.00,1,1,'2016-01-02 10:31:56.000000',3),(4,23048.00,500.00,1,1,'2016-05-13 15:55:09.000000',4);
/*!40000 ALTER TABLE `api_conta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_pessoa`
--

DROP TABLE IF EXISTS `api_pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_pessoa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` longtext NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `dataNascimento` date NOT NULL,
  `renda` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_pessoa`
--

LOCK TABLES `api_pessoa` WRITE;
/*!40000 ALTER TABLE `api_pessoa` DISABLE KEYS */;
INSERT INTO `api_pessoa` VALUES (1,'henrique','45678945645','1991-12-16',10000.00),(2,'rafaela','32165465432','1995-01-09',15000.00),(3,'fulano','12332165432','1985-09-30',8000.00),(4,'ciclano','12232558832','1981-05-15',6000.00);
/*!40000 ALTER TABLE `api_pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_transacoes`
--

DROP TABLE IF EXISTS `api_transacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_transacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` decimal(10,2) NOT NULL,
  `dataTransacao` datetime(6) NOT NULL,
  `simbolo_moeda` varchar(3) NOT NULL,
  `idConta_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_transacoes_idConta_id_7b3317ac_fk_api_conta_id` (`idConta_id`),
  CONSTRAINT `api_transacoes_idConta_id_7b3317ac_fk_api_conta_id` FOREIGN KEY (`idConta_id`) REFERENCES `api_conta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_transacoes`
--

LOCK TABLES `api_transacoes` WRITE;
/*!40000 ALTER TABLE `api_transacoes` DISABLE KEYS */;
INSERT INTO `api_transacoes` VALUES (144,46723.54,'2017-07-11 17:11:37.000000','US$',1),(145,40306.93,'2019-09-15 12:58:44.000000','US$',3),(146,254.11,'2019-06-03 02:16:54.000000','R$',2),(147,508307.23,'2019-06-17 09:32:30.000000','R$',3),(148,17308.72,'2019-03-13 17:26:28.000000','R$',1),(149,59671.05,'2017-01-16 22:05:59.000000','US$',3),(150,87798.92,'2017-01-26 15:05:23.000000','R$',4),(151,5730.07,'2018-01-21 14:21:44.000000','US$',3),(152,151420.21,'2018-04-03 15:47:01.000000','R$',3),(153,84301.58,'2017-07-15 02:59:34.000000','US$',2),(154,378658.70,'2017-08-18 13:41:34.000000','R$',4),(155,5308.12,'2017-03-23 09:39:51.000000','US$',3),(156,1614.58,'2018-05-04 22:16:20.000000','US$',2),(157,76095.42,'2018-10-10 09:57:05.000000','R$',2),(158,357020.50,'2017-01-06 12:21:25.000000','R$',2),(159,921899.01,'2017-03-30 03:35:57.000000','US$',1),(160,3074.37,'2019-02-19 13:59:11.000000','US$',3),(161,98921.77,'2018-02-24 15:30:30.000000','US$',4),(162,7561.06,'2018-05-13 04:57:47.000000','R$',4),(163,10108.14,'2018-05-04 00:26:57.000000','US$',2),(164,1683.31,'2018-03-06 04:13:38.000000','R$',4),(165,6598.61,'2019-04-13 16:27:26.000000','R$',4),(166,1760.51,'2019-09-11 20:21:45.000000','US$',2),(167,3837.25,'2019-06-07 06:41:15.000000','R$',1),(168,2011.27,'2018-12-24 04:04:06.000000','US$',4),(169,524247.16,'2019-02-24 23:52:26.000000','US$',2),(170,86604.27,'2018-06-13 11:48:26.000000','US$',4),(171,107520.07,'2017-04-08 21:13:53.000000','R$',1),(172,25321.16,'2017-07-19 15:52:02.000000','R$',3),(173,8341.76,'2017-02-19 00:50:57.000000','US$',3),(174,3231.01,'2018-01-30 12:59:13.000000','US$',2),(175,66927.28,'2019-02-14 00:11:26.000000','US$',1),(176,66387.96,'2019-09-26 05:59:16.000000','US$',3),(177,49564.66,'2018-12-20 23:15:33.000000','R$',1),(178,760955.29,'2018-01-28 14:05:52.000000','US$',1),(179,10495.77,'2019-01-26 11:17:35.000000','R$',1),(180,6208.36,'2019-10-03 04:33:39.000000','US$',2),(181,9761.93,'2017-12-10 10:18:42.000000','R$',3),(182,92407.38,'2017-06-14 19:08:31.000000','US$',3),(183,412.34,'2017-07-18 03:18:50.000000','R$',2),(184,1846.57,'2019-03-16 04:26:35.000000','US$',4),(185,772584.47,'2018-10-24 11:11:23.000000','US$',3),(186,995002.33,'2018-12-05 10:57:35.000000','US$',1),(187,73552.94,'2019-07-18 03:28:14.000000','R$',2),(188,9516.69,'2019-02-02 11:53:41.000000','US$',2),(189,927866.00,'2019-12-24 11:01:20.000000','R$',1),(190,27227.78,'2019-07-21 23:54:44.000000','US$',1),(191,115554.47,'2018-06-26 10:01:58.000000','R$',4),(192,83312.70,'2017-06-15 20:49:18.000000','R$',1),(193,303391.12,'2018-02-04 02:01:40.000000','US$',4),(194,6023.36,'2017-09-27 13:37:02.000000','US$',3),(195,636329.51,'2018-05-07 03:09:17.000000','US$',3),(196,536516.09,'2017-03-25 21:17:09.000000','US$',1),(197,445536.28,'2019-10-17 14:37:46.000000','R$',4),(198,66893.43,'2017-06-25 15:27:51.000000','US$',3),(199,17914.84,'2019-06-29 02:55:13.000000','US$',2),(200,138649.52,'2019-05-10 03:35:59.000000','US$',4),(201,24253.73,'2019-12-11 02:48:51.000000','US$',1),(202,7450.34,'2017-05-03 03:27:23.000000','R$',3),(203,6944.46,'2018-01-05 00:32:12.000000','R$',3),(204,30418.40,'2017-11-04 12:15:23.000000','R$',4),(205,1759.87,'2018-02-05 01:20:21.000000','US$',4),(206,7393.40,'2019-07-08 10:33:34.000000','US$',3),(207,4193.95,'2019-05-06 20:18:54.000000','R$',4),(208,79329.25,'2018-10-05 19:04:21.000000','US$',1),(209,52089.63,'2018-06-09 13:21:07.000000','US$',4),(210,2231.85,'2019-02-22 08:01:40.000000','R$',1),(211,27081.74,'2019-04-19 16:31:41.000000','US$',4),(212,82763.40,'2019-03-28 17:09:14.000000','R$',4),(213,915750.88,'2019-05-10 15:14:54.000000','US$',3),(214,618061.16,'2017-06-06 14:44:47.000000','R$',4),(215,67807.56,'2017-07-26 08:33:41.000000','US$',4),(216,486223.84,'2017-09-25 20:14:46.000000','US$',3),(217,593417.90,'2017-09-18 05:55:05.000000','R$',3),(218,5295.38,'2018-11-04 07:58:02.000000','R$',2),(219,121712.70,'2019-04-17 05:48:49.000000','R$',1),(220,9112.93,'2019-04-23 00:30:35.000000','R$',1),(221,808697.05,'2018-01-27 09:10:35.000000','R$',3),(222,2535.52,'2018-09-02 06:14:28.000000','R$',4),(223,398273.80,'2018-11-04 19:21:16.000000','R$',1),(224,8088.24,'2019-09-01 19:38:46.000000','US$',4),(225,84480.09,'2019-04-13 21:52:30.000000','US$',1),(226,41284.62,'2017-08-07 11:21:58.000000','US$',4),(227,1082.23,'2017-02-17 19:48:45.000000','US$',2),(228,38979.34,'2017-06-05 06:01:59.000000','US$',2),(229,69370.85,'2018-12-02 11:39:25.000000','US$',1),(230,9955.38,'2019-03-24 12:13:34.000000','R$',2),(231,13430.02,'2019-03-23 15:08:49.000000','R$',4),(232,391388.27,'2019-06-03 03:27:42.000000','US$',1),(233,939544.35,'2017-05-21 22:21:15.000000','R$',2),(234,8291.63,'2019-12-26 14:06:52.000000','US$',1),(235,658113.99,'2017-11-17 11:36:12.000000','US$',1),(236,81016.81,'2017-08-01 22:36:52.000000','R$',1),(237,728423.22,'2017-01-12 20:22:15.000000','US$',1),(238,164325.48,'2019-02-20 11:05:49.000000','US$',2),(239,7158.39,'2017-04-27 22:08:30.000000','R$',1),(240,53044.04,'2019-08-05 23:24:16.000000','US$',1),(241,2152.22,'2019-10-24 04:46:21.000000','US$',3),(242,8834.38,'2019-06-15 18:30:52.000000','US$',3),(243,85132.34,'2017-12-23 17:25:35.000000','US$',1),(244,201186.77,'2019-11-08 11:53:22.000000','R$',2),(245,93786.68,'2017-12-28 12:16:23.000000','R$',1),(246,98202.04,'2018-05-05 21:49:54.000000','US$',4),(247,52702.68,'2017-08-02 03:22:40.000000','R$',2),(248,666213.70,'2019-05-13 14:57:56.000000','US$',4),(249,9442.80,'2017-08-18 19:52:15.000000','R$',1),(250,489716.28,'2019-07-21 15:43:08.000000','R$',3),(251,6410.90,'2017-12-29 20:12:12.000000','US$',2),(252,59.07,'2019-05-27 16:40:13.000000','US$',2),(253,84615.47,'2018-12-02 13:10:14.000000','US$',1),(254,245532.15,'2018-04-25 01:01:54.000000','R$',1),(255,2610.20,'2019-07-11 18:53:50.000000','US$',4),(256,686532.65,'2019-01-01 14:01:16.000000','R$',4),(257,175988.33,'2018-10-28 18:15:44.000000','US$',2),(258,51452.62,'2018-04-26 15:07:14.000000','US$',4),(259,5939.10,'2017-12-23 09:36:18.000000','R$',2),(260,2239.50,'2019-10-21 05:55:52.000000','US$',2),(261,2307.74,'2017-03-24 12:20:30.000000','US$',2),(262,73250.80,'2017-10-18 07:15:35.000000','US$',1),(263,427722.88,'2017-11-29 08:51:21.000000','R$',4),(264,3326.19,'2019-09-07 06:33:35.000000','US$',1),(265,28374.15,'2018-07-20 10:49:48.000000','R$',1),(266,818256.20,'2018-09-19 15:28:25.000000','US$',2),(267,719959.35,'2017-09-29 20:21:04.000000','R$',2),(268,7372.54,'2019-12-04 14:22:07.000000','US$',2),(269,43369.32,'2019-08-20 09:29:42.000000','R$',1),(270,83907.57,'2017-05-14 11:51:23.000000','R$',2),(271,63598.51,'2018-11-07 18:15:35.000000','R$',1),(272,944423.24,'2018-08-20 00:38:05.000000','US$',3),(273,2325.35,'2019-11-24 04:30:34.000000','US$',2),(274,514433.30,'2018-08-06 20:48:03.000000','US$',4),(275,293373.89,'2019-09-30 13:06:39.000000','US$',3),(276,84156.05,'2019-06-14 15:13:53.000000','R$',1),(277,293178.07,'2018-04-11 23:39:12.000000','R$',3),(278,555.83,'2017-05-11 19:43:34.000000','R$',1),(279,347369.74,'2018-08-11 14:03:22.000000','R$',4),(280,63249.65,'2018-12-29 00:37:10.000000','US$',3),(281,574721.34,'2018-04-20 14:13:15.000000','R$',3),(282,9788.09,'2019-03-15 15:41:54.000000','US$',4),(283,52442.37,'2017-05-17 15:36:28.000000','R$',4),(284,3624.16,'2018-05-23 21:25:01.000000','US$',2),(285,311118.22,'2018-08-01 14:21:05.000000','R$',2),(286,980414.95,'2018-10-17 07:44:15.000000','US$',2),(287,79539.03,'2019-02-22 21:07:15.000000','R$',1),(288,57300.22,'2017-07-22 04:57:40.000000','US$',3),(289,68182.76,'2017-02-09 21:13:29.000000','R$',1),(290,2011.67,'2018-06-28 16:55:37.000000','US$',3);
/*!40000 ALTER TABLE `api_transacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add conta',7,'add_conta'),(26,'Can change conta',7,'change_conta'),(27,'Can delete conta',7,'delete_conta'),(28,'Can view conta',7,'view_conta'),(29,'Can add pessoa',8,'add_pessoa'),(30,'Can change pessoa',8,'change_pessoa'),(31,'Can delete pessoa',8,'delete_pessoa'),(32,'Can view pessoa',8,'view_pessoa'),(33,'Can add transacoes',9,'add_transacoes'),(34,'Can change transacoes',9,'change_transacoes'),(35,'Can delete transacoes',9,'delete_transacoes'),(36,'Can view transacoes',9,'view_transacoes');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'api','conta'),(8,'api','pessoa'),(9,'api','transacoes'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-11-03 13:38:27.415250'),(2,'auth','0001_initial','2019-11-03 13:38:32.783255'),(3,'admin','0001_initial','2019-11-03 13:38:51.683207'),(4,'admin','0002_logentry_remove_auto_add','2019-11-03 13:38:56.400795'),(5,'admin','0003_logentry_add_action_flag_choices','2019-11-03 13:38:56.620544'),(6,'api','0001_initial','2019-11-03 13:39:00.360964'),(7,'contenttypes','0002_remove_content_type_name','2019-11-03 13:39:10.206826'),(8,'auth','0002_alter_permission_name_max_length','2019-11-03 13:39:14.239917'),(9,'auth','0003_alter_user_email_max_length','2019-11-03 13:39:14.700641'),(10,'auth','0004_alter_user_username_opts','2019-11-03 13:39:14.839472'),(11,'auth','0005_alter_user_last_login_null','2019-11-03 13:39:17.473686'),(12,'auth','0006_require_contenttypes_0002','2019-11-03 13:39:17.650967'),(13,'auth','0007_alter_validators_add_error_messages','2019-11-03 13:39:17.777528'),(14,'auth','0008_alter_user_username_max_length','2019-11-03 13:39:20.606542'),(15,'auth','0009_alter_user_last_name_max_length','2019-11-03 13:39:23.487442'),(16,'auth','0010_alter_group_name_max_length','2019-11-03 13:39:23.816445'),(17,'auth','0011_update_proxy_permissions','2019-11-03 13:39:24.024961'),(18,'sessions','0001_initial','2019-11-03 13:39:25.160414');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-03 11:21:11
