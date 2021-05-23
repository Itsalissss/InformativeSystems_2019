CREATE DATABASE  IF NOT EXISTS `Fundraiser_Teamtrees` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Fundraiser_Teamtrees`;
-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: localhost    Database: Fundraiser_Teamtrees
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `albero`
--

DROP TABLE IF EXISTS `albero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albero` (
  `id` int(11) NOT NULL,
  `iddonazione` int(11) NOT NULL,
  `emailpiantatore` varchar(45) NOT NULL,
  `idforesta` int(11) NOT NULL,
  `nomespecie` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `di_idx` (`iddonazione`),
  KEY `pianta_idx` (`emailpiantatore`),
  KEY `inquale_idx` (`idforesta`),
  KEY `appartiene_idx` (`nomespecie`),
  CONSTRAINT `appartiene` FOREIGN KEY (`nomespecie`) REFERENCES `speciealbero` (`nome`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `di` FOREIGN KEY (`iddonazione`) REFERENCES `donazione` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `inquale` FOREIGN KEY (`idforesta`) REFERENCES `foresta` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `pianta` FOREIGN KEY (`emailpiantatore`) REFERENCES `persona` (`email`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albero`
--

LOCK TABLES `albero` WRITE;
/*!40000 ALTER TABLE `albero` DISABLE KEYS */;
INSERT INTO `albero` VALUES (1,1,'helga.hickle@hotmail.com',4,'thuja plicata'),(2,1,'helga.hickle@hotmail.com',4,'picea sitchensis'),(3,1,'helga.hickle@hotmail.com',4,'thuja plicata'),(4,2,'bonitawilliams@dayrep.com',4,'thuja plicata'),(5,3,'bonitawilliams@dayrep.com',4,'tsuga heterophylla'),(6,2,'gabriellygoncalveslima@jourrapide.com',2,'araucaria angustifolia'),(7,3,'randalleg@hotmail.com',2,'caesalpinia echinata'),(8,6,'leilagomesbarros@armyspy.com',2,'orchidaceae'),(9,4,'gabriellygoncalveslima@jourrapide.com',1,'araucaria angustifolia'),(10,5,'fbrekke@yahoo.com',1,'araucaria angustifolia'),(11,10,'gabriellygoncalveslima@jourrapide.com',1,'syzygium aromaticum'),(12,7,'raulrdavis@rhyta.com',3,'magnoliophyta'),(13,8,'raulrdavis@rhyta.com',3,'magnoliophyta'),(14,9,'helga.hickle@hotmail.com',3,'fitzroya cupressoides');
/*!40000 ALTER TABLE `albero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bancale`
--

DROP TABLE IF EXISTS `bancale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bancale` (
  `id` int(11) NOT NULL,
  `nomespecie` varchar(45) NOT NULL,
  `dataordine` date DEFAULT NULL,
  `oraordine` time DEFAULT NULL,
  `dataspedizione` date NOT NULL,
  `oraspedizione` time NOT NULL,
  `partitaivafornitore` varchar(20) DEFAULT NULL,
  `alberiperbancale` int(11) NOT NULL,
  `idforesta` int(11) DEFAULT NULL,
  `quantitaxteamtrees` int(11) NOT NULL,
  `quantitaxforesta` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contiene_idx` (`nomespecie`),
  KEY `fornisce_idx` (`partitaivafornitore`),
  KEY `inviato_idx` (`idforesta`),
  CONSTRAINT `contiene` FOREIGN KEY (`nomespecie`) REFERENCES `speciealbero` (`nome`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fornisce` FOREIGN KEY (`partitaivafornitore`) REFERENCES `fornitore` (`partitaiva`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `inviato` FOREIGN KEY (`idforesta`) REFERENCES `foresta` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bancale`
--

LOCK TABLES `bancale` WRITE;
/*!40000 ALTER TABLE `bancale` DISABLE KEYS */;
INSERT INTO `bancale` VALUES (1,'thuja plicata','2019-10-30','08:00:00','2019-10-30','14:00:00','745651296',6,4,0,6),(2,'thuja plicata','2019-10-30','08:00:00','2019-10-30','14:00:00','745651296',6,4,0,6),(3,'picea sitchensis','2019-10-30','08:00:00','2019-10-30','14:00:00','745651296',6,4,0,4),(4,'araucaria angustifolia','2019-10-30','08:10:00','2019-10-30','16:00:00','12.709.923/0001-04',9,2,0,9),(5,'tsuga heterophylla','2019-10-30','23:00:00','2019-10-31','11:51:23','745651296',6,4,0,6),(6,'caesalpinia echinata','2019-10-30','23:10:00','2019-10-31','14:21:46','12.709.923/0001-04',16,2,0,16),(7,'araucaria angustifolia','2019-10-31','09:00:00','2019-10-31','11:53:34','12.709.923/0001-04',9,1,0,8),(8,'araucaria angustifolia','2019-10-31','10:00:00','2019-10-31','15:23:00','02213840164',9,NULL,9,0),(9,'orchidaceae','2019-11-02','13:00:00','2019-11-03','09:12:36','12.709.923/0001-04',16,2,0,16),(10,'magnoliophyta','2019-11-03','23:00:00','2019-11-04','16:57:21','02213840164',12,NULL,12,0),(11,'fitzroya cupressoides','2019-11-04','08:00:00','2019-11-04','15:16:17','918442449',16,NULL,14,0),(12,'syzygium aromaticum','2019-11-04','11:00:00','2019-11-05','10:26:42','12.709.923/0001-04',16,1,0,16),(13,'ficus benghalensis','2019-11-05','15:00:00','2019-11-06','13:25:56','5643534546567',16,NULL,16,0),(14,'hevea brasiliensis','2019-11-05','15:00:00','2019-11-06','13:25:56','5643534546567',16,NULL,16,0),(15,'magnoliophyta',NULL,NULL,'2019-11-09','11:00:34',NULL,8,3,0,8),(16,'fitzroya cupressoides',NULL,NULL,'2019-11-09','11:00:34',NULL,8,3,0,8);
/*!40000 ALTER TABLE `bancale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donazione`
--

DROP TABLE IF EXISTS `donazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donazione` (
  `id` int(11) NOT NULL,
  `emaildonatore` varchar(45) NOT NULL,
  `data` date NOT NULL,
  `ora` time NOT NULL,
  `importo` int(11) NOT NULL,
  `nomevisualizzato` varchar(45) DEFAULT NULL,
  `messaggiovisualizzato` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fa_idx` (`emaildonatore`),
  CONSTRAINT `fa` FOREIGN KEY (`emaildonatore`) REFERENCES `persona` (`email`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donazione`
--

LOCK TABLES `donazione` WRITE;
/*!40000 ALTER TABLE `donazione` DISABLE KEYS */;
INSERT INTO `donazione` VALUES (1,'elon.musk@gmail.com','2019-10-30','01:00:00',1000000,'Elon Musk','For treebeard'),(2,'jack.dorsey@gmail.com','2019-10-30','02:01:24',150000,'Jack Dorsey',NULL),(3,'tobias.lutke@gmail.com','2019-10-30','22:00:00',1000001,'Tobi Lutke','For the lorax'),(4,'jack.dorsey@gmail.com','2019-10-31','08:11:23',200000,'Jack Dorsey',NULL),(5,'fbrekke@yahoo.com','2019-11-01','16:31:25',1,NULL,'For glory'),(6,'marcorossi@alice.it','2019-11-02','12:31:46',20,'Marco Rossi','Bella iniziativa'),(7,'kathonaviktoria@dayrep.com','2019-11-03','22:17:16',5,'Katty','Jò munka'),(8,'damirvanoers@dayrep.com','2019-11-03','22:52:16',5,'Damir','Ik hoop dat dit helpt'),(9,'helga.hickle@hotmail.com','2019-11-04','01:02:25',15,NULL,NULL),(10,'raulrdavis@rhyta.com','2019-11-04','10:07:40',50,'Raul','Because I care');
/*!40000 ALTER TABLE `donazione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foresta`
--

DROP TABLE IF EXISTS `foresta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foresta` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `nazione` varchar(25) NOT NULL,
  `estensione` int(11) NOT NULL,
  `rischio` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foresta`
--

LOCK TABLES `foresta` WRITE;
/*!40000 ALTER TABLE `foresta` DISABLE KEYS */;
INSERT INTO `foresta` VALUES (1,'foresta atlantica','brasile',1234000,4),(2,'foresta pluviale dell\'amazzonia','brasile',5500000,4),(3,'foresta pluviale di valdivia','cile',248100,4),(4,'foresta nazionale tongass','alaska',68068,5),(5,'foresta pluviale tropicale di xishuangbanna','cina',2402,3),(6,'foresta di sundarbans','bangladesh',1395,2),(7,'parco nazionale di kinabalu','malaysia',754,1),(8,'foresta di dvinsko-pinezhsky','russia',7000,4);
/*!40000 ALTER TABLE `foresta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornitore`
--

DROP TABLE IF EXISTS `fornitore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornitore` (
  `partitaiva` varchar(20) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `citta` varchar(45) NOT NULL,
  `nazione` varchar(25) NOT NULL,
  `numerotelefono` varchar(15) NOT NULL,
  PRIMARY KEY (`partitaiva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornitore`
--

LOCK TABLES `fornitore` WRITE;
/*!40000 ALTER TABLE `fornitore` DISABLE KEYS */;
INSERT INTO `fornitore` VALUES ('02213840164','centroverde','caravaggio','italia','+39036353134'),('12.709.923/0001-04','nursery manequinho lopez','san paolo','brasile','+551138876761'),('5643534546567','hirata nursery','kurume','giappone','+81942473402'),('745651296','alaska nursery sales','anchorage','alaska','+19075633833'),('918442449','nature hills nursery, inc.','omaha','nebraska','+18448465724');
/*!40000 ALTER TABLE `fornitore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `email` varchar(45) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cognome` varchar(45) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `eta` int(11) DEFAULT NULL,
  `sesso` varchar(1) DEFAULT NULL,
  `associazione` varchar(45) DEFAULT NULL,
  `donatore` tinyint(1) NOT NULL,
  `piantatore` tinyint(1) NOT NULL,
  `stato` varchar(25) NOT NULL,
  `nazionecorrente` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES ('bonitawilliams@dayrep.com','bonita','williams','+18302172902',29,NULL,'u.s. forest service',0,1,'texas','alaska'),('damirvanoers@dayrep.com','damir','van oers','+310647564141',62,'M',NULL,1,0,'olanda',NULL),('elon.musk@gmail.com','elon','musk','+16508243321',48,'M',NULL,1,0,'california',NULL),('fbrekke@yahoo.com','deonte','mitchell','+610790957179',37,'M','wwoof',1,1,'australia','brasile'),('gabriellygoncalveslima@jourrapide.com','gabrielly','lima','+553170887199',22,'F','itpa',0,1,'brasile','brasile'),('helga.hickle@hotmail.com','calista','stoltenberg','+17395643925',NULL,'F','u.s. forest service',1,1,'alaska','cile'),('jack.dorsey@gmail.com','jack','dorsey','+14152246583',43,'M',NULL,1,0,'california',NULL),('kathonaviktoria@dayrep.com','kathona','viktoria','+3662781379',51,'F',NULL,1,0,'ungheria',NULL),('leilagomesbarros@armyspy.com','leila','barros','+551166259469',25,'F','itpa',0,1,'brasile','brasile'),('marcorossi@alice.it','marco','rossi','+393315848721',37,'M',NULL,1,0,'italia',NULL),('randalleg@hotmail.com','randal','legros','+610743702500',17,'M','wwoof',0,1,'australia','brasile'),('raulrdavis@rhyta.com','raul','davis','+17748404766',41,'M','u.s. forest service',1,1,'massachusets','cile'),('tobias.lutke@gmail.com','tobias','lutke','+16137228500',38,'M',NULL,1,0,'canada',NULL);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `speciealbero`
--

DROP TABLE IF EXISTS `speciealbero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `speciealbero` (
  `nome` varchar(45) NOT NULL,
  `quantitainstock` int(11) NOT NULL,
  `famiglia` varchar(45) NOT NULL,
  `altezzamedia` int(11) NOT NULL,
  PRIMARY KEY (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `speciealbero`
--

LOCK TABLES `speciealbero` WRITE;
/*!40000 ALTER TABLE `speciealbero` DISABLE KEYS */;
INSERT INTO `speciealbero` VALUES ('abies sibirica',0,'pinaceae',35),('agathis borneensis',0,'araucariaceae',50),('araucaria angustifolia',9,'araucariaceae',50),('caesalpinia echinata',0,'fabaceae',13),('corryocactus brevistylus',0,'cactaceae',15),('cyathea',0,'cyatheaceae',10),('ficus benghalensis',16,'moraceae',24),('fitzroya cupressoides',6,'cupressaceae',60),('hevea brasiliensis',16,'euphorbiaceae',30),('magnoliophyta',4,'angiospermae',80),('orchidaceae',0,'orchidaceae',1),('picea abies',0,'pinaceae',40),('picea sitchensis',0,'pinaceae',80),('quercus',0,'fagaceae',30),('rhizophora apiculata',0,'rhizophoraceae',25),('syzygium aromaticum',0,'myrtaceae',15),('thuja plicata',0,'cupressaceae',70),('tsuga heterophylla',0,'pinales',70);
/*!40000 ALTER TABLE `speciealbero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specienative`
--

DROP TABLE IF EXISTS `specienative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specienative` (
  `idforesta` int(11) NOT NULL,
  `nomespecie` varchar(45) NOT NULL,
  PRIMARY KEY (`nomespecie`,`idforesta`),
  KEY `latoforesta_idx` (`idforesta`),
  CONSTRAINT `latoforesta` FOREIGN KEY (`idforesta`) REFERENCES `foresta` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `latospecie` FOREIGN KEY (`nomespecie`) REFERENCES `speciealbero` (`nome`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specienative`
--

LOCK TABLES `specienative` WRITE;
/*!40000 ALTER TABLE `specienative` DISABLE KEYS */;
INSERT INTO `specienative` VALUES (1,'araucaria angustifolia'),(1,'syzygium aromaticum'),(2,'araucaria angustifolia'),(2,'caesalpinia echinata'),(2,'corryocactus brevistylus'),(2,'cyathea'),(2,'orchidaceae'),(3,'fitzroya cupressoides'),(3,'magnoliophyta'),(4,'picea sitchensis'),(4,'thuja plicata'),(4,'tsuga heterophylla'),(5,'ficus benghalensis'),(5,'hevea brasiliensis'),(6,'rhizophora apiculata'),(7,'agathis borneensis'),(7,'quercus'),(8,'abies sibirica'),(8,'picea abies');
/*!40000 ALTER TABLE `specienative` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stockfornitore`
--

DROP TABLE IF EXISTS `stockfornitore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stockfornitore` (
  `partitaivafornitore` varchar(20) NOT NULL,
  `nomespecie` varchar(45) NOT NULL,
  `quantitainstock` int(11) NOT NULL,
  PRIMARY KEY (`partitaivafornitore`,`nomespecie`),
  KEY `stock2_idx` (`nomespecie`),
  CONSTRAINT `stock1` FOREIGN KEY (`partitaivafornitore`) REFERENCES `fornitore` (`partitaiva`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `stock2` FOREIGN KEY (`nomespecie`) REFERENCES `speciealbero` (`nome`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stockfornitore`
--

LOCK TABLES `stockfornitore` WRITE;
/*!40000 ALTER TABLE `stockfornitore` DISABLE KEYS */;
INSERT INTO `stockfornitore` VALUES ('02213840164','araucaria angustifolia',12),('02213840164','fitzroya cupressoides',25),('02213840164','magnoliophyta',97),('12.709.923/0001-04','araucaria angustifolia',0),('12.709.923/0001-04','caesalpinia echinata',6),('12.709.923/0001-04','orchidaceae',24),('12.709.923/0001-04','syzygium aromaticum',123),('5643534546567','araucaria angustifolia',15),('5643534546567','ficus benghalensis',324),('5643534546567','hevea brasiliensis',284),('745651296','picea sitchensis',0),('745651296','thuja plicata',200),('745651296','tsuga heterophylla',54),('918442449','fitzroya cupressoides',0),('918442449','quercus',173);
/*!40000 ALTER TABLE `stockfornitore` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-06 22:45:41
