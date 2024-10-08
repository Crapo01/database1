/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.4.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: fil_rouge_db
-- ------------------------------------------------------
-- Server version	11.4.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorie` (
  `reference` int(11) NOT NULL AUTO_INCREMENT,
  `type_de_bonbon` varchar(50) NOT NULL,
  PRIMARY KEY (`reference`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie`
--

LOCK TABLES `categorie` WRITE;
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` VALUES
(1,'Gourmand'),
(2,'Menthe'),
(3,'Fruit');
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `reference` varchar(6) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `code_postal` int(5) DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `date_de_naissance` date DEFAULT NULL,
  `FK_rgpd` int(11) DEFAULT NULL,
  PRIMARY KEY (`reference`),
  KEY `FK_rgpd` (`FK_rgpd`),
  CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`FK_rgpd`) REFERENCES `rgpd` (`reference`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES
('af-56','Auposte','Fild├¿le','1 rue la villette',77000,'MELUN','1987-04-23',1),
('bb-33','Barbie','Barbara','5 square Jean Valjean',75001,'PARIS','2001-01-14',2),
('dj-26','Daniel','Jack','2 rue de la poup├®e qui tousse',59150,'WATTRELOS','1982-07-20',1),
('ft-45','Fr├¿re','Tuck','Bistro face ├á l\'├®glise',12000,'LE MONASTERE','1973-01-01',1),
('ma-11','Michel','Ang├®lica','14 avenue de la r├®publique',13000,'MARSEILLE','1999-11-25',2);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commandes`
--

DROP TABLE IF EXISTS `commandes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commandes` (
  `numero_de_commande` int(20) NOT NULL,
  `FK_produit` varchar(50) NOT NULL,
  `FK_client` varchar(6) NOT NULL,
  `date_commande` date NOT NULL,
  `quantite` int(20) DEFAULT NULL,
  `FK_etat` int(11) DEFAULT NULL,
  PRIMARY KEY (`numero_de_commande`,`FK_produit`),
  KEY `FK_etat` (`FK_etat`),
  KEY `FK_client` (`FK_client`),
  KEY `FK_produit` (`FK_produit`),
  CONSTRAINT `commandes_ibfk_1` FOREIGN KEY (`FK_etat`) REFERENCES `etat` (`reference`),
  CONSTRAINT `commandes_ibfk_2` FOREIGN KEY (`FK_client`) REFERENCES `clients` (`reference`),
  CONSTRAINT `commandes_ibfk_3` FOREIGN KEY (`FK_produit`) REFERENCES `stock` (`reference`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commandes`
--

LOCK TABLES `commandes` WRITE;
/*!40000 ALTER TABLE `commandes` DISABLE KEYS */;
INSERT INTO `commandes` VALUES
(1,'banana','dj-26','2020-01-15',1,3),
(1,'blackcoffe','dj-26','2020-01-15',2,3),
(1,'menthe1','dj-26','2020-01-15',5,3),
(2,'caramel1','ft-45','2020-02-22',4,3),
(2,'montelimar','ft-45','2020-02-22',7,3),
(3,'exotic','bb-33','2020-03-01',9,3),
(3,'menteur','bb-33','2020-03-01',4,3),
(3,'moka','bb-33','2020-03-01',3,3),
(4,'strawberry','af-56','2020-02-02',2,3),
(5,'exotic','af-56','2020-03-29',1,2),
(5,'menthe1','af-56','2020-03-29',2,2),
(5,'moka','af-56','2020-03-29',8,2),
(5,'montelimar','af-56','2020-03-29',5,2),
(6,'banana','ma-11','2020-04-12',7,1),
(6,'exotic','ma-11','2020-04-12',8,1);
/*!40000 ALTER TABLE `commandes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etat`
--

DROP TABLE IF EXISTS `etat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etat` (
  `reference` int(11) NOT NULL AUTO_INCREMENT,
  `etat` varchar(50) NOT NULL,
  PRIMARY KEY (`reference`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etat`
--

LOCK TABLES `etat` WRITE;
/*!40000 ALTER TABLE `etat` DISABLE KEYS */;
INSERT INTO `etat` VALUES
(1,'validation'),
(2,'preparation'),
(3,'livr├®');
/*!40000 ALTER TABLE `etat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rgpd`
--

DROP TABLE IF EXISTS `rgpd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rgpd` (
  `reference` int(11) NOT NULL AUTO_INCREMENT,
  `mise_a_jour` varchar(50) NOT NULL,
  PRIMARY KEY (`reference`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rgpd`
--

LOCK TABLES `rgpd` WRITE;
/*!40000 ALTER TABLE `rgpd` DISABLE KEYS */;
INSERT INTO `rgpd` VALUES
(1,'1.1'),
(2,'1.2');
/*!40000 ALTER TABLE `rgpd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock` (
  `reference` varchar(50) NOT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `FK_categorie` int(11) DEFAULT NULL,
  `prix` decimal(10,2) DEFAULT NULL,
  `quantite` int(20) DEFAULT NULL,
  PRIMARY KEY (`reference`),
  KEY `FK_categorie` (`FK_categorie`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`FK_categorie`) REFERENCES `categorie` (`reference`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES
('banana','Banane','Pour avoir la banane toute la journ├®e',3,6.00,0),
('blackcoffe','Caf├® noir','Un go├╗t puissant qui r├®veille',1,5.90,1200),
('caramel1','Caramel Beurre sal├®','Breton ou pas, tu vas adorer',1,6.90,5432),
('exotic','Fruits exotiques','Attention aux coups de soleil',3,5.90,1025),
('menteur','Menteur','Ce n\'est pas de la menthe, c\'est un iceberg',2,6.20,324),
('menthe1','Menthe glac├®','Une fraicheur qui d├®coiffe',2,5.90,2623),
('moka','Moka','Robuste oui mais subtile',1,6.00,245),
('montelimar','Le Mont├®limar','Enfin du nougat qu\'on ne doit pas partager',1,6.90,456),
('strawberry','Tagada','Ram├¿nes ta fraise',3,6.20,2469);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2024-09-12 21:20:06
