-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: chengjian
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
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
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add account',7,'add_account'),(20,'Can change account',7,'change_account'),(21,'Can delete account',7,'delete_account'),(22,'Can add class',8,'add_class'),(23,'Can change class',8,'change_class'),(24,'Can delete class',8,'delete_class'),(25,'Can add homework',9,'add_homework'),(26,'Can change homework',9,'change_homework'),(27,'Can delete homework',9,'delete_homework'),(28,'Can add manager',10,'add_manager'),(29,'Can change manager',10,'change_manager'),(30,'Can delete manager',10,'delete_manager'),(31,'Can add permission',11,'add_permission'),(32,'Can change permission',11,'change_permission'),(33,'Can delete permission',11,'delete_permission'),(34,'Can add role',12,'add_role'),(35,'Can change role',12,'change_role'),(36,'Can delete role',12,'delete_role'),(37,'Can add school',13,'add_school'),(38,'Can change school',13,'change_school'),(39,'Can delete school',13,'delete_school'),(40,'Can add sign',14,'add_sign'),(41,'Can change sign',14,'change_sign'),(42,'Can delete sign',14,'delete_sign'),(43,'Can add student',15,'add_student'),(44,'Can change student',15,'change_student'),(45,'Can delete student',15,'delete_student'),(46,'Can add teacher',16,'add_teacher'),(47,'Can change teacher',16,'change_teacher'),(48,'Can delete teacher',16,'delete_teacher');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$nJzPKqjmpaNl$4sMQ5K/C2XKN1CeZ/FUVpze2Da43/KUFNUZ9sW1AYCI=','2019-03-25 08:19:39.681261',1,'李龙飞','','','',1,1,'2019-03-22 09:07:10.246265'),(2,'pbkdf2_sha256$36000$BMj4xWs4mlWF$67ZRuepnCM5nNI/kP7BJTFVjsG16kb2omdOpcUp86w0=','2019-04-13 03:03:14.823736',1,'long','','','',1,1,'2019-04-11 14:53:39.443035');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
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
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-03-22 09:11:40.840281','1','河池小学',1,'[{\"added\": {}}]',13,1),(2,'2019-03-22 09:12:31.890526','1','view',1,'[{\"added\": {}}]',11,1),(3,'2019-03-22 09:12:43.307886','2','delete',1,'[{\"added\": {}}]',11,1),(4,'2019-03-22 09:12:49.869775','3','change',1,'[{\"added\": {}}]',11,1),(5,'2019-03-22 09:13:02.964658','4','add',1,'[{\"added\": {}}]',11,1),(6,'2019-03-22 09:13:36.134393','1','老师',1,'[{\"added\": {}}]',12,1),(7,'2019-03-22 09:13:45.199692','2','学生',1,'[{\"added\": {}}]',12,1),(8,'2019-03-22 09:14:23.357512','3','管理员',1,'[{\"added\": {}}]',12,1),(9,'2019-03-22 09:15:14.268718','1','06161088',1,'[{\"added\": {}}]',7,1),(10,'2019-03-22 09:15:21.303844','1','谈耿',1,'[{\"added\": {}}]',16,1),(11,'2019-03-22 09:15:41.810020','2','06161089',1,'[{\"added\": {}}]',7,1),(12,'2019-03-22 09:15:45.055053','2','李龙飞',1,'[{\"added\": {}}]',16,1),(13,'2019-03-22 09:16:01.891363','3','06161090',1,'[{\"added\": {}}]',7,1),(14,'2019-03-22 09:16:05.715480','3','李明',1,'[{\"added\": {}}]',16,1),(15,'2019-03-22 09:16:50.157788','1','小1',1,'[{\"added\": {}}]',8,1),(16,'2019-03-22 09:17:06.167217','2','小2',1,'[{\"added\": {}}]',8,1),(17,'2019-03-22 09:17:24.852850','3','小3',1,'[{\"added\": {}}]',8,1),(18,'2019-03-22 09:17:36.313429','4','小4',1,'[{\"added\": {}}]',8,1),(19,'2019-03-22 09:17:55.426744','1','河池小学',2,'[{\"changed\": {\"fields\": [\"classes\"]}}]',13,1),(20,'2019-03-22 09:20:18.033777','4','07171000',1,'[{\"added\": {}}]',7,1),(21,'2019-03-22 09:21:01.943828','1','学1',1,'[{\"added\": {}}]',15,1),(22,'2019-03-22 09:21:32.420242','5','07171001',1,'[{\"added\": {}}]',7,1),(23,'2019-03-22 09:23:04.160123','2','学2',1,'[{\"added\": {}}]',15,1),(24,'2019-03-22 09:23:26.416823','6','07171002',1,'[{\"added\": {}}]',7,1),(25,'2019-03-22 09:23:31.482750','3','学3',1,'[{\"added\": {}}]',15,1),(26,'2019-03-22 09:23:57.279394','7','07171003',1,'[{\"added\": {}}]',7,1),(27,'2019-03-22 09:24:02.500522','4','学3',1,'[{\"added\": {}}]',15,1),(28,'2019-03-22 09:24:31.336203','8','07171004',1,'[{\"added\": {}}]',7,1),(29,'2019-03-22 09:24:38.276840','5','学5',1,'[{\"added\": {}}]',15,1),(30,'2019-03-22 09:24:45.704295','4','学4',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',15,1),(31,'2019-03-22 09:25:19.018552','9','06161089',1,'[{\"added\": {}}]',7,1),(32,'2019-03-22 09:25:59.429521','2','李龙飞',2,'[{\"changed\": {\"fields\": [\"role\"]}}]',16,1),(33,'2019-03-22 09:30:38.801102','5','2019-03-22 09:30:38.794121+00:00',1,'[{\"added\": {}}]',14,1),(34,'2019-03-22 09:31:16.175342','6','2019-03-22 09:31:16.171718+00:00',1,'[{\"added\": {}}]',14,1),(35,'2019-03-23 04:32:28.674834','3','李明',2,'[{\"changed\": {\"fields\": [\"role\"]}}]',16,1),(36,'2019-03-23 04:32:36.312257','3','李明',2,'[{\"changed\": {\"fields\": [\"role\"]}}]',16,1),(37,'2019-03-23 04:36:31.972369','1','普通老师',2,'[{\"changed\": {\"fields\": [\"name\", \"permission\"]}}]',12,1),(38,'2019-03-23 04:37:00.774258','4','班主任',1,'[{\"added\": {}}]',12,1),(39,'2019-03-23 04:39:52.181223','10','061610891',1,'[{\"added\": {}}]',7,1),(40,'2019-03-23 04:39:55.772493','4','段文超',1,'[{\"added\": {}}]',16,1),(41,'2019-03-23 04:43:53.031288','5','王二蛋',1,'[{\"added\": {}}]',16,1),(42,'2019-03-23 04:44:37.771039','11','06161092',1,'[{\"added\": {}}]',7,1),(43,'2019-03-23 04:44:41.280276','5','王二蛋',2,'[{\"changed\": {\"fields\": [\"account\"]}}]',16,1),(44,'2019-03-23 09:56:33.769112','5','view_detail',1,'[{\"added\": {}}]',11,1),(45,'2019-03-23 09:57:22.310066','4','班主任',2,'[{\"changed\": {\"fields\": [\"permission\"]}}]',12,1),(46,'2019-03-23 09:57:29.611697','3','管理员',2,'[{\"changed\": {\"fields\": [\"permission\"]}}]',12,1),(47,'2019-03-23 09:57:35.158335','2','学生',2,'[{\"changed\": {\"fields\": [\"permission\"]}}]',12,1),(48,'2019-03-23 09:57:47.975907','1','普通老师',2,'[{\"changed\": {\"fields\": [\"permission\"]}}]',12,1),(49,'2019-03-23 10:38:41.724381','12','07171005',1,'[{\"added\": {}}]',7,1),(50,'2019-03-23 10:38:48.342681','6','小5',1,'[{\"added\": {}}]',15,1),(51,'2019-03-23 13:17:19.435927','1','学1',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',15,1),(52,'2019-03-23 13:17:37.971618','7','学2',1,'[{\"added\": {}}]',15,1),(53,'2019-03-23 13:18:08.550663','8','学3',1,'[{\"added\": {}}]',15,1),(54,'2019-03-23 13:18:35.833900','9','学3',1,'[{\"added\": {}}]',15,1),(55,'2019-03-23 13:18:43.654215','9','学4',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',15,1),(56,'2019-03-23 13:18:59.756736','9','学4',2,'[{\"changed\": {\"fields\": [\"account\"]}}]',15,1),(57,'2019-03-23 13:19:03.654880','8','学3',2,'[]',15,1),(58,'2019-03-23 13:19:20.027496','10','学5',1,'[{\"added\": {}}]',15,1),(59,'2019-03-23 13:19:38.943984','13','07171006',1,'[{\"added\": {}}]',7,1),(60,'2019-03-23 13:19:45.359334','11','学6',1,'[{\"added\": {}}]',15,1),(61,'2019-03-23 13:20:25.852361','14','07171007',1,'[{\"added\": {}}]',7,1),(62,'2019-03-23 13:20:31.330061','12','学7',1,'[{\"added\": {}}]',15,1),(63,'2019-03-25 05:46:31.028420','2','李龙飞',3,'',16,1),(64,'2019-03-25 05:46:48.560318','9','06161089',3,'',7,1),(65,'2019-03-25 05:58:20.542776','6','李龙飞',2,'[{\"changed\": {\"fields\": [\"role\"]}}]',16,1),(66,'2019-03-25 05:58:31.053685','6','李龙飞',2,'[]',16,1),(67,'2019-03-25 06:01:20.484448','30','06161089',1,'[{\"added\": {}}]',7,1),(68,'2019-03-25 06:01:23.970891','6','李龙飞',2,'[{\"changed\": {\"fields\": [\"account\"]}}]',16,1),(69,'2019-03-25 06:01:39.797550','2','06161089',3,'',7,1),(70,'2019-03-25 06:01:58.302607','6','李龙飞',2,'[]',16,1),(71,'2019-03-25 06:02:19.648792','4','班主任',2,'[]',12,1),(72,'2019-03-25 06:02:51.638726','4','小4',2,'[{\"changed\": {\"fields\": [\"teacher\"]}}]',8,1),(73,'2019-03-25 06:02:56.053070','4','小4',2,'[]',8,1),(74,'2019-03-25 06:03:00.098632','3','小3',2,'[]',8,1),(75,'2019-03-25 06:03:04.933477','2','小2',2,'[]',8,1),(76,'2019-03-25 06:03:11.713184','1','小1',2,'[{\"changed\": {\"fields\": [\"teacher\"]}}]',8,1),(77,'2019-03-25 06:03:30.060927','12','学7',2,'[]',15,1),(78,'2019-03-25 06:09:30.213082','4','班主任',2,'[]',12,1),(79,'2019-04-12 10:08:21.496052','6','李龙飞',2,'[{\"changed\": {\"fields\": [\"manager_class_id\"]}}]',16,2),(80,'2019-04-12 10:08:34.347206','1','谈耿',2,'[{\"changed\": {\"fields\": [\"manager_class_id\"]}}]',16,2),(81,'2019-04-12 10:13:59.387308','6','李龙飞',2,'[{\"changed\": {\"fields\": [\"manager_class_id\"]}}]',16,2),(82,'2019-04-12 10:14:07.730521','1','谈耿',2,'[{\"changed\": {\"fields\": [\"manager_class_id\"]}}]',16,2),(83,'2019-04-13 03:05:55.802761','6','2019-03-22 09:31:16.171718+00:00',2,'[{\"changed\": {\"fields\": [\"student\"]}}]',14,2),(84,'2019-04-13 03:06:00.289980','5','2019-03-22 09:30:38.794121+00:00',2,'[{\"changed\": {\"fields\": [\"student\"]}}]',14,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(7,'show','account'),(8,'show','class'),(9,'show','homework'),(10,'show','manager'),(11,'show','permission'),(12,'show','role'),(13,'show','school'),(14,'show','sign'),(15,'show','student'),(16,'show','teacher');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-03-22 09:02:59.860112'),(2,'auth','0001_initial','2019-03-22 09:03:20.594796'),(3,'admin','0001_initial','2019-03-22 09:03:24.508889'),(4,'admin','0002_logentry_remove_auto_add','2019-03-22 09:03:24.622586'),(5,'contenttypes','0002_remove_content_type_name','2019-03-22 09:03:30.665626'),(6,'auth','0002_alter_permission_name_max_length','2019-03-22 09:03:34.175926'),(7,'auth','0003_alter_user_email_max_length','2019-03-22 09:03:34.522998'),(8,'auth','0004_alter_user_username_opts','2019-03-22 09:03:34.703517'),(9,'auth','0005_alter_user_last_login_null','2019-03-22 09:03:37.009616'),(10,'auth','0006_require_contenttypes_0002','2019-03-22 09:03:37.161211'),(11,'auth','0007_alter_validators_add_error_messages','2019-03-22 09:03:37.211075'),(12,'auth','0008_alter_user_username_max_length','2019-03-22 09:03:43.127996'),(13,'sessions','0001_initial','2019-03-22 09:03:44.383479'),(14,'show','0001_initial','2019-03-22 09:04:52.864040'),(15,'show','0002_auto_20190322_1719','2019-03-22 09:20:48.767863'),(16,'show','0003_auto_20190322_1722','2019-03-22 09:22:56.292162'),(17,'show','0004_auto_20190322_1729','2019-03-22 09:29:34.924871'),(18,'show','0005_auto_20190323_1241','2019-03-25 05:47:44.735278'),(19,'show','0006_auto_20190323_1247','2019-03-25 05:47:52.300575'),(20,'show','0007_auto_20190325_1335','2019-03-25 05:48:04.871208'),(21,'show','0008_teacher_manager_class_id','2019-04-11 14:48:36.682227'),(22,'show','0009_student_img_a','2019-04-12 11:15:03.841851'),(23,'show','0010_auto_20190413_1809','2019-04-13 10:09:34.405776');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
INSERT INTO `django_session` VALUES ('8crlare1kl48dnmeero5jx69g73nzgt1','ZGU0OGNmYTAwMDlmOTgyOWMwODQ5NjFmODE0ZGY2OTU3Mzk4MzFkNjp7ImFjY291bnQiOiIwNjE2MTA4OSIsInVzZXJfaWQiOjMwLCJ1cmwiOiIvdGVhY2hlcl9wYWdlLyJ9','2019-04-09 00:20:28.212467'),('cialb3c8o54pnbfmgsf9nponuyrfv0mq','NWQ2NDU1MDQzNjlkYTdlOGU3OGViMTg1MTE0MDYwMDg5NzU5YzUxZjp7ImFjY291bnQiOiIwNjE2MTA4OSIsInVzZXJfaWQiOjMwLCJyb2xlIjoidCIsInVybCI6Ii90ZWFjaGVyX3BhZ2UvIn0=','2019-04-28 04:45:08.675944'),('cyeb3e0wdj87vfbylejp0zbyida4hcid','ZGI0MzkwNmQ3YjFjOWVhNTgwODQ0ZWYwNWNhMjIxYTlkNjQ3ZTBlYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNDU5NWU1MWNlYzUyOGEzYmQ2YmE1NGZlY2VmYjQ4OGE4YWEyOTY0IiwiYWNjb3VudCI6IjA2MTYxMDg5IiwidXNlcl9pZCI6MzAsIl9zZXNzaW9uX2V4cGlyeSI6MTAsInVybCI6Ii90ZWFjaGVyX3BhZ2UvIn0=','2019-03-25 08:20:44.792598'),('i8es5obxkdf7i001kqhdn7alb6ukkj1e','NjlmNzU2OTIzNGJjOTFmZjljY2Q2NjAxYzQ3ZWNjMTk0NzNlMGU0ZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNDU5NWU1MWNlYzUyOGEzYmQ2YmE1NGZlY2VmYjQ4OGE4YWEyOTY0IiwidXNlciI6MSwidXNlcl9pZCI6MzAsImFjY291bnQiOiIwNjE2MTA4OSIsInVybCI6Ii90ZWFjaGVyX3BhZ2UvIn0=','2019-04-08 06:10:07.769951'),('p20ojy3zc33k6azlhfkfpwpnx23b9ugp','NWQ2NDU1MDQzNjlkYTdlOGU3OGViMTg1MTE0MDYwMDg5NzU5YzUxZjp7ImFjY291bnQiOiIwNjE2MTA4OSIsInVzZXJfaWQiOjMwLCJyb2xlIjoidCIsInVybCI6Ii90ZWFjaGVyX3BhZ2UvIn0=','2019-04-28 04:04:27.624882'),('rtwecp5hcj34cfwfudimki3c8e4xxaww','ZGU0OGNmYTAwMDlmOTgyOWMwODQ5NjFmODE0ZGY2OTU3Mzk4MzFkNjp7ImFjY291bnQiOiIwNjE2MTA4OSIsInVzZXJfaWQiOjMwLCJ1cmwiOiIvdGVhY2hlcl9wYWdlLyJ9','2019-04-12 07:17:45.754801');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_account`
--

DROP TABLE IF EXISTS `show_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `show_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_account`
--

LOCK TABLES `show_account` WRITE;
/*!40000 ALTER TABLE `show_account` DISABLE KEYS */;
INSERT INTO `show_account` VALUES (1,'06161088','157634','2019-03-22 09:15:14.267721'),(3,'06161090','157634','2019-03-22 09:16:01.891363'),(6,'07171002','157634','2019-03-22 09:23:26.415826'),(7,'07171003','157634','2019-03-22 09:23:57.279394'),(10,'06161091','157634','2019-03-23 04:39:52.181223'),(11,'06161092','157634','2019-03-23 04:44:37.770043'),(30,'06161089','12345','2019-03-25 06:01:20.483453'),(37,'07171009','157634','2019-03-26 00:06:14.683729'),(38,'07171008','1234','2019-04-12 10:37:50.054535'),(39,'071710010','123','2019-04-12 10:38:11.846543');
/*!40000 ALTER TABLE `show_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_class`
--

DROP TABLE IF EXISTS `show_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `show_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `school_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `show_class_school_id_b8fbb0bc_fk_show_school_id` (`school_id`),
  CONSTRAINT `show_class_school_id_b8fbb0bc_fk_show_school_id` FOREIGN KEY (`school_id`) REFERENCES `show_school` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_class`
--

LOCK TABLES `show_class` WRITE;
/*!40000 ALTER TABLE `show_class` DISABLE KEYS */;
INSERT INTO `show_class` VALUES (1,'小1','2019-03-22 09:16:50.152802',1),(2,'小2','2019-03-22 09:17:06.163228',1),(3,'小3','2019-03-22 09:17:24.847861',1),(4,'小4','2019-03-22 09:17:36.310436',1);
/*!40000 ALTER TABLE `show_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_class_teacher`
--

DROP TABLE IF EXISTS `show_class_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `show_class_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `show_class_teacher_class_id_teacher_id_c5a9c0a9_uniq` (`class_id`,`teacher_id`),
  KEY `show_class_teacher_teacher_id_d577285c_fk_show_teacher_id` (`teacher_id`),
  CONSTRAINT `show_class_teacher_class_id_f58d1f13_fk_show_class_id` FOREIGN KEY (`class_id`) REFERENCES `show_class` (`id`),
  CONSTRAINT `show_class_teacher_teacher_id_d577285c_fk_show_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `show_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_class_teacher`
--

LOCK TABLES `show_class_teacher` WRITE;
/*!40000 ALTER TABLE `show_class_teacher` DISABLE KEYS */;
INSERT INTO `show_class_teacher` VALUES (1,1,1),(7,1,6),(3,2,1),(4,3,3),(6,4,6);
/*!40000 ALTER TABLE `show_class_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_homework`
--

DROP TABLE IF EXISTS `show_homework`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `show_homework` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `content` varchar(300) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `delay_time` datetime(6) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `show_homework_teacher_id_33457140` (`teacher_id`),
  CONSTRAINT `show_homework_teacher_id_33457140_fk_show_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `show_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_homework`
--

LOCK TABLES `show_homework` WRITE;
/*!40000 ALTER TABLE `show_homework` DISABLE KEYS */;
INSERT INTO `show_homework` VALUES (15,'数学','号好好号好好号好好号好好号好好号好好号好好号好好号好好号好好号好好号好好号好好号好好号好好号好好','2019-04-13 10:10:45.326455','2019-04-16 00:00:00.000000',6),(20,'python','hfghfghfgh','2019-04-13 10:32:19.254139','2019-04-16 00:00:00.000000',6),(21,'python','而二分','2019-04-13 14:55:18.510660','2019-04-14 00:00:00.000000',6);
/*!40000 ALTER TABLE `show_homework` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_homework_classes`
--

DROP TABLE IF EXISTS `show_homework_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `show_homework_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `homework_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `show_homework_classes_homework_id_class_id_057eac16_uniq` (`homework_id`,`class_id`),
  KEY `show_homework_classes_class_id_2fce5442_fk_show_class_id` (`class_id`),
  CONSTRAINT `show_homework_classes_class_id_2fce5442_fk_show_class_id` FOREIGN KEY (`class_id`) REFERENCES `show_class` (`id`),
  CONSTRAINT `show_homework_classes_homework_id_027e34fe_fk_show_homework_id` FOREIGN KEY (`homework_id`) REFERENCES `show_homework` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_homework_classes`
--

LOCK TABLES `show_homework_classes` WRITE;
/*!40000 ALTER TABLE `show_homework_classes` DISABLE KEYS */;
INSERT INTO `show_homework_classes` VALUES (16,15,4),(21,20,4),(22,21,4);
/*!40000 ALTER TABLE `show_homework_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_manager`
--

DROP TABLE IF EXISTS `show_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `show_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `show_manager_account_id_6b8a4cd5` (`account_id`),
  CONSTRAINT `show_manager_account_id_6b8a4cd5_fk_show_account_id` FOREIGN KEY (`account_id`) REFERENCES `show_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_manager`
--

LOCK TABLES `show_manager` WRITE;
/*!40000 ALTER TABLE `show_manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `show_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_manager_role`
--

DROP TABLE IF EXISTS `show_manager_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `show_manager_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manager_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `show_manager_role_manager_id_role_id_6fea8c1b_uniq` (`manager_id`,`role_id`),
  KEY `show_manager_role_role_id_faecbeb6_fk_show_role_id` (`role_id`),
  CONSTRAINT `show_manager_role_manager_id_f730d8c2_fk_show_manager_id` FOREIGN KEY (`manager_id`) REFERENCES `show_manager` (`id`),
  CONSTRAINT `show_manager_role_role_id_faecbeb6_fk_show_role_id` FOREIGN KEY (`role_id`) REFERENCES `show_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_manager_role`
--

LOCK TABLES `show_manager_role` WRITE;
/*!40000 ALTER TABLE `show_manager_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `show_manager_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_permission`
--

DROP TABLE IF EXISTS `show_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `show_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_permission`
--

LOCK TABLES `show_permission` WRITE;
/*!40000 ALTER TABLE `show_permission` DISABLE KEYS */;
INSERT INTO `show_permission` VALUES (1,'view','2019-03-22 09:12:31.889526'),(2,'delete','2019-03-22 09:12:43.306890'),(3,'change','2019-03-22 09:12:49.868777'),(4,'add','2019-03-22 09:13:02.962660'),(5,'view_detail','2019-03-23 09:56:33.768114');
/*!40000 ALTER TABLE `show_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_role`
--

DROP TABLE IF EXISTS `show_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `show_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_role`
--

LOCK TABLES `show_role` WRITE;
/*!40000 ALTER TABLE `show_role` DISABLE KEYS */;
INSERT INTO `show_role` VALUES (1,'普通老师','2019-03-22 09:13:36.130403'),(2,'学生','2019-03-22 09:13:45.196740'),(3,'管理员','2019-03-22 09:14:23.353560'),(4,'班主任','2019-03-23 04:37:00.726384');
/*!40000 ALTER TABLE `show_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_role_permission`
--

DROP TABLE IF EXISTS `show_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `show_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `show_role_permission_role_id_permission_id_487cfedf_uniq` (`role_id`,`permission_id`),
  KEY `show_role_permission_permission_id_d863e293_fk_show_perm` (`permission_id`),
  CONSTRAINT `show_role_permission_permission_id_d863e293_fk_show_perm` FOREIGN KEY (`permission_id`) REFERENCES `show_permission` (`id`),
  CONSTRAINT `show_role_permission_role_id_3732062c_fk_show_role_id` FOREIGN KEY (`role_id`) REFERENCES `show_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_role_permission`
--

LOCK TABLES `show_role_permission` WRITE;
/*!40000 ALTER TABLE `show_role_permission` DISABLE KEYS */;
INSERT INTO `show_role_permission` VALUES (1,1,1),(17,1,3),(5,2,1),(16,2,5),(6,3,1),(7,3,2),(8,3,3),(9,3,4),(15,3,5),(10,4,1),(11,4,2),(12,4,3),(13,4,4),(14,4,5);
/*!40000 ALTER TABLE `show_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_school`
--

DROP TABLE IF EXISTS `show_school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `show_school` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `classes` int(11) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_school`
--

LOCK TABLES `show_school` WRITE;
/*!40000 ALTER TABLE `show_school` DISABLE KEYS */;
INSERT INTO `show_school` VALUES (1,'河池小学',4,'2019-03-22 09:11:40.839286');
/*!40000 ALTER TABLE `show_school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_sign`
--

DROP TABLE IF EXISTS `show_sign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `show_sign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `height` varchar(5) NOT NULL,
  `weight` varchar(5) NOT NULL,
  `temperature` varchar(4) NOT NULL,
  `hand_img` varchar(100) NOT NULL,
  `mouth_img` varchar(100) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_sign`
--

LOCK TABLES `show_sign` WRITE;
/*!40000 ALTER TABLE `show_sign` DISABLE KEYS */;
INSERT INTO `show_sign` VALUES (5,'96','52','27','hand_img/QQ图片20171121230236_Hwm8xSW.png','mouth_img/C360_2018-10-18-17-18-36-521_8nQhGaH.jpg','2019-03-21 09:30:38.794121'),(6,'94','49','27.5','hand_img/QQ图片20171121230236_3lN2s8D.png','mouth_img/C360_2018-10-18-17-18-36-521_YrFgQDS.jpg','2019-03-22 09:31:16.171718');
/*!40000 ALTER TABLE `show_sign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_sign_student`
--

DROP TABLE IF EXISTS `show_sign_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `show_sign_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sign_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `show_sign_student_sign_id_student_id_f172479e_uniq` (`sign_id`,`student_id`),
  KEY `show_sign_student_student_id_01b5ff9d_fk_show_student_id` (`student_id`),
  CONSTRAINT `show_sign_student_sign_id_c47e342d_fk_show_sign_id` FOREIGN KEY (`sign_id`) REFERENCES `show_sign` (`id`),
  CONSTRAINT `show_sign_student_student_id_01b5ff9d_fk_show_student_id` FOREIGN KEY (`student_id`) REFERENCES `show_student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_sign_student`
--

LOCK TABLES `show_sign_student` WRITE;
/*!40000 ALTER TABLE `show_sign_student` DISABLE KEYS */;
INSERT INTO `show_sign_student` VALUES (8,5,23),(7,6,23);
/*!40000 ALTER TABLE `show_sign_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_student`
--

DROP TABLE IF EXISTS `show_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `show_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `account_id` int(11) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `classes_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `img_a` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `show_student_classes_id_dc3ecaff_fk_show_class_id` (`classes_id`),
  KEY `show_student_role_id_08ca2842` (`role_id`),
  KEY `show_student_account_id_f066269d` (`account_id`),
  CONSTRAINT `show_student_account_id_f066269d_fk_show_account_id` FOREIGN KEY (`account_id`) REFERENCES `show_account` (`id`),
  CONSTRAINT `show_student_classes_id_dc3ecaff_fk_show_class_id` FOREIGN KEY (`classes_id`) REFERENCES `show_class` (`id`),
  CONSTRAINT `show_student_role_id_08ca2842_fk_show_role_id` FOREIGN KEY (`role_id`) REFERENCES `show_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_student`
--

LOCK TABLES `show_student` WRITE;
/*!40000 ALTER TABLE `show_student` DISABLE KEYS */;
INSERT INTO `show_student` VALUES (22,'学1',37,'2019-03-26 00:06:14.913601',4,2,''),(23,'学2',38,'2019-04-12 10:37:50.241035',4,2,''),(24,'学3',39,'2019-04-12 10:38:11.997141',4,2,'');
/*!40000 ALTER TABLE `show_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_teacher`
--

DROP TABLE IF EXISTS `show_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `show_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `account_id` int(11) NOT NULL,
  `manager_class_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `show_teacher_account_id_4aff3f7e` (`account_id`),
  CONSTRAINT `show_teacher_account_id_4aff3f7e_fk_show_account_id` FOREIGN KEY (`account_id`) REFERENCES `show_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_teacher`
--

LOCK TABLES `show_teacher` WRITE;
/*!40000 ALTER TABLE `show_teacher` DISABLE KEYS */;
INSERT INTO `show_teacher` VALUES (1,'谈耿','2019-03-22 09:15:21.299855',1,1),(3,'李明','2019-03-22 09:16:05.712489',3,NULL),(4,'段文超','2019-03-23 04:39:55.769501',10,NULL),(5,'王二蛋','2019-03-23 04:43:53.027297',11,NULL),(6,'李龙飞','2019-03-25 05:55:53.222000',30,4);
/*!40000 ALTER TABLE `show_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `show_teacher_role`
--

DROP TABLE IF EXISTS `show_teacher_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `show_teacher_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `show_teacher_role_teacher_id_role_id_58193ca7_uniq` (`teacher_id`,`role_id`),
  KEY `show_teacher_role_role_id_5465b5ae_fk_show_role_id` (`role_id`),
  CONSTRAINT `show_teacher_role_role_id_5465b5ae_fk_show_role_id` FOREIGN KEY (`role_id`) REFERENCES `show_role` (`id`),
  CONSTRAINT `show_teacher_role_teacher_id_81f49319_fk_show_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `show_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `show_teacher_role`
--

LOCK TABLES `show_teacher_role` WRITE;
/*!40000 ALTER TABLE `show_teacher_role` DISABLE KEYS */;
INSERT INTO `show_teacher_role` VALUES (1,1,1),(3,3,1),(7,4,4),(8,5,1),(11,6,4);
/*!40000 ALTER TABLE `show_teacher_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-14 14:55:14
