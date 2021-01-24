-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: wlc
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Table structure for table `allergen`
--

DROP TABLE IF EXISTS `allergen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allergen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allergen`
--

LOCK TABLES `allergen` WRITE;
/*!40000 ALTER TABLE `allergen` DISABLE KEYS */;
INSERT INTO `allergen` VALUES (2,'gluten'),(3,'arachide');
/*!40000 ALTER TABLE `allergen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `day`
--

DROP TABLE IF EXISTS `day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `day`
--

LOCK TABLES `day` WRITE;
/*!40000 ALTER TABLE `day` DISABLE KEYS */;
/*!40000 ALTER TABLE `day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `day_has_ingredient`
--

DROP TABLE IF EXISTS `day_has_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `day_has_ingredient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ingredient_id` int(11) NOT NULL,
  `day_id` int(11) NOT NULL,
  `quantity` double(18,2) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dhi_ingredient_id_idx` (`ingredient_id`),
  KEY `fk_dhi_day_id_idx` (`day_id`),
  KEY `fk_dhi_unit_id_idx` (`unit_id`),
  CONSTRAINT `fk_dhi_day_id` FOREIGN KEY (`day_id`) REFERENCES `day` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_dhi_ingredient_id` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_dhi_unit_id` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `day_has_ingredient`
--

LOCK TABLES `day_has_ingredient` WRITE;
/*!40000 ALTER TABLE `day_has_ingredient` DISABLE KEYS */;
/*!40000 ALTER TABLE `day_has_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `carb` double(18,2) DEFAULT NULL,
  `fiber_included` double(18,2) DEFAULT NULL,
  `sugar` double(18,2) DEFAULT NULL,
  `protein` double(18,2) DEFAULT NULL,
  `fat` double(18,2) DEFAULT NULL,
  `saturated_fat` double(18,2) DEFAULT NULL,
  `fiber_excluded` double(18,2) DEFAULT NULL,
  `kcal` double(18,2) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `category_id` int(11) DEFAULT NULL,
  `quantity_for` double(18,2) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `comment` longtext,
  PRIMARY KEY (`id`),
  KEY `fk_ingredient_category_id_idx` (`category_id`),
  CONSTRAINT `fk_ingredient_category_id` FOREIGN KEY (`category_id`) REFERENCES `ingredient_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (29,'courgettes cru',1.80,1.05,1.79,1.23,0.26,NULL,NULL,16.50,'2020-12-20 18:44:10',3,100.00,16,NULL),(30,'patisson',3.80,1.20,2.40,1.20,0.20,NULL,NULL,18.00,'2020-12-20 18:44:10',3,100.00,16,NULL),(31,'feuilles de chênes',1.03,1.80,0.60,1.13,0.00,NULL,NULL,14.30,'2020-12-20 18:44:10',3,100.00,16,NULL),(32,'endives',2.83,1.10,2.40,1.19,0.00,NULL,NULL,20.20,'2020-12-20 18:44:10',3,100.00,16,NULL),(33,'chou rouge',4.33,2.80,3.90,1.13,0.00,NULL,NULL,30.00,'2020-12-20 18:44:10',3,100.00,16,NULL),(34,'poireaux',4.90,2.27,3.15,1.49,0.25,NULL,NULL,32.30,'2020-12-20 18:44:10',3,100.00,16,NULL),(35,'celeri rave',4.60,2.60,2.80,1.30,0.86,NULL,NULL,29.30,'2020-12-20 18:44:10',3,100.00,16,'PRIS CUIT'),(36,'navet',4.70,1.90,3.80,0.76,0.10,NULL,NULL,21.10,'2020-12-20 18:44:10',3,100.00,16,NULL),(37,'carotte cru',7.59,2.70,6.00,0.63,0.00,NULL,NULL,40.20,'2020-12-20 18:44:10',3,100.00,16,NULL),(38,'carotte cuite',2.60,2.80,1.30,0.55,0.10,NULL,NULL,18.90,'2020-12-20 18:44:10',3,100.00,16,NULL),(39,'branche de celeri',2.41,2.20,1.30,0.63,0.00,NULL,NULL,17.60,'2020-12-20 18:44:10',3,100.00,16,NULL),(40,'poivron vert',4.73,1.20,4.30,0.94,0.30,NULL,NULL,30.70,'2020-12-20 18:44:10',3,100.00,16,NULL),(41,'poivron rouge',7.00,2.20,6.00,1.40,0.00,NULL,NULL,36.60,'2020-12-20 18:44:10',3,100.00,16,'PRIS CUIT'),(42,'poivron jaune',5.33,2.20,4.90,1.00,0.60,NULL,NULL,35.80,'2020-12-20 18:44:10',3,100.00,16,'PRIS CUIT'),(43,'radis noir',5.52,1.20,4.30,0.94,0.00,NULL,NULL,29.20,'2020-12-20 18:44:10',3,100.00,16,NULL),(44,'radis',1.53,1.40,1.10,0.94,0.00,NULL,NULL,14.50,'2020-12-20 18:44:10',3,100.00,16,NULL),(45,'concombre',2.54,0.60,1.67,0.64,0.11,NULL,NULL,15.50,'2020-12-20 18:44:10',3,100.00,16,NULL),(46,'tomate',2.49,1.20,2.48,0.86,0.26,NULL,NULL,19.30,'2020-12-20 18:44:10',3,100.00,16,NULL),(47,'tomate cerise',5.62,1.20,4.80,1.31,0.00,NULL,NULL,33.70,'2020-12-20 18:44:10',3,100.00,16,NULL),(48,'aubergine',4.17,4.30,3.41,1.33,0.28,NULL,NULL,20.00,'2020-12-20 18:44:10',3,100.00,16,'PRIS CUIT'),(49,'avocat',0.83,3.60,0.40,1.56,20.60,NULL,NULL,205.00,'2020-12-20 18:44:10',3,100.00,16,NULL),(50,'brezain',1.60,NULL,0.50,24.00,28.00,NULL,NULL,354.00,'2020-12-20 18:44:10',7,100.00,16,NULL),(51,'creme frainche 30%',1.90,0.50,1.90,2.40,30.00,NULL,NULL,287.00,'2020-12-20 18:44:10',7,100.00,16,NULL),(52,'beurre demi-sel',0.60,NULL,NULL,0.80,80.00,NULL,NULL,726.00,'2020-12-20 18:44:10',7,100.00,16,NULL),(53,'huile d\'olive',0.00,0.00,0.00,0.00,100.00,NULL,NULL,900.00,'2020-12-20 18:44:10',5,100.00,16,NULL),(54,'huile de coco',0.00,0.00,0.00,0.00,100.00,NULL,NULL,900.00,'2020-12-20 18:44:10',5,100.00,16,NULL),(55,'œuf',0.27,0.00,0.27,12.70,9.83,NULL,NULL,140.00,'2020-12-20 18:44:10',4,100.00,16,NULL),(56,'huile d\'avocat',0.00,0.00,0.00,0.00,100.00,NULL,NULL,900.00,'2020-12-20 18:44:10',5,100.00,16,NULL),(57,'huile de sésame',0.00,0.00,0.00,0.00,100.00,NULL,NULL,900.00,'2020-12-20 18:44:10',5,100.00,16,NULL),(58,'sardines',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:10',4,100.00,16,NULL),(59,'maquereaux',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:10',4,100.00,16,NULL),(60,'escalope de dinde',0.51,0.00,0.32,24.10,1.22,NULL,NULL,109.00,'2020-12-20 18:44:10',4,100.00,16,NULL),(61,'Escalope de poulet',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:10',4,100.00,16,NULL),(62,'blanc de poulet',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:10',4,100.00,16,NULL),(63,'paupiette',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:10',4,100.00,16,NULL),(64,'hachis de porc veau',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:10',4,100.00,16,NULL),(65,'steck haché du boucher',0.00,0.00,0.00,20.00,10.10,NULL,NULL,1711.00,'2020-12-20 18:44:10',4,100.00,16,NULL),(66,'foie de bœuf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:10',4,100.00,16,NULL),(67,'grosse saucisse',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:10',4,100.00,16,NULL),(68,'chipolatas',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:10',4,100.00,16,NULL),(69,'merguez',NULL,0.00,NULL,14.60,33.30,NULL,NULL,NULL,'2020-12-20 18:44:10',4,100.00,16,NULL),(70,'chorizo',1.90,0.00,0.00,24.00,38.00,NULL,NULL,455.00,'2020-12-20 18:44:10',4,100.00,16,NULL),(71,'jambon blanc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:10',4,100.00,16,NULL),(72,'jambon fumé',0.20,NULL,NULL,24.00,14.00,NULL,NULL,226.00,'2020-12-20 18:44:10',4,100.00,16,NULL),(73,'coppa',0.50,NULL,0.00,8.20,6.80,NULL,NULL,95.00,'2020-12-20 18:44:10',4,100.00,16,NULL),(74,'saumon fumé',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:10',4,100.00,16,NULL),(75,'saumon frais',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:10',4,100.00,16,NULL),(76,'cabillaud',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:10',4,100.00,16,NULL),(77,'crevettes non cuite',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:10',4,100.00,16,NULL),(78,'couteaux',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:10',4,100.00,16,NULL),(79,'poudre d\'amande',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:10',6,100.00,16,NULL),(80,'noix de coco',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',6,100.00,16,NULL),(81,'mascarpone',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',7,100.00,16,NULL),(82,'gruyère',0.40,0.00,0.40,30.00,32.00,NULL,NULL,413.00,'2020-12-20 18:44:11',7,100.00,16,NULL),(83,'parmesan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',7,100.00,16,NULL),(84,'gouda au cumin',0.00,NULL,NULL,23.80,30.80,NULL,NULL,376.00,'2020-12-20 18:44:11',7,100.00,16,NULL),(85,'gouda aux truffes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',7,100.00,16,NULL),(86,'camembert',1.00,NULL,NULL,21.00,20.00,NULL,NULL,267.00,'2020-12-20 18:44:11',7,100.00,16,NULL),(87,'fromage frais',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',7,100.00,16,NULL),(88,'saint moret',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',7,100.00,16,NULL),(90,'bacon',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',4,100.00,16,NULL),(91,'champagne',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',8,100.00,16,NULL),(92,'caulier 28 Triple',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',8,100.00,16,NULL),(93,'brie de meaux',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',7,100.00,16,NULL),(94,'cacao van houten',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',6,100.00,16,NULL),(95,'erythridol',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',6,100.00,16,NULL),(96,'fruit des moine',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',6,100.00,16,NULL),(97,'stévia',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',6,100.00,16,NULL),(98,'bicarbonate de sodium',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',6,100.00,16,NULL),(99,'araignée de porc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',4,100.00,16,NULL),(100,'tournedos',0.40,0.00,0.00,22.50,2.50,NULL,NULL,114.00,'2020-12-20 18:44:11',4,100.00,16,NULL),(101,'lait d\'amandes sans sucre',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',7,100.00,16,NULL),(102,'potiron',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',3,100.00,16,NULL),(103,'butternut',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',3,100.00,16,NULL),(104,'potimarron',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',3,100.00,16,NULL),(105,'oignon',9.00,1.70,4.20,1.10,0.10,NULL,NULL,40.00,'2020-12-20 18:44:11',3,100.00,16,NULL),(106,'ail',18.60,NULL,NULL,5.31,0.00,NULL,NULL,110.00,'2020-12-20 18:44:11',3,100.00,16,NULL),(107,'paprika',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',5,100.00,16,NULL),(108,'cumin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',5,100.00,16,NULL),(109,'4 épices',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',5,100.00,16,NULL),(110,'muscade',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',5,100.00,16,NULL),(111,'sel',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',5,100.00,16,NULL),(112,'poivre',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',5,100.00,16,NULL),(113,'vin blanc sec',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',8,100.00,16,NULL),(114,'vin rouge',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',8,100.00,16,NULL),(115,'comté',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',7,100.00,16,NULL),(116,'noisettes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',9,100.00,16,NULL),(117,'amandes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',9,100.00,16,NULL),(118,'noix',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',9,100.00,16,NULL),(119,'champignons',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',3,100.00,16,NULL),(120,'chocolat noir 90 %',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',6,100.00,16,NULL),(121,'chocolat noir 80 %',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',6,100.00,16,NULL),(122,'Chocolat noir 85 %',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',6,100.00,16,NULL),(123,'haricots verts',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',3,100.00,16,NULL),(124,'protopasta',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',10,100.00,16,NULL),(125,'choux de bruxelles',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',3,100.00,16,NULL),(126,'gorgonzola',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',7,100.00,16,NULL),(127,'cote de porc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',4,100.00,16,NULL),(128,'tortillas atkins',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',10,100.00,16,NULL),(129,'concentré de tomates',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',5,100.00,16,NULL),(130,'pulpe de tomates',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',5,100.00,16,NULL),(131,'mozarella',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',7,100.00,16,NULL),(132,'cheddar galloway',0.00,NULL,NULL,25.40,34.90,NULL,NULL,416.00,'2020-12-20 18:44:11',7,100.00,16,NULL),(133,'buche de chèvre',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',7,100.00,16,NULL),(134,'chevre frais',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',7,100.00,16,NULL),(135,'pain Helles',0.90,NULL,NULL,43.10,4.10,NULL,NULL,227.00,'2020-12-20 18:44:11',10,100.00,16,NULL),(136,'pain Dunkel',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',10,100.00,16,NULL),(137,'pain',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',10,100.00,16,NULL),(138,'pain',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',10,100.00,16,NULL),(139,'pain',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',10,100.00,16,NULL),(140,'pate a pizza',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',10,100.00,16,NULL),(141,'fourme d\'ambert',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',7,100.00,16,NULL),(142,'extrait de vanille',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',6,100.00,16,NULL),(143,'levure chimique',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',6,100.00,16,NULL),(144,'farine intégral',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',5,100.00,16,NULL),(145,'farine semi-complete',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',5,100.00,16,NULL),(146,'farine de lupin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',5,100.00,16,NULL),(147,'farine de coco',18.10,NULL,18.10,19.00,17.90,NULL,NULL,385.00,'2020-12-20 18:44:11',5,100.00,16,NULL),(148,'gluten pur de blé',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',5,100.00,16,NULL),(149,'farine de lin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',5,100.00,16,NULL),(150,'poudre de noisettes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',9,100.00,16,NULL),(151,'maroilles',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',7,100.00,16,NULL),(152,'livarot',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',7,100.00,16,NULL),(153,'roquefort',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',7,100.00,16,NULL),(154,'expresso',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',10,100.00,16,NULL),(155,'romarin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',5,100.00,16,NULL),(156,'souris d\'agneau',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:11',4,100.00,16,NULL),(157,'graines de courges',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:12',9,100.00,16,NULL),(158,'graines de sésame',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:12',9,100.00,16,NULL),(159,'graines de tournesol',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:12',9,100.00,16,NULL),(160,'graine de chia',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:12',9,100.00,16,NULL),(161,'creme liquide 30%',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:44:12',7,100.00,16,NULL),(162,'curry',58.00,33.00,2.80,13.00,14.00,NULL,NULL,325.00,'2020-12-20 18:44:12',5,100.00,16,NULL),(163,'butternut (courge)',4.50,NULL,2.20,0.81,0.07,NULL,NULL,25.90,NULL,3,100.00,16,'cuit'),(164,'pulpe de tomate (MUTTI)',3.90,NULL,NULL,1.20,0.20,NULL,NULL,26.00,NULL,10,100.00,16,NULL),(165,'Epice pour chili',49.70,NULL,7.20,13.50,14.30,NULL,NULL,282.00,NULL,5,100.00,16,NULL),(166,'bouillon d\'os maison',0.00,NULL,NULL,2.00,5.00,NULL,NULL,53.00,NULL,5,100.00,16,'valeur yazio'),(167,'bouillon kub or',0.00,NULL,NULL,0.00,0.00,NULL,NULL,3.00,NULL,5,0.01,15,NULL),(168,'psyllium',8.80,NULL,0.10,1.40,0.00,NULL,NULL,203.00,NULL,5,100.00,16,NULL),(169,'eau',0.00,NULL,NULL,0.00,0.00,NULL,NULL,0.00,NULL,8,100.00,16,NULL),(170,'amande en poudre',5.70,NULL,5.60,24.00,53.00,NULL,NULL,619.00,NULL,6,100.00,16,'pris sur belbake - lidl'),(171,'blanc d\'oeuf',0.70,0.00,0.70,11.00,0.20,NULL,NULL,52.00,NULL,10,100.00,16,NULL);
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient_category`
--

DROP TABLE IF EXISTS `ingredient_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient_category`
--

LOCK TABLES `ingredient_category` WRITE;
/*!40000 ALTER TABLE `ingredient_category` DISABLE KEYS */;
INSERT INTO `ingredient_category` VALUES (3,'Légumes'),(4,'Viande'),(5,'Condiment'),(6,'Gateaux'),(7,'Crêmerie'),(8,'Boisson'),(9,'Graines'),(10,'Autre');
/*!40000 ALTER TABLE `ingredient_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient_has_allergen`
--

DROP TABLE IF EXISTS `ingredient_has_allergen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient_has_allergen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ingredient_id` int(11) NOT NULL,
  `allergen_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_iha_ingredient_id_idx` (`ingredient_id`),
  KEY `fk_iha_allergen_id_idx` (`allergen_id`),
  CONSTRAINT `fk_iha_allergen_id` FOREIGN KEY (`allergen_id`) REFERENCES `allergen` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_iha_ingredient_id` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient_has_allergen`
--

LOCK TABLES `ingredient_has_allergen` WRITE;
/*!40000 ALTER TABLE `ingredient_has_allergen` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingredient_has_allergen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opinion`
--

DROP TABLE IF EXISTS `opinion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opinion` (
  `id` int(11) NOT NULL,
  `rate` int(11) DEFAULT NULL,
  `comment` longtext,
  `receipe_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `receipe_opinion_id_idx` (`receipe_id`),
  CONSTRAINT `fk_receipe_opinion_id` FOREIGN KEY (`receipe_id`) REFERENCES `receipe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opinion`
--

LOCK TABLES `opinion` WRITE;
/*!40000 ALTER TABLE `opinion` DISABLE KEYS */;
/*!40000 ALTER TABLE `opinion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipe`
--

DROP TABLE IF EXISTS `receipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `preparation_time` int(11) DEFAULT NULL,
  `cooking_time` int(11) DEFAULT NULL,
  `carb` double(18,2) DEFAULT NULL,
  `protein` double(18,2) DEFAULT NULL,
  `fat` double(18,2) DEFAULT NULL,
  `fiber` double(18,2) DEFAULT NULL,
  `sugar` double(18,2) DEFAULT NULL,
  `preparation_step` longtext,
  `category_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_receipe_category_id_idx` (`category_id`),
  CONSTRAINT `fk_receipe_category_id` FOREIGN KEY (`category_id`) REFERENCES `receipe_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipe`
--

LOCK TABLES `receipe` WRITE;
/*!40000 ALTER TABLE `receipe` DISABLE KEYS */;
INSERT INTO `receipe` VALUES (4,'POULET PANE PISTACHE ET LEGUME ROTIS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:36',NULL),(5,'GRATIN DE PATES AU BŒUF CHEVRE ET COURGETTE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:36',NULL),(6,'GALETTES DE FLOCONS D AVOINE AU FROMAGE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:36',NULL),(7,'RISOTTO DE POULET PARMESAN ET TOMATE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:36',NULL),(8,'TOMATE FARCIE RAPIDE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:36',NULL),(9,'POULET TIKKA MASSALA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:36',NULL),(10,'CHOW MEIN VEGE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:36',NULL),(11,'NOUILLES AU GINGEMBRE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:36',NULL),(12,'PAELLA VEGETARIENNES AUX LEGUMES',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:36',NULL),(13,'BUTTERNUT FARCIE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:36',NULL),(14,'PIGEON CHASSEUR AU FOUR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:36',NULL),(15,'CRUMBLE DE RATATOUILLE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:36',NULL),(16,'SALADE COMPOSEE AUX LEGUMES CROQUANTS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:36',NULL),(17,'TARTIFLETTE AUX POIREAUX',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:36',NULL),(18,'CLAFOUTIAN AUX LEGUMES',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:36',NULL),(19,'OMELETTES AU MICRO ONDE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:36',NULL),(20,'POKE BOWL SAUMON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:36',NULL),(21,'RIZ SAUTE AUX CREVETTES ET CHORIZO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:36',NULL),(22,'MOULES MARINIERES',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:36',NULL),(23,'SPAGHETTI AUX TOMATES ET CHAMPIGNONS CREMEUX',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:36',NULL),(24,'BO BUN EXPRESS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:36',NULL),(25,'COURGETTES FARCIES A LA RICOTTA AUX PIGNONS DE PIN ET AU MIEL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:36',NULL),(26,'FRITTATA MEXICAINE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:36',NULL),(27,'PAELLA EXPRESS AU POULET ET CHORIZO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:36',NULL),(28,'CHILI DE COURGE',15,40,NULL,NULL,NULL,NULL,NULL,'<ul><li>Eplucher et couper la courge en dés,</li><li>Couper fin l\'oignon et l\'ail et le faire dorer dans l\'huile d\'olive,</li><li>Mettre dans la sauteuse les dés de courge et les faire revenir qq instants,</li><li>Ajouter le chili, du sel, du poivre, la pulpe de tomate, le bouillon,</li><li>Laisser mijoter environ 30 minutes à feu doux,</li><li>Mettre du cheddar râpé au moment de servir.&nbsp;</li></ul><div><br></div>',NULL,'2020-12-20 18:53:36',4),(29,'TARTE FINE A LA COURGETTE ET AU CHEVRE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:36',NULL),(30,'SALADE BOWL A LA GRECQUE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:36',NULL),(31,'WOK DE NOILES AUX LEGUMES',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:36',NULL),(32,'MOELLEUX COURGETTE CŒUR COULANT AU POIVRON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(33,'TATAKI DE BŒUF',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(34,'COLIN SAUCE CURRY',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(35,'CROQUE MONSIEUR DE LEGUMES',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(36,'CRUMBLE COMPLET',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(37,'QUICHE SANS PATE SAUMON COURGETTE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(38,'OMELETTE A LA RATATOUILLE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(39,'PARMENTIER DE SAUMON AUX POIREAUX',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(40,'CARIDE COURGE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(41,'POIREAUX AU JAMBON',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(42,'TOMATES FARCIES AUX CREVETTES',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(43,'SCONES AU BACON AU CHEDDAR ET A LA CIBOULETTE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(44,'chou\'f & cheese',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(45,'chili ceto copieux',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(46,'pates farine de lupin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(47,'crevettes sautés à l\'ail',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(48,'fish cake à la thaie',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(49,'courgettes farcies a la saucisse et feta',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(50,'riz de chou fleur',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(51,'foie de bœuf au poivron et courgette',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(52,'shakshuka',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(53,'lasagne de courgette',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(54,'poulet alfredo et pate aux courgettes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(55,'poulet tikka massala',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(56,'surf and turf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(57,'chili con carné keto',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(58,'queso fundido à la viande',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(59,'one pot riz tomates poulet',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(60,'caponata',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(61,'cari indien vege',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(62,'courge spaghetti',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(63,'toast apéro avocat crevett',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(64,'toast avocat et saumon',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(65,'toast avocat aoeu poché',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(66,'pesto poivron rouge',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(67,'tataki de thon',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(68,'aubergines farcies au bœuf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(69,'cuisse de poulet en croute de moutarde',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(70,'salade composée carottes radis noires mais et roquefort',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(71,'velouté de chou fleur au curry',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(72,'pain de thon a la tomate',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(73,'champignon farcis bacon et fromage',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(74,'gratin endives pommes et reblochon',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(75,'mille feuille de crabe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(76,'purée de céléri gourmande',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(77,'cheese cake au potiron',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-12-20 18:53:37',NULL),(78,'Tortilla',15,5,NULL,NULL,NULL,NULL,NULL,'<ul><li>Broyez l\'ensemble des ingrédients (sans l\'eau) dans un mixeur ( ou un moulin à café) pour obtenir une farine fine.</li><li>Placez dans un bol et ajoutez l\'eau bouillante.</li><li>Remuer jusqu\'à ce qu\'une pâte soit élastique.</li><li>Ouvrez entre 2 feuilles de papier sulfurisé, très fines</li><li>Enfourner dans une poêle antiadhésive avec un peu de beurre ou d\'huile d\'olive, très chaud, des deux côtés.</li></ul><div><br></div>',NULL,'2021-01-09 14:00:00',1),(79,'rectette test 1',60,60,NULL,NULL,NULL,NULL,NULL,'<div>test</div>',NULL,'2021-01-09 15:00:00',4),(80,'recette test 2',60,60,NULL,NULL,NULL,NULL,NULL,'<div>test</div>',NULL,'2021-01-09 16:29:58',4),(81,'recette test 3',60,60,NULL,NULL,NULL,NULL,NULL,'<div>test</div>',NULL,'2021-01-09 16:44:36',4),(82,'recette test 4',60,60,NULL,NULL,NULL,NULL,NULL,'<div>test</div>',NULL,'2021-01-09 16:49:33',4),(83,'recette test 5',60,60,NULL,NULL,NULL,NULL,NULL,'<div>test</div>',NULL,'2021-01-09 18:08:40',4),(84,'recette test 21',5,5,NULL,NULL,NULL,NULL,NULL,'<div>reerere<br><br><br><br>gghjgjgh</div>',NULL,'2021-01-09 18:45:36',5),(85,'Tortillas',5,20,NULL,NULL,NULL,NULL,NULL,'<div>&nbsp;- env. 8 tortillas<br><br>- Mettez les blancs d\'œufs, la farine de coco, le bicarbonate et l\'eau dans un bol<br>- mélanger (utiliser un batteur par exemple)<br>- ajouter éventuellement les épices (ail par exemple)<br>- faite chauffer une poêle et qd cette dernière est chaude mettre l\'huile d\'olive<br>- mettre la pate dans la poêle et laisser cuire, puis retourner et continuer la cuisson</div>',NULL,'2021-01-21 08:30:11',2),(87,'recette test 5',60,60,NULL,NULL,NULL,NULL,NULL,'<div>test</div>',NULL,'2021-01-21 11:18:34',2);
/*!40000 ALTER TABLE `receipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipe_category`
--

DROP TABLE IF EXISTS `receipe_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipe_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipe_category`
--

LOCK TABLES `receipe_category` WRITE;
/*!40000 ALTER TABLE `receipe_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `receipe_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receipe_has_ingredient`
--

DROP TABLE IF EXISTS `receipe_has_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receipe_has_ingredient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ingredient_id` int(11) NOT NULL,
  `receipe_id` int(11) NOT NULL,
  `quantity` double(18,2) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `receipe_id_idx` (`receipe_id`),
  KEY `unit_id_idx` (`unit_id`),
  KEY `fk_ingredient_id_idx` (`ingredient_id`),
  CONSTRAINT `fk_rhi_ingredient_id` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rhi_receipe_id` FOREIGN KEY (`receipe_id`) REFERENCES `receipe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rhi_unit_id` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receipe_has_ingredient`
--

LOCK TABLES `receipe_has_ingredient` WRITE;
/*!40000 ALTER TABLE `receipe_has_ingredient` DISABLE KEYS */;
INSERT INTO `receipe_has_ingredient` VALUES (7,164,28,300.00,16),(8,166,28,500.00,16),(9,132,28,180.00,16),(10,51,28,120.00,16),(11,43,79,5.00,16),(12,45,81,20.00,14),(13,42,83,20.00,16),(14,171,85,4.00,17),(15,147,85,20.00,16),(16,169,85,7.00,17),(17,98,85,0.15,16),(20,40,87,5.00,16),(21,44,87,8.00,17);
/*!40000 ALTER TABLE `receipe_has_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit`
--

DROP TABLE IF EXISTS `unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `shortcut` varchar(10) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `coeff` double(18,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unit_category_id_idx` (`category_id`),
  CONSTRAINT `fk_unit_category_id` FOREIGN KEY (`category_id`) REFERENCES `unit_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit`
--

LOCK TABLES `unit` WRITE;
/*!40000 ALTER TABLE `unit` DISABLE KEYS */;
INSERT INTO `unit` VALUES (14,'Kilogramme','Kg',5,1000.00),(15,'Litre','L',6,1000.00),(16,'Gramme','g',5,1.00),(17,'UNITE','U',7,NULL),(18,'Cuillère à soupe','CàS',7,NULL),(19,'Cuillère à café','CàC',7,NULL),(20,'Cuillère à thé','CaT',7,NULL);
/*!40000 ALTER TABLE `unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit_category`
--

DROP TABLE IF EXISTS `unit_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unit_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_category`
--

LOCK TABLES `unit_category` WRITE;
/*!40000 ALTER TABLE `unit_category` DISABLE KEYS */;
INSERT INTO `unit_category` VALUES (5,'Poids'),(6,'Volume'),(7,'Unité');
/*!40000 ALTER TABLE `unit_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'ludovic.legal80@gmail.com','{\"ROLE_ADMIN\"}','dFpwdHZJSWloTGZtLjY2Rw$h8OZKutwdYwRe1VKZ50rFxV2ufzdpMbrNdACKarTJM0');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-24 15:59:58
