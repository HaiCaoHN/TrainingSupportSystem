-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: schedule
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment` (
  `ass_id` int NOT NULL,
  `subject_id` int DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `ass_body` varchar(200) DEFAULT NULL,
  `eval_weight` double DEFAULT NULL,
  `is_team_work` tinyint DEFAULT NULL,
  `is_ongoing` tinyint DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  PRIMARY KEY (`ass_id`),
  KEY `subject_id_idx` (`subject_id`),
  CONSTRAINT `subjectid` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (1,2,'SE1632 Progress test 1','print n',20,0,0,1),(2,2,'SE 1632 Progress test 2','Print out n second prime numbers.',0.4,1,1,0),(3,7,'Final exam','-	Print out the successful development of prime numbers from small to large.',0.5,0,0,0),(4,6,'Present test',' Print out the screen all prime numbers of this array.',0.7,0,0,1),(5,7,'Test example','Count how many prime numbers there are in the above array, how many composite numbers?',0.6,0,0,1),(6,1,'pratice exam','Arranges this array in descending order that items are square numbers.',0.7,1,0,0),(7,2,'SE1632 Final exam','PRINT n',0.6,0,0,0),(9,9,'final exam','Count how many students that  their lastnames starting with the letter \"N\".',0.5,1,1,1),(10,1,'SE1361  Assingment','print out n prime number',0.6,1,1,1),(11,1,'SE1361  Final exam','- Count how many prime numbers there are in the above array, how many composite numbers?',0.5,1,0,1),(12,1,'SE1361 Progess test 1','Arranges this array in descending order that items are square numbers.',0.4,1,0,1),(13,2,'SE1632  Assingment','Count how many students that  their lastnames starting with the letter \"N\".',0.15,1,1,1),(14,2,'SE1632  progess test 3','We need to manage a football team, includes player and coach.',0.3,1,0,1),(15,1,'SE1361 Progress test 2','Build the class as the above requirement (using the inheritance).',0.9,1,1,1),(16,1,'SE1361 Progress test 3','Build an interface, named IManger to design some methods:',0.1,1,1,1);
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `class_id` int NOT NULL,
  `trainee_id` int NOT NULL,
  `schedule_id` int NOT NULL,
  `status` tinyint NOT NULL,
  `comment` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`class_id`,`trainee_id`,`schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,18,6,0,''),(1,18,7,0,''),(1,19,6,0,''),(1,19,7,0,''),(1,20,6,0,''),(1,20,7,0,''),(1,21,6,0,''),(1,21,7,0,''),(1,22,6,0,''),(1,22,7,1,''),(1,23,6,0,''),(1,23,7,1,''),(1,24,6,0,''),(1,24,7,1,''),(1,25,6,0,''),(1,25,7,1,'');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL,
  `category_name` varchar(45) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Email'),(2,'Mobile'),(3,'Both');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `class_id` int NOT NULL,
  `class_code` varchar(45) DEFAULT NULL,
  `supporter_id` int NOT NULL,
  `trainer_id` int NOT NULL,
  `term_id` int NOT NULL,
  `status` tinyint DEFAULT NULL,
  `description` text,
  `subject_id` int DEFAULT NULL,
  PRIMARY KEY (`class_id`),
  KEY `fk1_idx` (`subject_id`),
  KEY `fk2_idx` (`trainer_id`),
  KEY `fk3_idx` (`supporter_id`),
  KEY `fk4_idx` (`term_id`),
  CONSTRAINT `fk1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`),
  CONSTRAINT `fk2` FOREIGN KEY (`trainer_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `fk3` FOREIGN KEY (`supporter_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `fk4` FOREIGN KEY (`term_id`) REFERENCES `setting` (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,'SE1631-PRN301',3,6,51,1,'test',1),(2,'SE1632-PRJ221',27,28,51,1,NULL,2),(3,'SE1633-PRF192',3,6,51,1,'test',3),(4,'SE1637-CSI302',27,28,51,1,NULL,4);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_lesson`
--

DROP TABLE IF EXISTS `class_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_lesson` (
  `class_lesson_id` int NOT NULL,
  `lesson_id` int NOT NULL,
  `class_id` int NOT NULL,
  `slot_id` int NOT NULL,
  `subject_id` int DEFAULT NULL,
  PRIMARY KEY (`class_lesson_id`),
  KEY `lesson_id_idx` (`lesson_id`),
  KEY `slot_id_idx` (`slot_id`),
  CONSTRAINT `lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`lesson_id`),
  CONSTRAINT `slot_id` FOREIGN KEY (`slot_id`) REFERENCES `class_setting` (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_lesson`
--

LOCK TABLES `class_lesson` WRITE;
/*!40000 ALTER TABLE `class_lesson` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_setting`
--

DROP TABLE IF EXISTS `class_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_setting` (
  `setting_id` int NOT NULL,
  `type_id` int NOT NULL,
  `setting_title` varchar(45) DEFAULT NULL,
  `setting_value` varchar(45) DEFAULT NULL,
  `display_order` varchar(45) DEFAULT NULL,
  `class_id` int NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`setting_id`,`type_id`),
  KEY `type_id_idx` (`type_id`,`class_id`),
  KEY `class_id_index_1_idx` (`class_id`),
  CONSTRAINT `class_id_index_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`),
  CONSTRAINT `type_setting_id` FOREIGN KEY (`type_id`) REFERENCES `setting` (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_setting`
--

LOCK TABLES `class_setting` WRITE;
/*!40000 ALTER TABLE `class_setting` DISABLE KEYS */;
INSERT INTO `class_setting` VALUES (1,58,'Common','1','1',1,'1',''),(2,59,'Quality','3','2',1,'1',''),(3,59,'Common','4','1',2,'1',''),(4,58,'Quality','4','2',2,'1',''),(5,60,'Slot 1',NULL,'1',1,NULL,NULL),(6,60,'Slot 2',NULL,'2',1,NULL,NULL),(7,60,'Slot 3',NULL,'3',1,NULL,NULL),(8,60,'Slot 4',NULL,'4',1,NULL,NULL),(9,60,'Slot 5',NULL,'5',1,NULL,NULL),(10,60,'Slot 6',NULL,'6',1,NULL,NULL),(11,60,'Slot 7',NULL,'7',1,NULL,NULL);
/*!40000 ALTER TABLE `class_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_user`
--

DROP TABLE IF EXISTS `class_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_user` (
  `class_id` int NOT NULL,
  `user_id` int NOT NULL,
  `status` tinyint DEFAULT NULL,
  `note` varchar(45) DEFAULT NULL,
  `ongoing_eval` int DEFAULT NULL,
  `dropout_date` datetime DEFAULT NULL,
  `final_eval` int DEFAULT NULL,
  `topic_eval` int DEFAULT NULL,
  PRIMARY KEY (`class_id`,`user_id`),
  KEY `class_user_id2_idx` (`user_id`),
  CONSTRAINT `class_user_id1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`),
  CONSTRAINT `class_user_id2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_user`
--

LOCK TABLES `class_user` WRITE;
/*!40000 ALTER TABLE `class_user` DISABLE KEYS */;
INSERT INTO `class_user` VALUES (1,6,1,NULL,NULL,NULL,NULL,NULL),(1,18,1,NULL,NULL,NULL,NULL,NULL),(1,19,1,NULL,NULL,NULL,NULL,NULL),(1,20,1,NULL,NULL,NULL,NULL,NULL),(1,21,1,NULL,NULL,NULL,NULL,NULL),(1,22,1,NULL,NULL,NULL,NULL,NULL),(1,23,1,NULL,NULL,NULL,NULL,NULL),(1,24,1,NULL,NULL,NULL,NULL,NULL),(1,25,1,NULL,NULL,NULL,NULL,NULL),(2,6,1,NULL,NULL,NULL,NULL,NULL),(2,18,1,NULL,NULL,NULL,NULL,NULL),(2,19,1,NULL,NULL,NULL,NULL,NULL),(2,20,1,NULL,NULL,NULL,NULL,NULL),(2,21,1,NULL,NULL,NULL,NULL,NULL),(2,22,1,NULL,NULL,NULL,NULL,NULL),(2,23,1,NULL,NULL,NULL,NULL,NULL),(2,24,1,NULL,NULL,NULL,NULL,NULL),(3,18,1,NULL,NULL,NULL,NULL,NULL),(3,19,1,NULL,NULL,NULL,NULL,NULL),(3,20,1,NULL,NULL,NULL,NULL,NULL),(3,21,1,NULL,NULL,NULL,NULL,NULL),(3,22,1,NULL,NULL,NULL,NULL,NULL),(3,23,1,NULL,NULL,NULL,NULL,NULL),(3,24,1,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `class_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `client_id` int NOT NULL,
  `user_id` int NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `moblie` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `position` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`client_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eval_criteria`
--

DROP TABLE IF EXISTS `eval_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eval_criteria` (
  `criteria_id` int NOT NULL,
  `ass_id` int DEFAULT NULL,
  `milestone_id` int DEFAULT NULL,
  `criteria_name` varchar(45) DEFAULT NULL,
  `is_team_eval` tinyint DEFAULT NULL,
  `max_loc` int DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `eval_weight` int DEFAULT NULL,
  PRIMARY KEY (`criteria_id`),
  KEY `dfdfdf_idx` (`ass_id`),
  KEY `sdfdsfsdf_idx` (`milestone_id`),
  CONSTRAINT `dfdfdf` FOREIGN KEY (`ass_id`) REFERENCES `assignment` (`ass_id`),
  CONSTRAINT `sdfdsfsdf` FOREIGN KEY (`milestone_id`) REFERENCES `milestone` (`milestone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eval_criteria`
--

LOCK TABLES `eval_criteria` WRITE;
/*!40000 ALTER TABLE `eval_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `eval_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson`
--

DROP TABLE IF EXISTS `lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lesson` (
  `lesson_id` int NOT NULL,
  `author_id` int DEFAULT NULL,
  `video_url` text,
  `file_url` text,
  `body` text,
  `module_id` int NOT NULL,
  `subject_id` int DEFAULT NULL,
  PRIMARY KEY (`lesson_id`),
  KEY `author_id_idx` (`author_id`),
  KEY `module_id_idx` (`module_id`),
  CONSTRAINT `author_user_1` FOREIGN KEY (`author_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `setting_module_1` FOREIGN KEY (`module_id`) REFERENCES `subject_setting` (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson`
--

LOCK TABLES `lesson` WRITE;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;
/*!40000 ALTER TABLE `lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milestone`
--

DROP TABLE IF EXISTS `milestone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `milestone` (
  `milestone_id` int NOT NULL AUTO_INCREMENT,
  `ass_id` int NOT NULL,
  `class_id` int NOT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `tittle` varchar(45) DEFAULT NULL,
  `ass_body` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  PRIMARY KEY (`milestone_id`),
  KEY `milestone_ass_idx` (`ass_id`),
  CONSTRAINT `milestone_ass` FOREIGN KEY (`ass_id`) REFERENCES `assignment` (`ass_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestone`
--

LOCK TABLES `milestone` WRITE;
/*!40000 ALTER TABLE `milestone` DISABLE KEYS */;
INSERT INTO `milestone` VALUES (1,12,1,'2003-02-02','2003-06-05','SE1631 iteration1',NULL,NULL,0),(2,15,1,'2022-01-01','2022-01-02','SE1631 iteration 2',NULL,'nothing',1),(3,16,1,'2022-01-01','2022-01-02','SE1631 iteration 3',NULL,'nothing',1),(9,10,1,'2022-01-01','2022-01-01','SE1631 iteration 4',NULL,'nothing',1),(10,11,1,'2022-01-01','2022-01-01','SE1631 iteration 5',NULL,'nothing',1),(11,1,2,'2022-01-01','2022-01-01','123123',NULL,NULL,1),(12,2,2,'2022-01-01','2022-01-01','SE1632  iteration 2',NULL,'nothing',1),(13,14,2,'2022-01-01','2022-01-01','SE1632  iteration 3',NULL,'nothing',1),(15,7,2,'2022-01-01','2022-01-01','SE1632 iteration 5',NULL,NULL,NULL),(16,12,1,'2002-12-13','2002-12-12','test12312312312312312','Arranges this array in descending order that items are square numbers.',NULL,1),(25,12,1,'2002-12-13','2002-12-14','test2','Arranges this array in descending order that items are square numbers.',NULL,1),(26,12,1,'2002-12-13','2002-12-14','1111','Arranges this array in descending order that items are square numbers.',NULL,1),(27,12,1,'2002-12-13','2002-12-14','123123123','Arranges this array in descending order that items are square numbers.',NULL,0);
/*!40000 ALTER TABLE `milestone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package` (
  `package_id` int NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `description` text,
  `subject_id` int DEFAULT NULL,
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (10,'nothing','test',1),(111,'nothing','test',3);
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `screen_id` int NOT NULL,
  `role_id` int NOT NULL,
  `get_all_data` varchar(45) DEFAULT NULL,
  `can_delete` bit(1) DEFAULT NULL,
  `can_add` bit(1) DEFAULT NULL,
  `can_edit` bit(1) DEFAULT NULL,
  PRIMARY KEY (`screen_id`,`role_id`),
  KEY `role_setting_id_idx` (`role_id`),
  CONSTRAINT `role_setting_id` FOREIGN KEY (`role_id`) REFERENCES `setting` (`setting_id`),
  CONSTRAINT `screen_setting` FOREIGN KEY (`screen_id`) REFERENCES `setting` (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (17,11,'1',_binary '',_binary '',_binary ''),(17,12,'1',_binary '',_binary '',_binary ''),(17,13,'1',_binary '',_binary '',_binary ''),(17,14,'1',_binary '',_binary '',_binary ''),(17,15,'1',_binary '\0',_binary '\0',_binary '\0'),(17,16,'0',_binary '\0',_binary '\0',_binary '\0'),(18,11,'0',_binary '\0',_binary '\0',_binary '\0'),(18,12,'0',_binary '\0',_binary '\0',_binary '\0'),(18,13,'0',_binary '\0',_binary '\0',_binary '\0'),(18,14,'0',_binary '\0',_binary '\0',_binary '\0'),(18,15,'0',_binary '\0',_binary '\0',_binary '\0'),(18,16,'0',_binary '\0',_binary '\0',_binary '\0'),(19,11,'0',_binary '\0',_binary '\0',_binary '\0'),(19,12,'0',_binary '\0',_binary '\0',_binary '\0'),(19,13,'0',_binary '\0',_binary '\0',_binary '\0'),(19,14,'0',_binary '\0',_binary '\0',_binary '\0'),(19,15,'0',_binary '\0',_binary '\0',_binary '\0'),(19,16,'0',_binary '\0',_binary '\0',_binary '\0'),(20,11,'0',_binary '\0',_binary '\0',_binary '\0'),(20,12,'0',_binary '\0',_binary '\0',_binary '\0'),(20,13,'0',_binary '\0',_binary '\0',_binary '\0'),(20,14,'0',_binary '\0',_binary '\0',_binary '\0'),(20,15,'0',_binary '\0',_binary '\0',_binary '\0'),(20,16,'0',_binary '\0',_binary '\0',_binary '\0'),(21,11,'0',_binary '\0',_binary '\0',_binary '\0'),(21,12,'0',_binary '\0',_binary '\0',_binary '\0'),(21,13,'0',_binary '\0',_binary '\0',_binary '\0'),(21,14,'0',_binary '\0',_binary '\0',_binary '\0'),(21,15,'0',_binary '\0',_binary '\0',_binary '\0'),(21,16,'0',_binary '\0',_binary '\0',_binary '\0'),(22,11,'0',_binary '\0',_binary '\0',_binary '\0'),(22,12,'0',_binary '\0',_binary '\0',_binary '\0'),(22,13,'0',_binary '\0',_binary '\0',_binary '\0'),(22,14,'0',_binary '\0',_binary '\0',_binary '\0'),(22,15,'0',_binary '\0',_binary '\0',_binary '\0'),(22,16,'0',_binary '\0',_binary '\0',_binary '\0'),(23,11,'0',_binary '\0',_binary '\0',_binary '\0'),(23,12,'0',_binary '\0',_binary '\0',_binary '\0'),(23,13,'0',_binary '\0',_binary '\0',_binary '\0'),(23,14,'0',_binary '\0',_binary '\0',_binary '\0'),(23,15,'0',_binary '\0',_binary '\0',_binary '\0'),(23,16,'0',_binary '\0',_binary '\0',_binary '\0'),(24,11,'0',_binary '\0',_binary '\0',_binary '\0'),(24,12,'0',_binary '\0',_binary '\0',_binary '\0'),(24,13,'0',_binary '\0',_binary '\0',_binary '\0'),(24,14,'0',_binary '\0',_binary '\0',_binary '\0'),(24,15,'0',_binary '\0',_binary '\0',_binary '\0'),(24,16,'0',_binary '\0',_binary '\0',_binary '\0'),(25,11,'0',_binary '\0',_binary '\0',_binary '\0'),(25,12,'0',_binary '\0',_binary '\0',_binary '\0'),(25,13,'0',_binary '\0',_binary '\0',_binary '\0'),(25,14,'0',_binary '\0',_binary '\0',_binary '\0'),(25,15,'0',_binary '\0',_binary '\0',_binary '\0'),(25,16,'0',_binary '\0',_binary '\0',_binary '\0'),(26,11,'0',_binary '\0',_binary '\0',_binary '\0'),(26,12,'0',_binary '\0',_binary '\0',_binary '\0'),(26,13,'0',_binary '\0',_binary '\0',_binary '\0'),(26,14,'0',_binary '\0',_binary '\0',_binary '\0'),(26,15,'0',_binary '\0',_binary '\0',_binary '\0'),(26,16,'0',_binary '\0',_binary '\0',_binary '\0'),(27,11,'0',_binary '\0',_binary '\0',_binary '\0'),(27,12,'0',_binary '\0',_binary '\0',_binary '\0'),(27,13,'0',_binary '\0',_binary '\0',_binary '\0'),(27,14,'0',_binary '\0',_binary '\0',_binary '\0'),(27,15,'0',_binary '\0',_binary '\0',_binary '\0'),(27,16,'0',_binary '\0',_binary '\0',_binary '\0'),(28,11,'0',_binary '\0',_binary '\0',_binary '\0'),(28,12,'0',_binary '\0',_binary '\0',_binary '\0'),(28,13,'0',_binary '\0',_binary '\0',_binary '\0'),(28,14,'0',_binary '\0',_binary '\0',_binary '\0'),(28,15,'0',_binary '\0',_binary '\0',_binary '\0'),(28,16,'0',_binary '\0',_binary '\0',_binary '\0'),(29,11,'0',_binary '\0',_binary '\0',_binary '\0'),(29,12,'0',_binary '\0',_binary '\0',_binary '\0'),(29,13,'0',_binary '\0',_binary '\0',_binary '\0'),(29,14,'0',_binary '\0',_binary '\0',_binary '\0'),(29,15,'0',_binary '\0',_binary '\0',_binary '\0'),(29,16,'0',_binary '\0',_binary '\0',_binary '\0'),(30,11,'0',_binary '\0',_binary '\0',_binary '\0'),(30,12,'0',_binary '\0',_binary '\0',_binary '\0'),(30,13,'0',_binary '\0',_binary '\0',_binary '\0'),(30,14,'0',_binary '\0',_binary '\0',_binary '\0'),(30,15,'0',_binary '\0',_binary '\0',_binary '\0'),(30,16,'0',_binary '\0',_binary '\0',_binary '\0'),(31,11,'0',_binary '\0',_binary '\0',_binary '\0'),(31,12,'0',_binary '\0',_binary '\0',_binary '\0'),(31,13,'0',_binary '\0',_binary '\0',_binary '\0'),(31,14,'0',_binary '\0',_binary '\0',_binary '\0'),(31,15,'0',_binary '\0',_binary '\0',_binary '\0'),(31,16,'0',_binary '\0',_binary '\0',_binary '\0'),(32,11,'0',_binary '\0',_binary '\0',_binary '\0'),(32,12,'0',_binary '\0',_binary '\0',_binary '\0'),(32,13,'0',_binary '\0',_binary '\0',_binary '\0'),(32,14,'0',_binary '\0',_binary '\0',_binary '\0'),(32,15,'0',_binary '\0',_binary '\0',_binary '\0'),(32,16,'0',_binary '\0',_binary '\0',_binary '\0'),(33,11,'0',_binary '\0',_binary '\0',_binary '\0'),(33,12,'0',_binary '\0',_binary '\0',_binary '\0'),(33,13,'0',_binary '\0',_binary '\0',_binary '\0'),(33,14,'0',_binary '\0',_binary '\0',_binary '\0'),(33,15,'0',_binary '\0',_binary '\0',_binary '\0'),(33,16,'0',_binary '\0',_binary '\0',_binary '\0'),(34,11,'0',_binary '\0',_binary '\0',_binary '\0'),(34,12,'0',_binary '\0',_binary '\0',_binary '\0'),(34,13,'0',_binary '\0',_binary '\0',_binary '\0'),(34,14,'0',_binary '\0',_binary '\0',_binary '\0'),(34,15,'0',_binary '\0',_binary '\0',_binary '\0'),(34,16,'0',_binary '\0',_binary '\0',_binary '\0'),(35,11,'0',_binary '\0',_binary '\0',_binary '\0'),(35,12,'0',_binary '\0',_binary '\0',_binary '\0'),(35,13,'0',_binary '\0',_binary '\0',_binary '\0'),(35,14,'0',_binary '\0',_binary '\0',_binary '\0'),(35,15,'0',_binary '\0',_binary '\0',_binary '\0'),(35,16,'0',_binary '\0',_binary '\0',_binary '\0'),(36,11,'0',_binary '\0',_binary '\0',_binary '\0'),(36,12,'0',_binary '\0',_binary '\0',_binary '\0'),(36,13,'0',_binary '\0',_binary '\0',_binary '\0'),(36,14,'0',_binary '\0',_binary '\0',_binary '\0'),(36,15,'0',_binary '\0',_binary '\0',_binary '\0'),(36,16,'0',_binary '\0',_binary '\0',_binary '\0'),(37,11,'0',_binary '\0',_binary '\0',_binary '\0'),(37,12,'0',_binary '\0',_binary '\0',_binary '\0'),(37,13,'0',_binary '\0',_binary '\0',_binary '\0'),(37,14,'0',_binary '\0',_binary '\0',_binary '\0'),(37,15,'0',_binary '\0',_binary '\0',_binary '\0'),(37,16,'0',_binary '\0',_binary '\0',_binary '\0'),(38,11,'0',_binary '\0',_binary '\0',_binary '\0'),(38,12,'0',_binary '\0',_binary '\0',_binary '\0'),(38,13,'0',_binary '\0',_binary '\0',_binary '\0'),(38,14,'0',_binary '\0',_binary '\0',_binary '\0'),(38,15,'0',_binary '\0',_binary '\0',_binary '\0'),(38,16,'0',_binary '\0',_binary '\0',_binary '\0'),(39,11,'0',_binary '\0',_binary '\0',_binary '\0'),(39,12,'0',_binary '\0',_binary '\0',_binary '\0'),(39,13,'0',_binary '\0',_binary '\0',_binary '\0'),(39,14,'0',_binary '\0',_binary '\0',_binary '\0'),(39,15,'0',_binary '\0',_binary '\0',_binary '\0'),(39,16,'0',_binary '\0',_binary '\0',_binary '\0'),(40,11,'0',_binary '\0',_binary '\0',_binary '\0'),(40,12,'0',_binary '\0',_binary '\0',_binary '\0'),(40,13,'0',_binary '\0',_binary '\0',_binary '\0'),(40,14,'0',_binary '\0',_binary '\0',_binary '\0'),(40,15,'0',_binary '\0',_binary '\0',_binary '\0'),(40,16,'0',_binary '\0',_binary '\0',_binary '\0'),(41,11,'0',_binary '\0',_binary '\0',_binary '\0'),(41,12,'0',_binary '\0',_binary '\0',_binary '\0'),(41,13,'0',_binary '\0',_binary '\0',_binary '\0'),(41,14,'0',_binary '\0',_binary '\0',_binary '\0'),(41,15,'0',_binary '\0',_binary '\0',_binary '\0'),(41,16,'0',_binary '\0',_binary '\0',_binary '\0'),(42,11,'0',_binary '\0',_binary '\0',_binary '\0'),(42,12,'0',_binary '\0',_binary '\0',_binary '\0'),(42,13,'0',_binary '\0',_binary '\0',_binary '\0'),(42,14,'0',_binary '\0',_binary '\0',_binary '\0'),(42,15,'0',_binary '\0',_binary '\0',_binary '\0'),(42,16,'0',_binary '\0',_binary '\0',_binary '\0'),(43,11,'0',_binary '\0',_binary '\0',_binary '\0'),(43,12,'0',_binary '\0',_binary '\0',_binary '\0'),(43,13,'0',_binary '\0',_binary '\0',_binary '\0'),(43,14,'0',_binary '\0',_binary '\0',_binary '\0'),(43,15,'0',_binary '\0',_binary '\0',_binary '\0'),(43,16,'0',_binary '\0',_binary '\0',_binary '\0'),(44,11,'0',_binary '\0',_binary '\0',_binary '\0'),(44,12,'0',_binary '\0',_binary '\0',_binary '\0'),(44,13,'0',_binary '\0',_binary '\0',_binary '\0'),(44,14,'0',_binary '\0',_binary '\0',_binary '\0'),(44,15,'0',_binary '\0',_binary '\0',_binary '\0'),(44,16,'0',_binary '\0',_binary '\0',_binary '\0'),(45,11,'0',_binary '\0',_binary '\0',_binary '\0'),(45,12,'0',_binary '\0',_binary '\0',_binary '\0'),(45,13,'0',_binary '\0',_binary '\0',_binary '\0'),(45,14,'0',_binary '\0',_binary '\0',_binary '\0'),(45,15,'0',_binary '\0',_binary '\0',_binary '\0'),(45,16,'0',_binary '\0',_binary '\0',_binary '\0'),(46,11,'0',_binary '\0',_binary '\0',_binary '\0'),(46,12,'0',_binary '\0',_binary '\0',_binary '\0'),(46,13,'0',_binary '\0',_binary '\0',_binary '\0'),(46,14,'0',_binary '\0',_binary '\0',_binary '\0'),(46,15,'0',_binary '\0',_binary '\0',_binary '\0'),(46,16,'0',_binary '\0',_binary '\0',_binary '\0'),(47,11,'0',_binary '\0',_binary '\0',_binary '\0'),(47,12,'0',_binary '\0',_binary '\0',_binary '\0'),(47,13,'0',_binary '\0',_binary '\0',_binary '\0'),(47,14,'0',_binary '\0',_binary '\0',_binary '\0'),(47,15,'0',_binary '\0',_binary '\0',_binary '\0'),(47,16,'0',_binary '\0',_binary '\0',_binary '\0'),(48,11,'0',_binary '\0',_binary '\0',_binary '\0'),(48,12,'0',_binary '\0',_binary '\0',_binary '\0'),(48,13,'0',_binary '\0',_binary '\0',_binary '\0'),(48,14,'0',_binary '\0',_binary '\0',_binary '\0'),(48,15,'0',_binary '\0',_binary '\0',_binary '\0'),(48,16,'0',_binary '\0',_binary '\0',_binary '\0'),(61,11,'0',_binary '\0',_binary '\0',_binary '\0'),(61,12,'0',_binary '\0',_binary '\0',_binary '\0'),(61,13,'0',_binary '\0',_binary '\0',_binary '\0'),(61,14,'0',_binary '\0',_binary '\0',_binary '\0'),(61,15,'0',_binary '\0',_binary '\0',_binary '\0'),(61,16,'0',_binary '\0',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `room_id` int NOT NULL AUTO_INCREMENT,
  `room_name` varchar(45) NOT NULL,
  PRIMARY KEY (`room_id`,`room_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'A103'),(2,'B201'),(3,'C416'),(4,'A301'),(5,'D301');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `schedule_id` int NOT NULL AUTO_INCREMENT,
  `class_id` int DEFAULT NULL,
  `slot_id` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  `training_date` date DEFAULT NULL,
  `from_time` varchar(45) DEFAULT NULL,
  `to_time` varchar(45) DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `is_attend` tinyint DEFAULT NULL,
  `topic` varchar(45) DEFAULT NULL,
  `note` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `class_idx` (`class_id`),
  CONSTRAINT `class` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,1,5,55,'2023-03-12','12:50','14:20',0,0,NULL,NULL),(2,1,5,56,'2022-11-11','12:50','14:20',0,0,NULL,NULL),(3,1,5,57,'2022-11-28','12:50','14:20',0,0,NULL,NULL),(4,1,5,55,'2022-11-30','12:50','14:20',1,0,NULL,NULL),(5,1,5,56,'2022-11-09','12:50','14:20',1,0,NULL,NULL),(6,1,5,57,'2022-11-06','12:50','14:20',1,1,NULL,NULL),(7,1,5,55,'2022-11-08','12:50','14:20',1,1,NULL,NULL),(8,1,5,56,'2022-12-07','12:50','14:20',1,0,NULL,NULL),(9,2,6,57,'2022-11-13','14:30','16:00',1,0,NULL,NULL),(10,2,6,55,'2022-11-08','14:30','16:00',1,0,NULL,NULL),(11,2,6,56,'2022-11-16','14:30','16:00',1,0,NULL,NULL),(12,2,6,57,'2022-11-17','14:30','16:00',1,0,NULL,NULL),(13,4,6,55,'2022-11-19','14:30','16:00',1,0,NULL,NULL),(14,4,6,56,'2022-11-08','14:30','16:00',1,0,NULL,NULL),(15,4,6,57,'2022-11-21','14:30','16:00',1,0,NULL,NULL),(16,3,6,55,'2022-11-25','14:30','16:00',1,0,NULL,NULL),(17,2,6,56,'2022-11-27','14:30','16:00',1,0,NULL,NULL),(18,1,7,57,'2022-11-29','16:10','17:40',1,0,NULL,NULL),(19,2,7,55,'2022-11-28','16:10','17:40',1,0,NULL,NULL),(20,3,7,55,'2022-11-07','16:10','17:40',1,1,NULL,NULL),(21,3,7,55,'2002-12-13','16:10','17:40',1,0,NULL,NULL),(22,4,7,55,'2002-12-13','16:10','17:40',1,0,NULL,NULL),(23,3,7,55,'2002-12-13','16:10','17:40',1,0,NULL,NULL),(24,4,7,55,'2002-12-13','16:10','17:40',1,0,NULL,NULL),(25,3,7,55,'2002-12-13','00:12','14:13',1,0,NULL,NULL),(26,3,8,55,'2023-12-11','7:30','9:00',1,0,NULL,NULL),(27,4,8,55,'2022-12-13','7:30','9:00',1,0,NULL,NULL),(28,4,8,57,'2022-12-13','7:30','9:00',1,0,NULL,NULL),(29,3,8,55,'2023-12-13','7:30','9:00',1,0,NULL,NULL),(30,4,8,55,'2023-12-12','7:30','9:00',1,0,NULL,NULL),(31,3,8,55,'2023-12-12','7:30','9:00',1,0,NULL,NULL);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting` (
  `setting_id` int NOT NULL,
  `type_id` int DEFAULT NULL,
  `setting_title` varchar(45) DEFAULT NULL,
  `setting_value` varchar(45) DEFAULT NULL,
  `display_order` varchar(45) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`setting_id`),
  KEY `type_id_setting_idx` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES (1,NULL,'Role',NULL,'1','1',NULL),(2,NULL,'Web Contact Category',NULL,'2','1',NULL),(3,NULL,'Class Setting Type',NULL,'3','1',NULL),(4,NULL,'Subject Setting Type',NULL,'4','1',NULL),(5,NULL,'System Screen',NULL,'5','1',NULL),(6,NULL,'Term',NULL,'6','1',NULL),(7,NULL,'Room',NULL,NULL,NULL,NULL),(9,NULL,'Class Setting Type',NULL,'9','1',NULL),(11,1,'Administrator',NULL,'1','1',NULL),(12,1,'Manager',NULL,'2','1',NULL),(13,1,'Supporter',NULL,'3','1',NULL),(14,1,'Trainer',NULL,'4','1',NULL),(15,1,'Trainee',NULL,'5','1',NULL),(16,1,'Guest',NULL,'6','1',NULL),(17,5,'HomePage',NULL,'1','1',NULL),(18,5,'Dashboard',NULL,'2','1',NULL),(19,5,'User Profile',NULL,'3','1',NULL),(20,5,'Setting List',NULL,'4','1',NULL),(21,5,'Setting Detail',NULL,'5','1',NULL),(22,5,'User List',NULL,'6','1',NULL),(23,5,'User Detail',NULL,'7','1',NULL),(24,5,'Add User',NULL,'8','1',NULL),(25,5,'Subject List',NULL,'9','1',NULL),(26,5,'Subject Detail',NULL,'10','1',NULL),(27,5,'Add Subject',NULL,'11','1',NULL),(28,5,'Web Contact List',NULL,'12','1',NULL),(29,5,'Web Contact Detail',NULL,'13','1',NULL),(30,5,'System Permission',NULL,'14','1',NULL),(31,5,'Subject Setting List',NULL,'15','1',NULL),(32,5,'Subject Setting Detail',NULL,'16','1',NULL),(33,5,'Add Subject Setting',NULL,'17','1',NULL),(34,5,'Assignment List',NULL,'18','1',NULL),(35,5,'Assignment Detail',NULL,'19','1',NULL),(36,5,'Add Assignment',NULL,'20','1',NULL),(37,5,'Eval Criteria List',NULL,'21','1',NULL),(38,5,'Eval Criteria Detail',NULL,'22','1',NULL),(39,5,'Add Eval Criteria ',NULL,'23','1',NULL),(40,5,'Class List',NULL,'24','1',NULL),(41,5,'Class Detail',NULL,'25','1',NULL),(42,5,'Add Class',NULL,'26','1',NULL),(43,5,'Class Setting List',NULL,'27','1',NULL),(44,5,'Class Setting Detail',NULL,'28','1',NULL),(45,5,'Add Class Setting',NULL,'29','1',NULL),(46,5,'Milestone List',NULL,'30','1',NULL),(47,5,'Milestone Detail',NULL,'31','1',NULL),(48,5,'Add Milestone',NULL,'32','1',NULL),(49,4,'Subject Complexity',NULL,'1','1',NULL),(50,4,'Subject Quality',NULL,'2','1',NULL),(51,6,'Summer',NULL,NULL,NULL,NULL),(52,6,'Fall',NULL,NULL,NULL,NULL),(53,6,'Winter',NULL,NULL,NULL,NULL),(54,3,'Slot',NULL,NULL,NULL,NULL),(55,7,'A101',NULL,NULL,NULL,NULL),(56,7,'B102',NULL,NULL,NULL,NULL),(57,7,'C301',NULL,NULL,NULL,NULL),(58,9,'Common CLass',NULL,'1','1',NULL),(59,9,'Class Quaility',NULL,'1','1',NULL),(60,9,'Class Slot',NULL,'1','1',NULL),(61,5,'MileStone',NULL,'50','1',NULL);
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `subject_id` int NOT NULL AUTO_INCREMENT,
  `subject_code` varchar(45) NOT NULL,
  `subject_name` varchar(45) DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  `expert_id` int DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `body` text,
  `img_url` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`subject_id`),
  KEY `manager_user_id_idx` (`manager_id`),
  KEY `expert_user_id_idx` (`expert_id`),
  CONSTRAINT `expert_user_id` FOREIGN KEY (`expert_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `manager_user_id` FOREIGN KEY (`manager_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'PRN301','C# Language',2,6,'1','C# ','c-logo-icon-18.png'),(2,'PRJ221','Java Web',2,3,'1',NULL,'java.png'),(3,'PRF192','C Language',14,6,'1',NULL,'c.png'),(4,'CSI302','Computer Sience',2,3,'1',NULL,'computer science.png'),(5,'MAD112','Discrete Mathematics',14,6,'1',NULL,'mad.png'),(6,'MAS191','Statistics & Probability Math',14,2,'1',NULL,'mas.jpg'),(7,'MAE301','Mathematics for Engineering',2,6,'0',NULL,'math.png'),(8,'MAI311','Mathematics for Machine Learning',9,6,'1',NULL,'mai.jpg'),(9,'CSD222','Data Structures and Algorithms',2,3,'1',NULL,'csd.png'),(10,'CEA201','Computer Organization and Architecture',2,6,'1',NULL,'cea.png'),(11,'SWR302','Software Requirement',9,6,'0',NULL,'swr.png'),(12,'SWT155','Software Testing',2,6,'1',NULL,'swt.jpg'),(13,'DEMO123','Demo',9,6,'1','Demo','champions_league.jpg'),(14,'DEMO2','Domo2',9,8,'1','demo 2','champions_league.jpg');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_setting`
--

DROP TABLE IF EXISTS `subject_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_setting` (
  `setting_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `type_id` int DEFAULT NULL,
  `setting_title` varchar(45) DEFAULT NULL,
  `setting_value` varchar(45) DEFAULT NULL,
  `display_order` varchar(45) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`setting_id`,`subject_id`),
  KEY `subject_fk_idx` (`subject_id`),
  KEY `subject_setting_idx` (`type_id`),
  CONSTRAINT `subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`),
  CONSTRAINT `subject_setting` FOREIGN KEY (`type_id`) REFERENCES `setting` (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_setting`
--

LOCK TABLES `subject_setting` WRITE;
/*!40000 ALTER TABLE `subject_setting` DISABLE KEYS */;
INSERT INTO `subject_setting` VALUES (1,1,49,'Complexity','demo','3','1','complex of c# language'),(2,1,50,'Quality','5','2','1',''),(3,2,49,'Complexity','6','1','1',''),(4,2,50,'Quality','4','2','1',NULL),(5,3,49,'Complexity','3','1','1',NULL),(6,3,50,'Quality','4','2','1',NULL),(7,4,49,'Complexity','4','1','1',NULL),(8,4,50,'Quality','4','2','1',NULL),(9,5,49,'Complexity','5','1','1',NULL),(10,5,50,'Quality','5','2','1',NULL),(11,6,50,'Quality','5','1','1',NULL),(12,6,49,'Complexity','3','2','1',NULL),(13,7,49,'Complexity','4','1','1',NULL),(14,7,50,'Quality','4','2','1',NULL),(15,8,49,'Complexity','4','1','1',NULL),(16,8,50,'Quality','3','2','1',NULL),(17,9,49,'Complexity','3','1','1',NULL),(18,9,50,'Quality','4','2','1',NULL),(19,10,49,'Comlexity','3','1','1',NULL),(20,10,50,'Quality','4','2','1',NULL),(21,11,49,'Complexity','5','1','1',NULL),(22,11,50,'Quality','5','2','1',NULL),(23,12,50,'demo','ff','4','0',''),(24,12,49,'1demo','5','6','0','');
/*!40000 ALTER TABLE `subject_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submit`
--

DROP TABLE IF EXISTS `submit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submit` (
  `submit_id` int NOT NULL,
  `milestone_⁯id` int DEFAULT NULL,
  `class_id` int DEFAULT NULL,
  `team_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `submit_file_url` varchar(45) DEFAULT NULL,
  `submit_time` varchar(45) DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  PRIMARY KEY (`submit_id`),
  KEY `fdfdfdf_idx` (`milestone_⁯id`),
  KEY `dff_idx` (`user_id`),
  KEY `dsffsf_idx` (`class_id`),
  KEY `sawsdf_idx` (`team_id`),
  CONSTRAINT `dff` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `dsffsf` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`),
  CONSTRAINT `fdfdfdf` FOREIGN KEY (`milestone_⁯id`) REFERENCES `milestone` (`milestone_id`),
  CONSTRAINT `sawsdf` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submit`
--

LOCK TABLES `submit` WRITE;
/*!40000 ALTER TABLE `submit` DISABLE KEYS */;
INSERT INTO `submit` VALUES (1,1,1,1,NULL,NULL,NULL,NULL),(2,1,1,2,NULL,NULL,NULL,NULL),(3,1,1,3,NULL,NULL,NULL,NULL),(4,2,1,1,NULL,NULL,NULL,NULL),(5,2,1,2,NULL,NULL,NULL,NULL),(6,2,1,3,NULL,NULL,NULL,NULL),(7,9,1,4,NULL,NULL,NULL,NULL),(8,9,1,5,NULL,NULL,NULL,NULL),(9,9,1,6,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `submit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team` (
  `team_id` int NOT NULL,
  `class_id` int DEFAULT NULL,
  `team_code` varchar(45) DEFAULT NULL,
  `topic_name` varchar(45) DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `description` text,
  `teamcol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`team_id`),
  KEY `sadas_idx` (`class_id`),
  CONSTRAINT `sadas` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,1,'G1','test',1,'test',NULL),(2,1,'G2','test',1,'test',NULL),(3,1,'G3','test',1,'test',NULL),(4,1,'G1','test',1,'test',NULL),(5,1,'G2','test',1,'test',NULL),(6,1,'G3','test',1,'test',NULL);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_member`
--

DROP TABLE IF EXISTS `team_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_member` (
  `team_id` int NOT NULL,
  `user_id` int NOT NULL,
  `is_leader` tinyint DEFAULT NULL,
  `is_active` tinyint DEFAULT NULL,
  PRIMARY KEY (`team_id`,`user_id`),
  KEY `sdsdsd_idx` (`user_id`),
  CONSTRAINT `fdsfdfs` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`),
  CONSTRAINT `sdsdsd` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_member`
--

LOCK TABLES `team_member` WRITE;
/*!40000 ALTER TABLE `team_member` DISABLE KEYS */;
INSERT INTO `team_member` VALUES (1,6,0,1),(1,20,0,1),(1,22,1,1),(2,18,0,1),(2,23,0,1),(2,25,1,1),(3,19,1,1),(3,21,0,1),(3,24,0,1),(4,6,1,1),(4,18,0,1),(4,19,0,1),(5,20,1,1),(5,21,0,1),(5,22,0,1),(6,23,1,1),(6,24,0,1),(6,25,0,1);
/*!40000 ALTER TABLE `team_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timeslot`
--

DROP TABLE IF EXISTS `timeslot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timeslot` (
  `slot_id` int NOT NULL AUTO_INCREMENT,
  `slot_name` varchar(45) DEFAULT NULL,
  `time_start` varchar(45) DEFAULT NULL,
  `time_end` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`slot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timeslot`
--

LOCK TABLES `timeslot` WRITE;
/*!40000 ALTER TABLE `timeslot` DISABLE KEYS */;
INSERT INTO `timeslot` VALUES (1,'Slot 1','07:30','09:00'),(2,'Slot 2','09:10','10:40'),(3,'Slot 3','10:50','12:20'),(4,'Slot 4','12:50','14:20'),(5,'Slot 5','14:30','14:30'),(6,'Slot 6','16:10','17:40');
/*!40000 ALTER TABLE `timeslot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL,
  `full_name` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `avatar_url` varchar(45) DEFAULT NULL,
  `status` tinyint NOT NULL,
  `note` varchar(45) DEFAULT NULL,
  `position` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `company` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Administrator','admin@gmail.com','','admin',NULL,1,'','','','',NULL),(2,'Manager','manager@gmail.com','0123456711','1234',NULL,1,'huy',NULL,NULL,NULL,'manager'),(3,'Supporter','supporter@gmail.com','09135219618','1234',NULL,1,'sick',NULL,NULL,NULL,'supporter'),(4,'Trainer','trainer@gmail.com','0541268745','1234',NULL,1,'ok',NULL,NULL,NULL,'trainer'),(5,'Trainee','trainee@gmail.com','0','1234',NULL,1,'0','0','0','0','trainee'),(6,'Trung Thanh','thanhkcr@gmail.com','0913999999','123','champions_league.jpg',1,'0','0','0','0','thanhkcr'),(7,'Guest','guest@gmail.com','0913889923','1234',NULL,1,'0','0','0','0','guest'),(8,'Nguyen Thanh','jafewe9829@edxplus.com','0944444444','UfaKMV',NULL,0,'0','0','0','0','jafewe9829'),(9,'Nguyen Thanh','direli2265@bongcs.com','0','KVDpac',NULL,1,'0','0','0','0','minh1'),(10,'hoang minh','minh0101@gmail.com','012345678','123456',NULL,1,NULL,NULL,NULL,NULL,'hoangminh'),(11,'hoang minh1','minh010111@gmail.com','0913456781','123456',NULL,1,'',NULL,NULL,NULL,'ducminh'),(12,'hoang minh12','minh01011@gmail.com','0123456781','123456',NULL,0,NULL,NULL,NULL,NULL,'caky'),(13,'Huynh Thien Di','licake4330@lutota.com','0','uk4MV8',NULL,1,'0','0','0','0','licake'),(14,'Nguyen Dinh Thanh','123@gmai.com','0312345678','123456',NULL,1,'day la tét','fresher','Bac Ninh','fsoft','123'),(15,'vu quang huy','tabosek367@canyona.com','0','jusbpg',NULL,1,'0','0','0','0','tabosel'),(16,'thanh','kodoli3322@civikli.com','0','123',NULL,1,'0','0','0','0','kodoli'),(17,'Nguyen Duc Trung Thanh','thanh@gmail.com','0978583137','1',NULL,1,NULL,NULL,NULL,NULL,'thanh'),(18,'Thanh Nguyen','thanh2@gmail.com','0954335435','1',NULL,1,NULL,NULL,NULL,NULL,'lyduc'),(19,'Kien','thanh3@gmail.com','0435435435','1',NULL,1,NULL,NULL,NULL,NULL,'bosoki'),(20,'huy','thanh4@gmail.com','0435435435','1',NULL,1,NULL,NULL,NULL,NULL,'duchuy'),(21,'thanh','thanh5@gmail.com','024324324','1',NULL,1,NULL,NULL,NULL,NULL,'nanvan'),(22,'tho','thanh6@gmail.com','023432423','1',NULL,1,NULL,NULL,NULL,NULL,'gaben'),(23,'thien','thanh7@gmail.com','043543543','1',NULL,1,NULL,NULL,NULL,NULL,'soto'),(24,'hoang','thanh8@gmail.com','043555543','1',NULL,1,NULL,NULL,NULL,NULL,'melee'),(25,'duyen','thanh9@gmail.com','03454355','1',NULL,1,NULL,NULL,NULL,NULL,'gala'),(26,'huy','huy@gmail.com','098123123','123456',NULL,1,NULL,NULL,NULL,NULL,'huy'),(27,'Hoang','hoang@gmail.com','0','1234',NULL,1,NULL,NULL,NULL,NULL,'hoang'),(28,'Nam','nam@gmail.com','0','1234',NULL,1,NULL,NULL,NULL,NULL,'nam'),(29,'Thuan','thuan@gmail.com','1','1234',NULL,1,NULL,NULL,NULL,NULL,'thuan');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  `is_leader` tinyint DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_setting_idx` (`role_id`),
  CONSTRAINT `role_setting` FOREIGN KEY (`role_id`) REFERENCES `setting` (`setting_id`),
  CONSTRAINT `user_role_indexx` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,11,NULL),(2,12,NULL),(3,13,NULL),(4,14,NULL),(5,15,NULL),(6,14,NULL),(7,16,NULL),(8,14,NULL),(9,12,NULL),(10,14,NULL),(11,12,NULL),(12,14,NULL),(13,13,NULL),(14,12,NULL),(15,15,NULL),(16,15,NULL),(17,15,NULL),(18,15,NULL),(19,15,NULL),(20,15,NULL),(21,15,NULL),(22,15,NULL),(23,15,NULL),(24,15,NULL),(25,15,NULL),(26,15,NULL),(27,13,NULL),(28,14,NULL);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_contact`
--

DROP TABLE IF EXISTS `web_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `web_contact` (
  `contact_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `supporter_id` int NOT NULL,
  `fullname` varchar(45) DEFAULT NULL,
  `emai` varchar(45) DEFAULT NULL,
  `moblie` varchar(45) DEFAULT NULL,
  `message` text,
  `response` varchar(45) DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `dateSend` date DEFAULT NULL,
  `dateResponse` date DEFAULT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_contact`
--

LOCK TABLES `web_contact` WRITE;
/*!40000 ALTER TABLE `web_contact` DISABLE KEYS */;
INSERT INTO `web_contact` VALUES (1,1,1,'Huy ','12@gmail.com','092131231',NULL,'hellocvbnmnb',NULL,NULL,NULL),(10,1,1,'Quang','labidet305@pahed.com','01235654654','1','Yeu cau ho tro da hoan thanh',NULL,NULL,NULL),(12,1,2,'Quang','kajoxan751@pahed.com','0912323','2','',NULL,NULL,NULL),(15,1,3,'Cao Thanh Hai','dibeco5296@ploneix.com','','3','ok\n\n',NULL,NULL,NULL),(27,2,4,'Vu Huy','haidb@gmail.com','0326065916','4','',NULL,NULL,NULL),(28,3,1,'Hai Van Cao','towid93087@orlydns.com','0912323','5','Ok da fix',NULL,NULL,NULL),(29,1,5,'Van Hau','divace7448@bongcs.com','01278422314','6','',NULL,NULL,NULL),(30,2,6,'Hoang Hai','rediy36120@edxplus.com','0912323','7','',NULL,NULL,NULL),(31,2,7,'Hoang Hai','rediy36120@edxplus.com','0326065916','8','',NULL,NULL,NULL);
/*!40000 ALTER TABLE `web_contact` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-14 17:15:15
